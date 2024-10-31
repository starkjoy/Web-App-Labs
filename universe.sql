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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_from_earth_km numeric,
    is_spiral boolean,
    galaxy_group_id integer,
    name character varying(30) NOT NULL,
    average_mass_kg integer,
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    name character varying(30) NOT NULL,
    average_mass_kg numeric,
    is_member boolean,
    nick_name text,
    distance_from_earth_km integer,
    number_of_galaxies integer
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: galaxy_galaxy_id_seq1; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq1 OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq1 OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km numeric,
    has_atmosphere boolean,
    planet_id integer NOT NULL,
    average_mass_kg integer,
    distance_from_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_kg numeric,
    has_rings boolean,
    star_id integer NOT NULL,
    average_mass_kg integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    luminosity_j numeric,
    is_main_sequence boolean,
    galaxy_id integer NOT NULL,
    average_mass_kg integer,
    number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq1'::regclass);


--
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 2500000, true, 1, 'Milky Way', 1000000, 100000000);
INSERT INTO public.galaxy VALUES (2, 50000, true, 2, 'Andromeda', 1200000, 1000000000);
INSERT INTO public.galaxy VALUES (3, 250000, false, 3, 'Centaurus A', 1500000, 200000000);
INSERT INTO public.galaxy VALUES (4, 32000, true, 1, 'Sombrero Galaxy', 800, 500000);
INSERT INTO public.galaxy VALUES (5, 40000, false, 1, 'Cartwheel Galaxy', 900, 300000);
INSERT INTO public.galaxy VALUES (6, 28000, true, 2, 'Milky Way II', 600, 200000);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 'Local Group', 2.5, true, 'None', 2500, 54);
INSERT INTO public.galaxy_group VALUES (2, 'Virgo Cluster', 1000, true, 'Virgo', 50000, 100);
INSERT INTO public.galaxy_group VALUES (3, 'Perseus-Pisces', 2000, false, 'Perseus', 250000, 300);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, false, 1, 734, 384400);
INSERT INTO public.moon VALUES (2, 'Titan', 5150, true, 2, 1350, 1225000);
INSERT INTO public.moon VALUES (3, 'Phobos', 22, false, 3, 1, 6000);
INSERT INTO public.moon VALUES (4, 'Io', 3642, true, 2, 1500, 421);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, true, 2, 800, 670);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, true, 2, 4500, 1070);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, false, 2, 3000, 1883);
INSERT INTO public.moon VALUES (8, 'Rhea', 1528, true, 3, 500, 527);
INSERT INTO public.moon VALUES (9, 'Dione', 1123, false, 3, 400, 377);
INSERT INTO public.moon VALUES (10, 'Tethys', 1060, false, 3, 300, 294);
INSERT INTO public.moon VALUES (11, 'Enceladus', 504, true, 3, 800, 238);
INSERT INTO public.moon VALUES (12, 'Mimas', 396, false, 3, 250, 185);
INSERT INTO public.moon VALUES (13, 'Hyperion', 270, true, 3, 700, 620);
INSERT INTO public.moon VALUES (14, 'Miranda', 471.6, true, 4, 130, 129520);
INSERT INTO public.moon VALUES (15, 'Ariel', 1164, true, 4, 1300, 127130);
INSERT INTO public.moon VALUES (16, 'Umbriel', 1169, false, 4, 220, 265000);
INSERT INTO public.moon VALUES (17, 'Titania', 1577.8, true, 4, 490, 390000);
INSERT INTO public.moon VALUES (18, 'Oberon', 1523.6, true, 4, 350, 491000);
INSERT INTO public.moon VALUES (19, 'Deimos', 12.4, false, 5, 1, 23460);
INSERT INTO public.moon VALUES (20, 'Metis', 40.5, false, 2, 0, 128000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6000, false, 1, 6000, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 70000, true, 1, 70000, 83);
INSERT INTO public.planet VALUES (3, 'Mars', 6400, false, 1, 6400, 2);
INSERT INTO public.planet VALUES (4, 'Mercury', 3300, false, 1, 3300, 0);
INSERT INTO public.planet VALUES (5, 'Venus', 4600, false, 1, 4600, 0);
INSERT INTO public.planet VALUES (6, 'Jupiter', 18900, true, 2, 18900, 79);
INSERT INTO public.planet VALUES (7, 'Neptune', 10200, true, 3, 10200, 14);
INSERT INTO public.planet VALUES (8, 'Uranus', 8600, true, 3, 8600, 27);
INSERT INTO public.planet VALUES (9, 'Pluto', 1300, false, 1, 1300, 5);
INSERT INTO public.planet VALUES (10, 'Haumea', 400, true, 1, 400, 2);
INSERT INTO public.planet VALUES (11, 'Makemake', 400, false, 1, 400, 1);
INSERT INTO public.planet VALUES (12, 'Eris', 1600, false, 1, 1600, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 25.4, true, 1, 2000000, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.0015, true, 1, 1500000, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 126000, false, 2, 1800000, 0);
INSERT INTO public.star VALUES (4, 'Antares', 60, false, 1, 18, 0);
INSERT INTO public.star VALUES (5, 'Canopus', 13, false, 1, 10, 4);
INSERT INTO public.star VALUES (6, 'Arcturus', 12, true, 1, 1, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq1', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_group galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy_group galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_group_id);


--
-- Name: galaxy galaxy_pkey1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey1 PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_group_id_fkey FOREIGN KEY (galaxy_group_id) REFERENCES public.galaxy_group(galaxy_group_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

