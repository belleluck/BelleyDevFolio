import {
  getAllPortfolios,
  getPortfolioById,
  insertPortfolio,
  updatePortfolioById,
  deletePortfolioById,
} from "../query/portfolioQuery.js";

import { formatDate } from "../utils/formatDate.js";

// Get all portfolios
export const getAllPortfolio = async (req, res, next) => {
  try {
    const portfolios = await getAllPortfolios();

    const formattedPortfolios = portfolios.map((item) => ({
      title: item.title,
      date: formatDate(item.date), // Custom date formatting
      category: item.category,
      cover_image: item.cover_image,
      description: item.description,
    }));

    // res.json(formattedPortfolios);
    res.json({
      status: "success",
      message: "Portfolios fetched successfully",
      data: formattedPortfolios,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to fetch portfolios",
      error: err.message,
    });
    next(err);
  }
};

// Get specific portfolio detail
export const getSpecificPortfolioDetail = async (req, res, next) => {
  const { id } = req.query;
  try {
    const portfolio = await getPortfolioById(id);
    if (!portfolio) {
      return res.status(404).json({ message: "Portfolio not found" });
    }
    res.json(portfolio);
  } catch (err) {
    next(err);
  }
};

// Add new portfolio
export const addNewPortfolio = async (req, res, next) => {
  const { title, description, imageUrl } = req.body;
  try {
    await insertPortfolio(title, description, imageUrl);
    res.status(201).json({ message: "Portfolio added successfully" });
  } catch (err) {
    next(err);
  }
};

// Update portfolio (may add/delete based on logic)
export const updatePortfolio = async (req, res, next) => {
  const { id, title, description, imageUrl, shouldDelete } = req.body;

  try {
    if (shouldDelete) {
      await deletePortfolioById(id);
      return res.json({ message: "Portfolio deleted during update process" });
    }

    if (!id) {
      await insertPortfolio(title, description, imageUrl);
      return res.status(201).json({ message: "Portfolio added during update process" });
    }

    await updatePortfolioById(id, title, description, imageUrl);
    res.json({ message: "Portfolio updated successfully" });
  } catch (err) {
    next(err);
  }
};

// Delete portfolio
export const deletePortfolio = async (req, res, next) => {
  const { id } = req.query;

  try {
    await deletePortfolioById(id);
    res.json({ message: "Portfolio deleted successfully" });
  } catch (err) {
    next(err);
  }
};
