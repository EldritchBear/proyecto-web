const API_URL = "https://backend-web.fly.dev/";

export const login = async (email, password) => {
  try {
    const response = await fetch(`${API_URL}/sessions/sign_in`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    });

    if (!response.ok) {
      throw new Error('Login failed');
    }

    const data = await response.json();
    const { auth_token } = data;
    localStorage.setItem('auth_token', auth_token);
    return data;
  } catch (error) {
    console.error('Login error', error);
    throw error;
  }
};

export const logout = async () => {
  try {
    const token = localStorage.getItem('auth_token');
    if (!token) {
      throw new Error('No token found');
    }

    const response = await fetch(`${API_URL}/sessions/sign_out`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${token}`,
      },
    });

    if (!response.ok) {
      throw new Error('Logout failed');
    }

    localStorage.removeItem('auth_token');
  } catch (error) {
    console.error('Logout error', error);
    throw error;
  }
};

export const isLoggedIn = () => !!localStorage.getItem('auth_token');

export const fetchWithAuth = async (url, options = {}) => {
  const token = localStorage.getItem('auth_token');

  const headers = {
    ...options.headers,
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json',
  };

  const response = await fetch(API_URL + url, { ...options, headers });
  if (!response.ok) {
    throw new Error('Request failed');
  }
  return response.json();
};
