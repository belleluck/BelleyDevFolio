import { pool } from "../config/db.js";

// Get all portfolios
export const getAllHighlightSkills = async () => {
  const { rows } = await pool.query("SELECT * FROM highlight_skills");
  return rows;
};
