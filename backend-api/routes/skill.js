import express from "express";
import { getAllSkill } from "../controllers/skillController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAllSkill", getAllSkill);

export default router;
