import express from "express";
import { getAuthor } from "../controllers/authorController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAuthor", getAuthor);

export default router;
