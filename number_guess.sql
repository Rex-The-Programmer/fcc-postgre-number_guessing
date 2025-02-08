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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2, 399);
INSERT INTO public.games VALUES (2, 2, 490);
INSERT INTO public.games VALUES (3, 3, 103);
INSERT INTO public.games VALUES (4, 3, 835);
INSERT INTO public.games VALUES (5, 2, 187);
INSERT INTO public.games VALUES (6, 2, 649);
INSERT INTO public.games VALUES (7, 2, 487);
INSERT INTO public.games VALUES (8, 4, 239);
INSERT INTO public.games VALUES (9, 4, 79);
INSERT INTO public.games VALUES (10, 5, 417);
INSERT INTO public.games VALUES (11, 5, 196);
INSERT INTO public.games VALUES (12, 4, 566);
INSERT INTO public.games VALUES (13, 4, 273);
INSERT INTO public.games VALUES (14, 4, 944);
INSERT INTO public.games VALUES (15, 6, 235);
INSERT INTO public.games VALUES (16, 6, 710);
INSERT INTO public.games VALUES (17, 7, 490);
INSERT INTO public.games VALUES (18, 7, 468);
INSERT INTO public.games VALUES (19, 6, 839);
INSERT INTO public.games VALUES (20, 6, 296);
INSERT INTO public.games VALUES (21, 6, 89);
INSERT INTO public.games VALUES (22, 8, 35);
INSERT INTO public.games VALUES (23, 8, 220);
INSERT INTO public.games VALUES (24, 9, 763);
INSERT INTO public.games VALUES (25, 9, 390);
INSERT INTO public.games VALUES (26, 8, 266);
INSERT INTO public.games VALUES (27, 8, 192);
INSERT INTO public.games VALUES (28, 8, 549);
INSERT INTO public.games VALUES (29, 10, 313);
INSERT INTO public.games VALUES (30, 10, 102);
INSERT INTO public.games VALUES (31, 11, 687);
INSERT INTO public.games VALUES (32, 11, 96);
INSERT INTO public.games VALUES (33, 10, 241);
INSERT INTO public.games VALUES (34, 10, 68);
INSERT INTO public.games VALUES (35, 10, 299);
INSERT INTO public.games VALUES (36, 12, 19);
INSERT INTO public.games VALUES (37, 12, 103);
INSERT INTO public.games VALUES (38, 13, 316);
INSERT INTO public.games VALUES (39, 13, 863);
INSERT INTO public.games VALUES (40, 12, 719);
INSERT INTO public.games VALUES (41, 12, 993);
INSERT INTO public.games VALUES (42, 12, 726);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1739007972001');
INSERT INTO public.users VALUES (3, 'user_1739007972000');
INSERT INTO public.users VALUES (4, 'user_1739008043732');
INSERT INTO public.users VALUES (5, 'user_1739008043731');
INSERT INTO public.users VALUES (6, 'user_1739008090191');
INSERT INTO public.users VALUES (7, 'user_1739008090190');
INSERT INTO public.users VALUES (8, 'user_1739008280552');
INSERT INTO public.users VALUES (9, 'user_1739008280551');
INSERT INTO public.users VALUES (10, 'user_1739008322844');
INSERT INTO public.users VALUES (11, 'user_1739008322843');
INSERT INTO public.users VALUES (12, 'user_1739008468274');
INSERT INTO public.users VALUES (13, 'user_1739008468273');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 42, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

