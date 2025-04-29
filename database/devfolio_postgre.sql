--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-29 17:41:56 +08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16505)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100),
    email character varying(100),
    phone1 character varying(20),
    phone2 character varying(20),
    profile_image character varying(255),
    profile_background_image character varying(255),
    last_modify_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    data_created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    social_links jsonb
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16504)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.author_id_seq OWNER TO postgres;

--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 229
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- TOC entry 220 (class 1259 OID 16428)
-- Name: contact_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_messages (
    contact_id integer NOT NULL,
    contact_name character varying(100),
    contact_email character varying(100),
    contact_subject character varying(150),
    contact_message text,
    created_datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contact_messages OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16427)
-- Name: contact_messages_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_messages_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_messages_contact_id_seq OWNER TO postgres;

--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 219
-- Name: contact_messages_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_messages_contact_id_seq OWNED BY public.contact_messages.contact_id;


--
-- TOC entry 232 (class 1259 OID 16516)
-- Name: highlight_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highlight_skills (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    proficiency integer NOT NULL,
    last_modify_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    data_created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.highlight_skills OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16515)
-- Name: highlight_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highlight_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highlight_skills_id_seq OWNER TO postgres;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 231
-- Name: highlight_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highlight_skills_id_seq OWNED BY public.highlight_skills.id;


--
-- TOC entry 234 (class 1259 OID 16525)
-- Name: highlight_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highlight_statistics (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    value numeric(10,2) NOT NULL,
    unit character varying(20) NOT NULL,
    last_modify_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    data_created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    icon_name character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.highlight_statistics OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16524)
-- Name: highlight_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highlight_statistics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highlight_statistics_id_seq OWNER TO postgres;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 233
-- Name: highlight_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highlight_statistics_id_seq OWNED BY public.highlight_statistics.id;


--
-- TOC entry 224 (class 1259 OID 16467)
-- Name: portfolio_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolio_images (
    image_id integer NOT NULL,
    portfolio_id integer NOT NULL,
    image_path text NOT NULL
);


ALTER TABLE public.portfolio_images OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16466)
-- Name: portfolio_images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.portfolio_images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.portfolio_images_image_id_seq OWNER TO postgres;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 223
-- Name: portfolio_images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.portfolio_images_image_id_seq OWNED BY public.portfolio_images.image_id;


--
-- TOC entry 222 (class 1259 OID 16456)
-- Name: portfolios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolios (
    portfolio_id integer NOT NULL,
    title character varying(255) NOT NULL,
    category character varying(100) NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    description text NOT NULL,
    cover_image text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.portfolios OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16455)
-- Name: portfolios_portfolio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.portfolios_portfolio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.portfolios_portfolio_id_seq OWNER TO postgres;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 221
-- Name: portfolios_portfolio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.portfolios_portfolio_id_seq OWNED BY public.portfolios.portfolio_id;


--
-- TOC entry 218 (class 1259 OID 16419)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16418)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 217
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 226 (class 1259 OID 16481)
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sections (
    section_id integer NOT NULL,
    section_name character varying(50) NOT NULL,
    section_headline character varying(100) NOT NULL,
    section_description text NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_display boolean DEFAULT true
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16480)
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sections_section_id_seq OWNER TO postgres;

--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 225
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;


--
-- TOC entry 228 (class 1259 OID 16493)
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    skill_title character varying(50) NOT NULL,
    skill_description text NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    skill_icon character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16492)
-- Name: skills_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_skill_id_seq OWNER TO postgres;

--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 227
-- Name: skills_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_skill_id_seq OWNED BY public.skills.skill_id;


--
-- TOC entry 236 (class 1259 OID 16535)
-- Name: testimonials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    profile_photo character varying(255),
    name character varying(100) NOT NULL,
    occupation character varying(100),
    company character varying(100),
    review text,
    linkedin character varying(255),
    last_modify_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    data_created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.testimonials OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16534)
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.testimonials_id_seq OWNER TO postgres;

