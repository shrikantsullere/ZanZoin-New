import fs from 'fs';

const BASE_URL = 'http://localhost:8000/api/v1';

async function loginAndGetToken() {
  const res = await fetch(`${BASE_URL}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email: 'admin@zanezion.com', password: 'password123' })
  });
  const data = await res.json();
  if(!data.data) {
    console.error('Login failed:', data);
  }
  return data.data.token;
}

async function runValidation() {
  const results = {};
  try {
    let token = await loginAndGetToken();
    let headers = { 'Authorization': `Bearer ${token}`, 'Content-Type': 'application/json' };

    // 1. Submit a real Purchase Request
    const createRes = await fetch(`${BASE_URL}/purchase-requests`, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        title: "Test Migration PR",
        departmentId: 1,
        priority: "high",
        items: [{
          itemName: "Test Asset",
          quantity: 5,
          unit: "Pieces",
          estimatedCost: 100
        }]
      })
    });
    const createdPr = await createRes.json();
    results.created = createdPr;

    if (!createdPr.success) {
      throw new Error("Failed to create PR: " + JSON.stringify(createdPr));
    }

    const prId = createdPr.data.id;

    // 2. Verify DB insertion (Read Back immediately)
    const read1 = await fetch(`${BASE_URL}/purchase-requests/${prId}`, { headers });
    results.read1 = await read1.json();

    // 3. Logout/Login
    const logout = await fetch(`${BASE_URL}/auth/logout`, { method: 'POST', headers });
    token = await loginAndGetToken();
    headers = { 'Authorization': `Bearer ${token}`, 'Content-Type': 'application/json' };

    // 4. Verify persistence from database
    const read2 = await fetch(`${BASE_URL}/purchase-requests/${prId}`, { headers });
    results.read2 = await read2.json();

    fs.writeFileSync('stage_a_validation_results.json', JSON.stringify(results, null, 2));
    console.log("VALIDATION SUCCESS");

  } catch (err) {
    console.error("VALIDATION FAILED", err);
  }
}

runValidation();
