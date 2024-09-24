--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: userdata; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.userdata (
    username_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.userdata OWNER TO freecodecamp;

--
-- Name: userdata_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.userdata_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userdata_username_id_seq OWNER TO freecodecamp;

--
-- Name: userdata_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.userdata_username_id_seq OWNED BY public.userdata.username_id;


--
-- Name: userdata username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.userdata ALTER COLUMN username_id SET DEFAULT nextval('public.userdata_username_id_seq'::regclass);


--
-- Data for Name: userdata; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.userdata VALUES (3, 'user_1727207549093', 2, 792);
INSERT INTO public.userdata VALUES (2, 'user_1727207549094', 5, 37);
INSERT INTO public.userdata VALUES (5, 'user_1727207851207', 2, 93);
INSERT INTO public.userdata VALUES (4, 'user_1727207851208', 5, 180);
INSERT INTO public.userdata VALUES (1, 'Test', 2, 1000);
INSERT INTO public.userdata VALUES (7, 'user_1727207929076', 2, 454);
INSERT INTO public.userdata VALUES (6, 'user_1727207929077', 5, 110);


--
-- Name: userdata_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.userdata_username_id_seq', 7, true);


--
-- Name: userdata userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.userdata
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (username_id);


--
-- PostgreSQL database dump complete
--

