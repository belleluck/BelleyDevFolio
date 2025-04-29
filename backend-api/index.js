import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import bodyParser from "body-parser";
import authRoutes from "./routes/auth.js";
import authorRoutes from "./routes/author.js";
import sectionRoutes from "./routes/section.js";
import highlightSkillRoutes from "./routes/highlightSkill.js";
import skillRoutes from "./routes/skill.js";
import highlightStatRoutes from "./routes/highlightStat.js";
import portfolioRoutes from "./routes/portfolio.js";
import testimonialRoutes from "./routes/testimonial.js";
import contactRoutes from "./routes/contact.js";
import { errorHandler } from "./middlewares/errorHandler.js";

dotenv.config();
const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/author", authorRoutes);
app.use("/api/section", sectionRoutes);
app.use("/api/highlightSkill", highlightSkillRoutes);
app.use("/api/skill", skillRoutes);
app.use("/api/highlightStat", highlightStatRoutes);
app.use("/api/portfolio", portfolioRoutes);
app.use("/api/testimonial", testimonialRoutes);
app.use("/api/contact", contactRoutes);

// Root route
app.get("/", (req, res) => {
  res.send("API Running...");
});

// Error handler
app.use(errorHandler);

app.listen(process.env.PORT, () => {
  console.log(`Server running on http://localhost:${process.env.PORT}`);
});
