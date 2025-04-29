import { getAllSkills } from "../query/skillQuery.js";

// Get all skills
// api/section/getAllSection
export const getAllSkill = async (req, res, next) => {
  try {
    const skills = await getAllSkills();

    const formattedSkills = skills.map((item) => ({
      skillTitle: item.skill_title,
      skillDescription: item.skill_description,
      skillIcon: item.skill_icon,
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
