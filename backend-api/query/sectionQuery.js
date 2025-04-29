import { pool } from "../config/db.js";

// Get all portfolios
export const getAllSections = async () => {
  const { rows } = await pool.query("SELECT * FROM sections");
  return rows;
};
