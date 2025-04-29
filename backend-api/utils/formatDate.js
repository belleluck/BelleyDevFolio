// utils/formatDate.js

export function formatDate(dateString) {
  const options = { day: "2-digit", month: "short", year: "numeric" };
  const date = new Date(dateString);

  if (isNaN(date)) {
    return ""; // or handle invalid date
  }

  return date.toLocaleDateString("en-US", options);
}
