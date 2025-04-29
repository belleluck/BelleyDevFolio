import { getAllHighlightSkills } from "../query/highlightSkillQuery.js";

// Get all skills
// api/highlightSkill/getAllHighlightSkill
export const getAllHighlightSkill = async (req, res, next) => {
  try {
    const skills = await getAllHighlightSkills();

    const formattedSkills = skills.map((item) => ({
      title: item.title,
      proficiency: item.proficiency,
    }));

    res.json({
      status: "success",
      message: "Skills fetched successfully",
      data: formattedSkills,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to fetch skills",
      error: err.message,
    });
    next(err);
  }
};
