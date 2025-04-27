import { pool } from "../config/db.js";
import { sendEmail } from "../services/emailService.js";
import { HTTP_STATUS, MESSAGES } from "../config/constants.js";

export const contactForm = async (req, res, next) => {
  const { name, email, subject, message } = req.body;

  try {
    await sendEmail({ name, email, subject, message });

    await pool.query(
      "INSERT INTO contact_messages (contact_name, contact_email, contact_subject, contact_message) VALUES ($1, $2, $3, $4)",
      [name, email, subject, message]
    );

    res.status(HTTP_STATUS.CREATED).json({ success: true, message: MESSAGES.MESSAGE_SENT });
  } catch (err) {
    next(err);
  }
};
