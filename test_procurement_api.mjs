import fs from 'fs';

const BASE_URL = 'http://localhost:8000/api/v1';

async function loginAndGetToken() {
  const res = await fetch(`${BASE_URL}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      email: 'admin@zanezion.com',
      password: 'password123'
    })
  });
  const data = await res.json();
  return data.data.token;
}

async function testEndpoints() {
  const token = await loginAndGetToken();
  const headers = { 
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };
  const results = {};

  try {
    // 1. GET Departments
    const deptRes = await fetch(`${BASE_URL}/departments`, { headers });
    results.departments = await deptRes.json();
    const departmentId = results.departments.data?.departments?.[0]?.id || results.departments.data?.[0]?.id;
    
    // 2. GET Purchase Requests
    const prGetRes = await fetch(`${BASE_URL}/purchase-requests`, { headers });
    results.getPurchaseRequests = await prGetRes.json();

    // 3. POST Purchase Request (Failure)
    const prFailRes = await fetch(`${BASE_URL}/purchase-requests`, {
      method: 'POST',
      headers,
      body: JSON.stringify({})
    });
    results.postPurchaseRequestValidation = await prFailRes.json();

    // 4. POST Purchase Request (Success)
    let prId = null;
    if (departmentId) {
      const prSuccRes = await fetch(`${BASE_URL}/purchase-requests`, {
        method: 'POST',
        headers,
        body: JSON.stringify({
          title: "Test PR 123",
          departmentId: departmentId,
          priority: "medium",
          items: [{
            itemName: "Laptops",
            quantity: 2,
            unit: "Pieces",
            estimatedCost: 1500.00
          }]
        })
      });
      results.postPurchaseRequestSuccess = await prSuccRes.json();
      prId = results.postPurchaseRequestSuccess.data?.id;
    }

    // 5. GET RFQs
    const rfqGetRes = await fetch(`${BASE_URL}/rfqs`, { headers });
    results.getRfqs = await rfqGetRes.json();

    // 6. POST RFQ (Failure)
    const rfqFailRes = await fetch(`${BASE_URL}/rfqs`, {
      method: 'POST',
      headers,
      body: JSON.stringify({})
    });
    results.postRfqValidation = await rfqFailRes.json();

    // 7. POST RFQ (Success)
    const vendorRes = await fetch(`${BASE_URL}/vendors`, { headers });
    const vendorData = await vendorRes.json();
    const vendorId = vendorData.data?.vendors?.[0]?.id || vendorData.data?.[0]?.id;

    if (vendorId && prId) {
       const rfqSuccRes = await fetch(`${BASE_URL}/rfqs`, {
          method: 'POST',
          headers,
          body: JSON.stringify({
             purchaseRequestId: prId,
             vendorId: vendorId
          })
       });
       results.postRfqSuccess = await rfqSuccRes.json();
    } else {
        results.postRfqSuccess = "Missing vendorId or prId";
    }

    fs.writeFileSync('procurement_test_results.json', JSON.stringify(results, null, 2));
    console.log("TESTS COMPLETE");

  } catch (error) {
    console.error("Fatal Error:", error.message);
  }
}

testEndpoints();
