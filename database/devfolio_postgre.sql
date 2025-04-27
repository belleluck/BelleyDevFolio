--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-27 15:48:00 +08

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
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 219
-- Name: contact_messages_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_messages_contact_id_seq OWNED BY public.contact_messages.contact_id;


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
-- TOC entry 3640 (class 0 OID 0)
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
-- TOC entry 3641 (class 0 OID 0)
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
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 217
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 3466 (class 2604 OID 16431)
-- Name: contact_messages contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_messages ALTER COLUMN contact_id SET DEFAULT nextval('public.contact_messages_contact_id_seq'::regclass);


--
-- TOC entry 3471 (class 2604 OID 16470)
-- Name: portfolio_images image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_images ALTER COLUMN image_id SET DEFAULT nextval('public.portfolio_images_image_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 16459)
-- Name: portfolios portfolio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN portfolio_id SET DEFAULT nextval('public.portfolios_portfolio_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 16422)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3629 (class 0 OID 16428)
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
-- TOC entry 3633 (class 0 OID 16467)
-- Dependencies: 224
-- Data for Name: portfolio_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolio_images (image_id, portfolio_id, image_path) FROM stdin;
\.


--
-- TOC entry 3631 (class 0 OID 16456)
-- Dependencies: 222
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolios (portfolio_id, title, category, date, description, cover_image, created_at) FROM stdin;
\.


--
-- TOC entry 3627 (class 0 OID 16419)
-- Dependencies: 218
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, title) FROM stdin;
1	React Portfolio
2	Weather App
3	Expense Tracker
\.


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 219
-- Name: contact_messages_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_messages_contact_id_seq', 5, true);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 223
-- Name: portfolio_images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolio_images_image_id_seq', 1, false);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 221
-- Name: portfolios_portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolios_portfolio_id_seq', 1, false);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 217
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- TOC entry 3475 (class 2606 OID 16436)
-- Name: contact_messages contact_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_messages
    ADD CONSTRAINT contact_messages_pkey PRIMARY KEY (contact_id);


--
-- TOC entry 3479 (class 2606 OID 16472)
-- Name: portfolio_images portfolio_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_images
    ADD CONSTRAINT portfolio_images_pkey PRIMARY KEY (image_id);


--
-- TOC entry 3477 (class 2606 OID 16465)
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (portfolio_id);


--
-- TOC entry 3473 (class 2606 OID 16426)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 16473)
-- Name: portfolio_images portfolio_images_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio_images
    ADD CONSTRAINT portfolio_images_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(portfolio_id) ON DELETE CASCADE;


-- Completed on 2025-04-27 15:48:00 +08

--
-- PostgreSQL database dump complete
--

