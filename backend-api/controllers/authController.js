import jwt from "jsonwebtoken";
import { HTTP_STATUS, MESSAGES } from "../config/constants.js";

export const login = (req, res) => {
  const { email, password } = req.body;

  if (email === "admin@demo.com" && password === "demo123") {
    const token = jwt.sign({ user: "admin" }, process.env.JWT_SECRET, { expiresIn: "1h" });
    res.status(HTTP_STATUS.OK).json({ token });
  } else {
    res.status(HTTP_STATUS.UNAUTHORIZED).json({ message: MESSAGES.INVALID_CREDENTIALS });
  }
};
