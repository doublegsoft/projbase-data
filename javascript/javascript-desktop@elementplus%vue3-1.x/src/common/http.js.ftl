import axios from 'axios';

const http = axios.create({
  baseURL: 'https://locahost:8081',
  timeout: 5000,
  headers: {
    'Content-Type': 'application/json',
  },
});

http.interceptors.request.use(
  (config) => {
    console.log(`[Request] ${r"${"}config.method.toUpperCase()} ${r"${"}config.url}`);
    return config;
  },
  (error) => {
    console.error('[Request Error]', error);
    return Promise.reject(error);
  }
);

http.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    console.error('[Response Error]', error);
    if (error.response && error.response.status === 404) {
      console.warn('Resource not found!');
    }
    return Promise.reject(error);
  }
);

export default http;