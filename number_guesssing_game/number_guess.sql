--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    user_id integer,
    no_guess integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 3);
INSERT INTO public.games VALUES (2, 2);
INSERT INTO public.games VALUES (2, 5);
INSERT INTO public.games VALUES (1, 6);
INSERT INTO public.games VALUES (1, 2);
INSERT INTO public.games VALUES (1, 4);
INSERT INTO public.games VALUES (8, 990);
INSERT INTO public.games VALUES (8, 786);
INSERT INTO public.games VALUES (9, 419);
INSERT INTO public.games VALUES (9, 604);
INSERT INTO public.games VALUES (8, 842);
INSERT INTO public.games VALUES (8, 415);
INSERT INTO public.games VALUES (8, 451);
INSERT INTO public.games VALUES (10, 878);
INSERT INTO public.games VALUES (10, 672);
INSERT INTO public.games VALUES (11, 582);
INSERT INTO public.games VALUES (11, 479);
INSERT INTO public.games VALUES (10, 221);
INSERT INTO public.games VALUES (10, 978);
INSERT INTO public.games VALUES (10, 757);
INSERT INTO public.games VALUES (12, 382);
INSERT INTO public.games VALUES (12, 334);
INSERT INTO public.games VALUES (13, 591);
INSERT INTO public.games VALUES (13, 410);
INSERT INTO public.games VALUES (12, 243);
INSERT INTO public.games VALUES (12, 577);
INSERT INTO public.games VALUES (12, 71);
INSERT INTO public.games VALUES (14, 574);
INSERT INTO public.games VALUES (14, 332);
INSERT INTO public.games VALUES (15, 348);
INSERT INTO public.games VALUES (15, 713);
INSERT INTO public.games VALUES (14, 862);
INSERT INTO public.games VALUES (14, 908);
INSERT INTO public.games VALUES (14, 814);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'shikhar');
INSERT INTO public.users VALUES (2, 'sammy');
INSERT INTO public.users VALUES (3, 'dean');
INSERT INTO public.users VALUES (4, 'user_1702557319178');
INSERT INTO public.users VALUES (5, 'user_1702557319177');
INSERT INTO public.users VALUES (6, 'user_1702557462788');
INSERT INTO public.users VALUES (7, 'user_1702557462787');
INSERT INTO public.users VALUES (8, 'user_1702558584125');
INSERT INTO public.users VALUES (9, 'user_1702558584124');
INSERT INTO public.users VALUES (10, 'user_1702558672921');
INSERT INTO public.users VALUES (11, 'user_1702558672920');
INSERT INTO public.users VALUES (12, 'user_1702558686714');
INSERT INTO public.users VALUES (13, 'user_1702558686713');
INSERT INTO public.users VALUES (14, 'user_1702558710833');
INSERT INTO public.users VALUES (15, 'user_1702558710832');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

