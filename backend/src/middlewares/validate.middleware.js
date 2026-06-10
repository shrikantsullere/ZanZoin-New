import { sendResponse } from '../utils/response.js';

export const validate = (schema) => (req, res, next) => {
  try {
    if (schema.shape && (schema.shape.body || schema.shape.query || schema.shape.params)) {
      schema.parse({
        body: req.body,
        query: req.query,
        params: req.params,
      });
    } else {
      schema.parse(req.body);
    }
    next();
  } catch (err) {
    if (err && (err.issues || err.errors)) {
      const issues = err.issues || err.errors;
      const errorMessages = issues.map((e) => {
        const field = e.path[e.path.length - 1];
        return `${field}: ${e.message}`;
      }).join(', ');
      
      console.error("[VALIDATION ERROR]:", errorMessages);
      
      // If the user requested { success: false, message: ..., field: ... }
      // we can return it cleanly for the first error:
      return res.status(400).json({
        success: false,
        message: errorMessages,
        field: issues[0]?.path[issues[0]?.path.length - 1] || null
      });
    }
    return sendResponse(res, 400, `Validation Error: ${err.message || err}`);
  }
};
