import { pool } from "../config/db.js";

// Get all portfolios
export const getAllSkills = async () => {
  const { rows } = await pool.query("SELECT * FROM skills");
  return rows;
};
