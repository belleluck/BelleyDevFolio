import express from "express";
import { getAllSection } from "../controllers/sectionController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAllSection", getAllSection);

export default router;
