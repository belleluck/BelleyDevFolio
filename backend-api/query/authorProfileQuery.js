import { pool } from "../config/db.js";

// Get all portfolios
export const getAllAuthor = async () => {
  const { rows } = await pool.query("SELECT * FROM author");
  return rows;
};
