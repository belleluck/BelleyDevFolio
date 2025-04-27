import express from "express";
import {
  getAllPortfolio,
  getSpecificPortfolioDetail,
  addNewPortfolio,
  updatePortfolio,
  deletePortfolio,
} from "../controllers/portfolioController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAllPortfolio", getAllPortfolio);
router.get("/getSpecificPortfolioDetail", getSpecificPortfolioDetail);
router.post("/addNewPortfolio", addNewPortfolio);
router.put("/updatePortfolio", updatePortfolio);
router.delete("/deletePortfolio", deletePortfolio);

export default router;
