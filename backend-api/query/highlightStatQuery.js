import { pool } from "../config/db.js";

// Get all portfolios
export const getAllHighlightStats = async () => {
  const { rows } = await pool.query("SELECT * FROM highlight_statistics");
  return rows;
};
