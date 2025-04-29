import { getAllHighlightStats } from "../query/highlightStatQuery.js";

// Get all stats
// api/highlightStat/getAllHighlightStat
export const getAllHighlightStat = async (req, res, next) => {
  try {
    const skills = await getAllHighlightStats();

    const formattedStats = skills.map((item) => ({
      title: item.title,
      value: item.value,
      unit: item.unit,
      iconName: item.icon_name,
    }));

    res.json({
      status: "success",
      message: "Stats fetched successfully",
      data: formattedStats,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to fetch stats",
      error: err.message,
    });
    next(err);
  }
};
