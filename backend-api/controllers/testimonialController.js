import { getAllTestimonials } from "../query/testimonialQuery.js";

// Get all testimonials
// api/testimonial/getAllTestimonial
export const getAllTestimonial = async (req, res, next) => {
  try {
    const testimonials = await getAllTestimonials();

    const formattedTestimonials = testimonials.map((item) => ({
      profilePhoto: item.profile_photo,
      name: item.name,
      occupation: item.occupation,
      company: item.company,
      review: item.review,
      linkedin: item.linkedin,
    }));

    res.json({
      status: "success",
      message: "Testimonials fetched successfully",
      data: formattedTestimonials,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to fetch Testimonials",
      error: err.message,
    });
    next(err);
  }
};
