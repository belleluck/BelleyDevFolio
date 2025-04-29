import { pool } from "../config/db.js";

// Get all portfolios
export const getAllTestimonials = async () => {
  const { rows } = await pool.query("SELECT * FROM testimonials");
  return rows;
};