--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 235
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- TOC entry 3510 (class 2604 OID 16508)
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- TOC entry 3496 (class 2604 OID 16431)
-- Name: contact_messages contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_messages ALTER COLUMN contact_id SET DEFAULT nextval('public.contact_messages_contact_id_seq'::regclass);


--
-- TOC entry 3513 (class 2604 OID 16519)
-- Name: highlight_skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highlight_skills ALTER COLUMN id SET DEFAULT nextval('public.highlight_skills_id_seq'::regclass);


--
-- TOC entry 3516 (class 2604 OID 16528)
-- Name: highlight_statistics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highlight_statistics ALTER COLUMN id SET DEFAULT nextval('public.highlight_statistics_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 16470)
-- Name: portfolio_images image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_images ALTER COLUMN image_id SET DEFAULT nextval('public.portfolio_images_image_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 16459)
-- Name: portfolios portfolio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN portfolio_id SET DEFAULT nextval('public.portfolios_portfolio_id_seq'::regclass);


--
-- TOC entry 3495 (class 2604 OID 16422)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 16484)
-- Name: sections section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- TOC entry 3506 (class 2604 OID 16496)
-- Name: skills skill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_skill_id_seq'::regclass);


--
-- TOC entry 3520 (class 2604 OID 16538)
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- TOC entry 3702 (class 0 OID 16505)
-- Dependencies: 230
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, name, title, email, phone1, phone2, profile_image, profile_background_image, last_modify_date, data_created_date, social_links) FROM stdin;
1	Belleluck Low	Full Stack Developer	belleluck1212@gmail.com	(60) 16-721-3758	(65) 8449-2006	../public/img/personal-profile/belleluck_closecap.png	../public/img/personal-profile/belleluck_flowers.png	2025-04-28 18:27:01.437898	2025-04-28 18:27:01.437898	{"linkedin": "https://www.linkedin.com/in/belleluck-low/"}
\.


--
-- TOC entry 3692 (class 0 OID 16428)
-- Dependencies: 220
-- Data for Name: contact_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_messages (contact_id, contact_name, contact_email, contact_subject, contact_message, created_datetime) FROM stdin;
1	test name	test@gmail.com	test subject	test message	2025-04-26 17:06:11.664406
2	Hello Baby Name	Baby1234@gmail.com	Hello Baby Subject	Hello Baby Message	2025-04-27 00:50:08.475701
3	Test Name	test@gmail.com	Test Subject	Message Test	2025-04-27 00:51:56.444492
4	test name	testemail@gmail.com	test subject	test message 1234	2025-04-27 00:56:04.250207
5	Zwe Htet Aung	ZweZwe@gmail.com	Impressive Porfile	I saw your devfolio, impressive!!	2025-04-27 01:12:37.812719
\.


--
-- TOC entry 3704 (class 0 OID 16516)
-- Dependencies: 232
-- Data for Name: highlight_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highlight_skills (id, title, proficiency, last_modify_date, data_created_date) FROM stdin;
1	iOS Swift	80	2025-04-29 13:06:42.911941	2025-04-29 13:06:42.911941
2	Java for Android	75	2025-04-29 13:06:42.911941	2025-04-29 13:06:42.911941
3	Node.js	50	2025-04-29 13:06:42.911941	2025-04-29 13:06:42.911941
4	JavaScript	70	2025-04-29 13:06:42.911941	2025-04-29 13:06:42.911941
\.


--
-- TOC entry 3706 (class 0 OID 16525)
-- Dependencies: 234
-- Data for Name: highlight_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highlight_statistics (id, title, value, unit, last_modify_date, data_created_date, icon_name) FROM stdin;
1	PROJECTS COMPLETED	15.00	number	2025-04-29 13:34:26.653807	2025-04-29 13:34:26.653807	briefcase-fill
2	YEARS OF EXPERIENCE	3.00	number	2025-04-29 13:34:26.653807	2025-04-29 13:34:26.653807	calendar2-week-fill
3	INCREASED PERFORMANCE	20.00	percent	2025-04-29 13:34:26.653807	2025-04-29 13:34:26.653807	graph-up
4	INCREASED CONVERSION	10.00	percent	2025-04-29 13:34:26.653807	2025-04-29 13:34:26.653807	people-fill
\.


