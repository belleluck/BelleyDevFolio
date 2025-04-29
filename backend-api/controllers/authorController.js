import { getAllAuthor } from "../query/authorProfileQuery.js";

// Get all sections
// api/section/getAllSection
export const getAuthor = async (req, res, next) => {
  try {
    const author = await getAllAuthor();

    const formattedAuthor = author.map((item) => ({
      authorName: item.name,
      authorTitle: item.title,
      authorEmail: item.email,
      authorPhone1: item.phone1,
      authorPhone2: item.phone2,
      authorProfileImage: item.profile_image,
      authorProfileBackgroundImage: item.profile_background_image,
      authorSocialLinks: item.social_links,
    }));

    res.json({
      status: "success",
      message: "Author fetched successfully",
      data: formattedAuthor,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to fetch author",
      error: err.message,
    });
    next(err);
  }
};
