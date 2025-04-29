import express from "express";
import { getAllHighlightSkill } from "../controllers/highlightSkillController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAllHighlightSkill", getAllHighlightSkill);

export default router;