--
-- TOC entry 3696 (class 0 OID 16467)
-- Dependencies: 224
-- Data for Name: portfolio_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolio_images (image_id, portfolio_id, image_path) FROM stdin;
\.


--
-- TOC entry 3694 (class 0 OID 16456)
-- Dependencies: 222
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolios (portfolio_id, title, category, date, description, cover_image, created_at) FROM stdin;
1	Management App	App Development	2023-06-01 00:00:00	Management app design for various usage	../public/img/portfolios/fam-app.png	2025-04-27 17:54:57.809761
2	Rating App	App Development	2023-06-01 00:00:00	Public toilet rating system	../public/img/portfolios/rfs-app.png	2025-04-27 17:54:57.809761
3	Healthcare App	App Development	2024-06-01 00:00:00	Local clinic teleconsult app for public user	../public/img/portfolios/sata-public-app.png	2025-04-27 17:54:57.809761
4	Healthcare App	App Development	2024-06-01 00:00:00	Local clinic teleconsult app for public user	../public/img/portfolios/sata-mwcare-app.png	2025-04-27 17:54:57.809761
5	Healthcare App	App Development	2024-06-01 00:00:00	Local clinic teleconsult app for public user	../public/img/portfolios/eha-app.png	2025-04-27 17:54:57.809761
6	Healthcare App	App Development	2024-06-01 00:00:00	Local clinic teleconsult app for public user	../public/img/portfolios/ha-app.png	2025-04-27 17:54:57.809761
\.


--
-- TOC entry 3690 (class 0 OID 16419)
-- Dependencies: 218
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, title) FROM stdin;
1	React Portfolio
2	Weather App
3	Expense Tracker
\.


--
-- TOC entry 3698 (class 0 OID 16481)
-- Dependencies: 226
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sections (section_id, section_name, section_headline, section_description, last_update, created_datetime, is_display) FROM stdin;
1	hero	I am Belleluck Low	Application Developer,Web Developer,Frontend Developer,Graphic Designer,Data Analyst	2025-04-28 13:22:22.117589	2025-04-28 13:22:22.117589	t
6	send message	Send Message Us		2025-04-28 13:22:22.117589	2025-04-28 13:22:22.117589	t
2	about me	About Me	Application Developer with strong experience in mobile app development, backend integration, and database management.<br><br>Proficient in Swift, Java, Flutter, and C# ASP.NET, with a proven track record of developing stable and user-centric iOS and Android applications.<br><br>Skilled in API optimization, SQL database troubleshooting, and version control using Git.<br><br>Dedicated to delivering clean, maintainable code and contributing to high-quality software solutions.<br><br>Keen interest in emerging technologies, particularly in FinTech and RegTech, with a focus on continuous learning and innovation.	2025-04-28 13:22:22.117589	2025-04-28 13:22:22.117589	t
4	portfolio	Portfolio	Bringing Ideas to Life	2025-04-28 13:22:22.117589	2025-04-28 13:22:22.117589	t
3	skills	Skills	Core Competencies and Expertise	2025-04-28 13:22:22.117589	2025-04-28 13:22:22.117589	t
5	contact	Get in Touch	Let's Get in Touch	2025-04-28 13:22:22.117589	2025-04-28 13:22:22.117589	t
\.


