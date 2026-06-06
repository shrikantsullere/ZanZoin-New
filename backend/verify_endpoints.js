import prisma from './src/config/db.js';

async function verify() {
  const email = 'admin@zanezion.com'; // ADMIN role
  
  let token;
  try {
    const loginRes = await fetch('http://localhost:8000/api/v1/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password: 'password123' })
    });
    const loginData = await loginRes.json();
    token = loginData.data?.token || loginData.token;
    if (!token) throw new Error('Login failed: ' + JSON.stringify(loginData));
  } catch (err) {
    console.error('Login error:', err.message);
    process.exit(1);
  }

  const endpoints = ['/api/v1/items', '/api/v1/clients', '/api/v1/vendors'];
  
  for (const endpoint of endpoints) {
    try {
      const res = await fetch(`http://localhost:8000${endpoint}`, {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      const data = await res.json();
      console.log(`\nEndpoint: GET ${endpoint}`);
      console.log(`Status Code: ${res.status}`);
      console.log(`Payload (first item):`, JSON.stringify(data?.data?.[0] || data?.[0] || data || null, null, 2));
    } catch (err) {
      console.log(`\nEndpoint: GET ${endpoint}`);
      console.log(`Error:`, err.message);
    }
  }
}

verify().finally(() => {
  if (prisma && typeof prisma.$disconnect === 'function') prisma.$disconnect();
});
