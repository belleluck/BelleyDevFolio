# BelleyDevFolio

Belleluck DevFolio

![DevFolio Demo](demo/BelleyDevFolio.gif)

📌 DevFolio
DevFolio is a full-stack developer portfolio platform consisting of a public-facing static website, a backend API, and an admin console. It showcases my portfolio, skills, and contact information, and allows content management through an admin interface.

🧩 Project Structure
devfolio/
├── public-web/ # Static site using HTML/CSS/Bootstrap + JavaScript
├── backend-api/ # Node.js API server with PostgreSQL
├── admin-console/ # React.js-based admin portal (under development)
├── database/ # PostgreSQL export scripts
├── .gitignore # Ignores sensitive files like .env
└── README.md

🚀 Features
✅ Public portfolio website (skills, portfolio, contact form)
✅ Custom Bootstrap design
✅ API integration using Node.js
✅ PostgreSQL database connection
✅ Email contact form
🛠 Admin console for updating content (in progress)

📁 Folders Overview
| Folder | Description |
| ---------------- | ------------------------------------------------------------ |
| `public-web/` | Static frontend served with Node.js, uses HTML/CSS/JS |
| `backend-api/` | Handles API routes, email service, and database interactions |
| `admin-console/` | React-based dashboard to manage portfolio content (WIP) |
| `database/` | PostgreSQL schema and sample data |

🔐 Environment Variables
The .env file in Backend-API (excluded from version control) contains credentials such as:
EMAIL_USER=[your_email@gmail.com]
EMAIL_PASS=[your_password]
EMAIL_RECEIVER=[your_email@gmail.com]
PORT=[ProjectPort]
DB_URL=postgresql://[DbUser]:[YourDbPassword]@[DbHost]:[DbPort]/[DbName]
PG_USER=[DbUser]
PG_HOST=[DbHost]
PG_DATABASE=[DbName]
PG_PASSWORD=[YourDbPassword]
PG_PORT=[DbPort]

🧪 Setup & Run

1. Clone Repository
   git clone https://github.com/xxx/devfolio.git
   cd devfolio
2. Setup Backend API
   cd backend-api
   npm install
   cp .env.example .env # Create and fill your environment config
   npm run dev
3. Run Static Frontend (public-web)
   cd ../public-web
   npm install
   npm start
   Ensure your PostgreSQL database is running and accessible.

🧑‍💻 Author
Belleluck Low
