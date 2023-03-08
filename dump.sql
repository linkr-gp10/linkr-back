--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: hashtagGroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."hashtagGroup" (
    id integer NOT NULL,
    hashtag integer NOT NULL
);


--
-- Name: hashtagGroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."hashtagGroup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtagGroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."hashtagGroup_id_seq" OWNED BY public."hashtagGroup".id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: postHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."postHistories" (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: postHistories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."postHistories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postHistories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."postHistories_id_seq" OWNED BY public."postHistories".id;


--
-- Name: postHistories_postId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."postHistories_postId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postHistories_postId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."postHistories_postId_seq" OWNED BY public."postHistories"."postId";


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    link text NOT NULL,
    content text NOT NULL,
    "hashtagGroupId" integer NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    username text NOT NULL,
    "imageUrl" text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtagGroup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagGroup" ALTER COLUMN id SET DEFAULT nextval('public."hashtagGroup_id_seq"'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: postHistories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHistories" ALTER COLUMN id SET DEFAULT nextval('public."postHistories_id_seq"'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtagGroup; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: postHistories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (5, 'nene@vasco.com.br', '$2b$10$llf2mRzHRYxk8zgquGOafOxdB35ob4Lr4TgsJHAelsjAYfLZgXo.q', 'vovô do vasco', 'https://www.lance.com.br/files/article_main/uploads/2023/03/06/640578cc285ce.jpeg');


--
-- Name: hashtagGroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."hashtagGroup_id_seq"', 1, false);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: postHistories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."postHistories_id_seq"', 1, false);


--
-- Name: postHistories_postId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."postHistories_postId_seq"', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: hashtagGroup hashtagGroup_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagGroup"
    ADD CONSTRAINT "hashtagGroup_pk" PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pk PRIMARY KEY (id);


--
-- Name: postHistories postHistories_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHistories"
    ADD CONSTRAINT "postHistories_pk" PRIMARY KEY (id);


--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: hashtagGroup hashtagGroup_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."hashtagGroup"
    ADD CONSTRAINT "hashtagGroup_fk0" FOREIGN KEY (hashtag) REFERENCES public.hashtags(id);


--
-- Name: postHistories postHistories_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHistories"
    ADD CONSTRAINT "postHistories_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: postHistories postHistories_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."postHistories"
    ADD CONSTRAINT "postHistories_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("hashtagGroupId") REFERENCES public."hashtagGroup"(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

