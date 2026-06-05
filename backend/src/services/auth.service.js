import crypto from 'crypto';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import * as userRepository from '../repositories/user.repository.js';
import { config } from '../config/env.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';
import { sendEmail } from '../utils/mailer.js';
import prisma from '../config/db.js';

export const loginUser = async (email, password, tenantId, ipAddress, userAgent) => {
  const user = await userRepository.findUserByEmailAndTenant(email, tenantId);
  if (!user || user.status?.toUpperCase() !== 'ACTIVE') {
    throw new AppError('Invalid credentials or inactive user', 401);
  }

  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) {
    throw new AppError('Invalid credentials', 401);
  }

  const token = jwt.sign(
    { id: user.id, email: user.email, roleId: user.roleId, tenantId: user.tenantId },
    config.jwtSecret,
    { expiresIn: config.jwtExpiresIn }
  );

  const refreshToken = jwt.sign(
    { id: user.id },
    config.jwtRefreshSecret,
    { expiresIn: config.jwtRefreshExpiresIn }
  );

  // Calculate 7 days expiry for DB
  const expiresAt = new Date();
  expiresAt.setDate(expiresAt.getDate() + 7);

  await prisma.refreshToken.create({
    data: {
      token: refreshToken,
      userId: user.id,
      expiresAt
    }
  });

  await logAudit({
    module: 'AUTH',
    action: 'LOGIN',
    description: `User login: ${user.email}`,
    performedBy: user.id
  });

  return { user, token, refreshToken };
};

export const refreshToken = async (tokenStr, ipAddress, userAgent) => {
  try {
    const decoded = jwt.verify(tokenStr, config.jwtRefreshSecret);
    const dbToken = await prisma.refreshToken.findUnique({ where: { token: tokenStr } });

    if (!dbToken || dbToken.expiresAt < new Date()) {
      throw new Error();
    }

    const user = await userRepository.findUserById(decoded.id);
    if (!user || user.status?.toUpperCase() !== 'ACTIVE') throw new Error();

    // Revoke old token
    await prisma.refreshToken.delete({ where: { token: tokenStr } });

    // Generate new tokens
    const newToken = jwt.sign(
      { id: user.id, email: user.email, roleId: user.roleId, tenantId: user.tenantId },
      config.jwtSecret,
      { expiresIn: config.jwtExpiresIn }
    );

    const newRefreshToken = jwt.sign(
      { id: user.id },
      config.jwtRefreshSecret,
      { expiresIn: config.jwtRefreshExpiresIn }
    );

    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7);

    await prisma.refreshToken.create({
      data: {
        token: newRefreshToken,
        userId: user.id,
        expiresAt
      }
    });

    return { token: newToken, refreshToken: newRefreshToken };
  } catch (error) {
    throw new AppError('Invalid or expired refresh token', 401);
  }
};

export const logoutUser = async (userId, tokenStr, ipAddress, userAgent) => {
  if (tokenStr) {
    await prisma.refreshToken.deleteMany({ where: { token: tokenStr } });
  }
  await logAudit({
    module: 'AUTH',
    action: 'LOGOUT',
    performedBy: userId
  });
  return true;
};

export const getProfile = async (userId) => {
  const user = await userRepository.findUserById(userId);
  if (!user) throw new AppError('User not found', 404);
  user.password = undefined;
  return user;
};

export const updateProfile = async (userId, data, tenantId, ipAddress, userAgent) => {
  const updated = await userRepository.updateUser(userId, data);
  updated.password = undefined;

  await logAudit({
    module: 'AUTH',
    action: 'UPDATE_PROFILE',
    description: 'Updated user profile',
    newValue: data,
    performedBy: userId
  });
  return updated;
};

export const changePassword = async (userId, tenantId, currentPassword, newPassword, ipAddress, userAgent) => {
  const user = await userRepository.findUserById(userId);
  if (!user) throw new AppError('User not found', 404);

  const isMatch = await bcrypt.compare(currentPassword, user.password);
  if (!isMatch) throw new AppError('Incorrect current password', 400);

  const hashedPassword = await bcrypt.hash(newPassword, 10);
  await userRepository.updateUser(userId, { password: hashedPassword });

  await logAudit({
    module: 'AUTH',
    action: 'CHANGE_PASSWORD',
    description: 'Changed password',
    performedBy: userId
  });

  return true;
};

export const forgotPassword = async (email, tenantId) => {
  const user = await userRepository.findUserByEmailAndTenant(email, tenantId);
  if (!user) throw new AppError('User not found', 404);

  // Generate Reset Token
  const resetToken = crypto.randomBytes(32).toString('hex');
  const hashedToken = crypto.createHash('sha256').update(resetToken).digest('hex');

  const resetTokenExpiry = new Date();
  resetTokenExpiry.setMinutes(resetTokenExpiry.getMinutes() + 10); // 10 minutes

  await userRepository.updateUser(user.id, {
    resetToken: hashedToken,
    resetTokenExpiry
  });

  // Send Email
  const resetUrl = `http://localhost:3000/reset-password/${resetToken}`;
  const message = `You requested a password reset. Please go to this link to reset your password:\n\n${resetUrl}\n\nIf you did not request this, please ignore this email.`;

  await sendEmail(user.email, 'Zanezion Password Reset', message);

  await logAudit({
    module: 'AUTH',
    action: 'FORGOT_PASSWORD',
    description: `Password reset requested for ${user.email}`,
    performedBy: user.id
  });

  return 'Password reset link sent to email';
};

export const resetPassword = async (token, newPassword) => {
  const hashedToken = crypto.createHash('sha256').update(token).digest('hex');

  // Find user by token
  const user = await prisma.user.findFirst({
    where: {
      resetToken: hashedToken,
      resetTokenExpiry: { gt: new Date() }
    }
  });

  if (!user) {
    throw new AppError('Token is invalid or has expired', 400);
  }

  const hashedPassword = await bcrypt.hash(newPassword, 10);

  await userRepository.updateUser(user.id, {
    password: hashedPassword,
    resetToken: null,
    resetTokenExpiry: null
  });

  // Cleanup all active refresh tokens for security
  await prisma.refreshToken.deleteMany({ where: { userId: user.id } });

  await logAudit({
    module: 'AUTH',
    action: 'RESET_PASSWORD',
    description: `Password successfully reset for ${user.email}`,
    performedBy: user.id
  });

  return true;
};
