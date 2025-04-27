import { pool } from "../config/db.js";

// Get all portfolios
export const getAllPortfolios = async () => {
  const { rows } = await pool.query("SELECT * FROM portfolios");
  return rows;
};

// Get portfolio by ID
export const getPortfolioById = async (id) => {
  const { rows } = await pool.query("SELECT * FROM portfolios WHERE id = $1", [id]);
  return rows[0];
};

// Add a new portfolio
export const insertPortfolio = async (title, description, imageUrl) => {
  await pool.query("INSERT INTO portfolios (title, description, image_url) VALUES ($1, $2, $3)", [
    title,
    description,
    imageUrl,
  ]);
};

// Update portfolio
export const updatePortfolioById = async (id, title, description, imageUrl) => {
  await pool.query("UPDATE portfolios SET title = $1, description = $2, image_url = $3 WHERE id = $4", [
    title,
    description,
    imageUrl,
    id,
  ]);
};

// Delete portfolio
export const deletePortfolioById = async (id) => {
  await pool.query("DELETE FROM portfolios WHERE id = $1", [id]);
};
