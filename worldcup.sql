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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (51, 2018, 'Final', 339, 340, 4, 2);
INSERT INTO public.games VALUES (52, 2018, 'Third Place', 341, 342, 2, 0);
INSERT INTO public.games VALUES (53, 2018, 'Semi-Final', 340, 342, 2, 1);
INSERT INTO public.games VALUES (54, 2018, 'Semi-Final', 339, 341, 1, 0);
INSERT INTO public.games VALUES (55, 2018, 'Quarter-Final', 340, 343, 3, 2);
INSERT INTO public.games VALUES (56, 2018, 'Quarter-Final', 342, 344, 2, 0);
INSERT INTO public.games VALUES (57, 2018, 'Quarter-Final', 341, 345, 2, 1);
INSERT INTO public.games VALUES (58, 2018, 'Quarter-Final', 339, 346, 2, 0);
INSERT INTO public.games VALUES (59, 2018, 'Eighth-Final', 342, 347, 2, 1);
INSERT INTO public.games VALUES (60, 2018, 'Eighth-Final', 344, 348, 1, 0);
INSERT INTO public.games VALUES (61, 2018, 'Eighth-Final', 341, 349, 3, 2);
INSERT INTO public.games VALUES (62, 2018, 'Eighth-Final', 345, 350, 2, 0);
INSERT INTO public.games VALUES (63, 2018, 'Eighth-Final', 340, 351, 2, 1);
INSERT INTO public.games VALUES (64, 2018, 'Eighth-Final', 343, 352, 2, 1);
INSERT INTO public.games VALUES (65, 2018, 'Eighth-Final', 346, 353, 2, 1);
INSERT INTO public.games VALUES (66, 2018, 'Eighth-Final', 339, 354, 4, 3);
INSERT INTO public.games VALUES (67, 2014, 'Final', 355, 354, 1, 0);
INSERT INTO public.games VALUES (68, 2014, 'Third Place', 356, 345, 3, 0);
INSERT INTO public.games VALUES (69, 2014, 'Semi-Final', 354, 356, 1, 0);
INSERT INTO public.games VALUES (70, 2014, 'Semi-Final', 355, 345, 7, 1);
INSERT INTO public.games VALUES (71, 2014, 'Quarter-Final', 356, 357, 1, 0);
INSERT INTO public.games VALUES (72, 2014, 'Quarter-Final', 354, 341, 1, 0);
INSERT INTO public.games VALUES (73, 2014, 'Quarter-Final', 345, 347, 2, 1);
INSERT INTO public.games VALUES (74, 2014, 'Quarter-Final', 355, 339, 1, 0);
INSERT INTO public.games VALUES (75, 2014, 'Eighth-Final', 345, 358, 2, 1);
INSERT INTO public.games VALUES (76, 2014, 'Eighth-Final', 347, 346, 2, 0);
INSERT INTO public.games VALUES (77, 2014, 'Eighth-Final', 339, 359, 2, 0);
INSERT INTO public.games VALUES (78, 2014, 'Eighth-Final', 355, 360, 2, 1);
INSERT INTO public.games VALUES (79, 2014, 'Eighth-Final', 356, 350, 2, 1);
INSERT INTO public.games VALUES (80, 2014, 'Eighth-Final', 357, 361, 2, 1);
INSERT INTO public.games VALUES (81, 2014, 'Eighth-Final', 354, 348, 1, 0);
INSERT INTO public.games VALUES (82, 2014, 'Eighth-Final', 341, 362, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (339, 'France');
INSERT INTO public.teams VALUES (340, 'Croatia');
INSERT INTO public.teams VALUES (341, 'Belgium');
INSERT INTO public.teams VALUES (342, 'England');
INSERT INTO public.teams VALUES (343, 'Russia');
INSERT INTO public.teams VALUES (344, 'Sweden');
INSERT INTO public.teams VALUES (345, 'Brazil');
INSERT INTO public.teams VALUES (346, 'Uruguay');
INSERT INTO public.teams VALUES (347, 'Colombia');
INSERT INTO public.teams VALUES (348, 'Switzerland');
INSERT INTO public.teams VALUES (349, 'Japan');
INSERT INTO public.teams VALUES (350, 'Mexico');
INSERT INTO public.teams VALUES (351, 'Denmark');
INSERT INTO public.teams VALUES (352, 'Spain');
INSERT INTO public.teams VALUES (353, 'Portugal');
INSERT INTO public.teams VALUES (354, 'Argentina');
INSERT INTO public.teams VALUES (355, 'Germany');
INSERT INTO public.teams VALUES (356, 'Netherlands');
INSERT INTO public.teams VALUES (357, 'Costa Rica');
INSERT INTO public.teams VALUES (358, 'Chile');
INSERT INTO public.teams VALUES (359, 'Nigeria');
INSERT INTO public.teams VALUES (360, 'Algeria');
INSERT INTO public.teams VALUES (361, 'Greece');
INSERT INTO public.teams VALUES (362, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 82, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 362, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

