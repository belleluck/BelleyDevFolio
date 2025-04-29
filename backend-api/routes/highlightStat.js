import express from "express";
import { getAllHighlightStat } from "../controllers/highlightStatController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAllHighlightStat", getAllHighlightStat);

export default router;
