export const API_BASE_URL = 'http://localhost:8000/api/v1';
export const BACKEND_ORIGIN = 'http://localhost:8000';

export const toAbsoluteImageUrl = (rawPath) => {
  if (!rawPath) return null;
  if (typeof rawPath === 'object' && rawPath != null && typeof rawPath.url === 'string') {
    return toAbsoluteImageUrl(rawPath.url);
  }
  if (typeof rawPath !== 'string') return null;
  const trimmed = rawPath.trim();
  if (!trimmed) return null;
  if (trimmed.startsWith('http') || trimmed.startsWith('data:')) return trimmed;
  const path = trimmed.startsWith('/') ? trimmed : `/${trimmed.replace(/\\/g, '/')}`;
  return `${BACKEND_ORIGIN}${path}`;
};
