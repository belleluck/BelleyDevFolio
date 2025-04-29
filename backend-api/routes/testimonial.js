import express from "express";
import { getAllTestimonial } from "../controllers/testimonialController.js";

const router = express.Router();

// Define routes and map to controller functions
router.get("/getAllTestimonial", getAllTestimonial);

export default router;
