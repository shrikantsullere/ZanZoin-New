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
    if (err && err.errors) {
      const errorMessages = err.errors.map((e) => {
        const field = e.path[e.path.length - 1];
        return `${field}: ${e.message}`;
      }).join(', ');
      return sendResponse(res, 400, `Validation Failed: ${errorMessages}`);
    }
    return sendResponse(res, 400, `Validation Error: ${err.message || err}`);
  }
};
