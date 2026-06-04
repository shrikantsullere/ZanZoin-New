import axios from 'axios';

export const API_BASE_URL = 'http://localhost:3000/api/v1';
export const BACKEND_ORIGIN = 'http://localhost:3000';

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

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json'
  }
});

// Add a request interceptor to attach the JWT token
api.interceptors.request.use(
  (config) => {
    // Attempt to get token from localStorage (assuming it's stored under 'user')
    const userStr = localStorage.getItem('user');
    if (userStr) {
      try {
        const userObj = JSON.parse(userStr);
        if (userObj && userObj.token) {
          config.headers.Authorization = `Bearer ${userObj.token}`;
        }
      } catch (err) {
        // Ignore parse error
      }
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Add response interceptor
api.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (error.response && error.response.status === 401) {
      // Handle unauthorized error (e.g. redirect to login)
      // localStorage.removeItem('user');
      // window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export default api;
