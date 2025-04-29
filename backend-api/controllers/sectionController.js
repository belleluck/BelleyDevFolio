import { getAllSections } from "../query/sectionQuery.js";

// Get all sections
// api/section/getAllSection
export const getAllSection = async (req, res, next) => {
  try {
    const sections = await getAllSections();

    const formattedSections = sections.map((item) => ({
      sectionName: item.section_name,
      sectionHeadline: item.section_headline,
      sectionDescription: item.section_description,
      isDisplay: item.is_display,
    }));

    res.json({
      status: "success",
      message: "Sections fetched successfully",
      data: formattedSections,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to fetch sections",
      error: err.message,
    });
    next(err);
  }
};