--
-- TOC entry 3700 (class 0 OID 16493)
-- Dependencies: 228
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (skill_id, skill_title, skill_description, last_update, created_datetime, skill_icon) FROM stdin;
1	Mobile App Development	Experienced in developing stable iOS and Android apps using Swift, Kotlin, Java, and Flutter (Dart), focusing on performance and UI/UX.	2025-04-28 17:01:33.082146	2025-04-28 17:01:33.082146	phone
2	Web Development	Proficient in HTML, CSS, Bootstrap, JavaScript, and jQuery for building responsive interfaces and integrating backend systems via XML.	2025-04-28 17:01:33.082146	2025-04-28 17:01:33.082146	browser-chrome
3	UI/UX Development	Skilled in designing intuitive user experiences using Figma, Adobe Photoshop, and Illustrator, with attention to detail and usability.	2025-04-28 17:01:33.082146	2025-04-28 17:01:33.082146	brush
4	API Development	Maintained and tested RESTful APIs with C# ASP.NET, using Postman for validation, ensuring seamless mobile-backend integration.	2025-04-28 17:01:33.082146	2025-04-28 17:01:33.082146	gear
5	Database Management	Troubleshot and optimized Microsoft SQL and MySQL databases, including stored procedures, for efficient data handling in applications.	2025-04-28 17:01:33.082146	2025-04-28 17:01:33.082146	database-fill-gear
6	Data Analysis	Knowledge of Python for data analysis, enhancing decision-making through structured data insights and trend identification.	2025-04-28 17:01:33.082146	2025-04-28 17:01:33.082146	bar-chart
\.


--
-- TOC entry 3708 (class 0 OID 16535)
-- Dependencies: 236
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testimonials (id, profile_photo, name, occupation, company, review, linkedin, last_modify_date, data_created_date) FROM stdin;
1	../public/img/testimonial/teantze.jpeg	Tean Tze	Application Developer	Assurance Technology	Responsible and friendly senior, outstanding projects partner.	https://www.linkedin.com/in/tean-tze-ng-6767bb224/	2025-04-29 16:20:25.727125	2025-04-29 16:20:25.727125
2	../public/img/testimonial/songjie.jpeg	Song Jie	Application Consultant	Infinergy System	A leader who actually care about his teammates.	https://www.linkedin.com/in/yeow-song-jie-3140a5217/	2025-04-29 16:20:25.727125	2025-04-29 16:20:25.727125
3	../public/img/testimonial/jefferson.jpeg	Jefferson	Modern Workspace Developer	SRKK	Fast learner and an excellent developer.	https://www.linkedin.com/in/jefferson-mendoza-030b63bb/	2025-04-29 16:20:25.727125	2025-04-29 16:20:25.727125
\.


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 229
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 1, true);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 219
-- Name: contact_messages_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_messages_contact_id_seq', 5, true);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 231
-- Name: highlight_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highlight_skills_id_seq', 4, true);


--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 233
-- Name: highlight_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highlight_statistics_id_seq', 4, true);


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 223
-- Name: portfolio_images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolio_images_image_id_seq', 1, false);


--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 221
-- Name: portfolios_portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolios_portfolio_id_seq', 6, true);


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 217
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 225
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 6, true);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 227
-- Name: skills_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_skill_id_seq', 6, true);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 235
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 3, true);


--
-- TOC entry 3536 (class 2606 OID 16514)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 16436)
-- Name: contact_messages contact_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_messages
    ADD CONSTRAINT contact_messages_pkey PRIMARY KEY (contact_id);


--
-- TOC entry 3538 (class 2606 OID 16523)
-- Name: highlight_skills highlight_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highlight_skills
    ADD CONSTRAINT highlight_skills_pkey PRIMARY KEY (id);


--
-- TOC entry 3540 (class 2606 OID 16532)
-- Name: highlight_statistics highlight_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highlight_statistics
    ADD CONSTRAINT highlight_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3530 (class 2606 OID 16472)
-- Name: portfolio_images portfolio_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_images
    ADD CONSTRAINT portfolio_images_pkey PRIMARY KEY (image_id);


--
-- TOC entry 3528 (class 2606 OID 16465)
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (portfolio_id);


--
-- TOC entry 3524 (class 2606 OID 16426)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3532 (class 2606 OID 16490)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- TOC entry 3534 (class 2606 OID 16502)
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);


--
-- TOC entry 3542 (class 2606 OID 16544)
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- TOC entry 3543 (class 2606 OID 16473)
-- Name: portfolio_images portfolio_images_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_images
    ADD CONSTRAINT portfolio_images_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(portfolio_id) ON DELETE CASCADE;


-- Completed on 2025-04-29 17:41:56 +08

--
-- PostgreSQL database dump complete
--

