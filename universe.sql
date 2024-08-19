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
-- Name: distance; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance (
    distance_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    distance numeric NOT NULL,
    measurement_date date,
    name character varying(255) NOT NULL
);


ALTER TABLE public.distance OWNER TO freecodecamp;

--
-- Name: distance_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_distance_id_seq OWNER TO freecodecamp;

--
-- Name: distance_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_distance_id_seq OWNED BY public.distance.distance_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer
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
    name character varying(255) NOT NULL,
    star_id integer,
    planet_types text[],
    has_rings boolean,
    distance_from_star numeric
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean
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
-- Name: distance distance_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance ALTER COLUMN distance_id SET DEFAULT nextval('public.distance_distance_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: distance; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance VALUES (1, 1, 1, 384400, '2024-01-01', 'Distance from Earth to Moon');
INSERT INTO public.distance VALUES (2, 1, 2, 378300, '2024-01-02', 'Distance from Earth to Another Moon');
INSERT INTO public.distance VALUES (3, 3, 4, 420000, '2024-01-03', 'Distance from Jupiter to Moon');
INSERT INTO public.distance VALUES (4, 4, 7, 200000, '2024-01-04', 'Distance from Saturn to Moon');
INSERT INTO public.distance VALUES (5, 5, 10, 150000, '2024-01-05', 'Distance from Uranus to Moon');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighbor galaxy', 2500000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Bright galaxy in Ursa Major', 12000000, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 'Starburst galaxy', 12000000, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral galaxy in Canes Venatici', 23000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 450);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 450);
INSERT INTO public.moon VALUES (4, 'Io', 3, true, 460);
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, 460);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, 460);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, 460);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 1000);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, true, 1000);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, true, 1000);
INSERT INTO public.moon VALUES (11, 'Dione', 4, true, 1000);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, true, 1000);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, true, 1000);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, true, 1000);
INSERT INTO public.moon VALUES (15, 'Miranda', 5, true, 450);
INSERT INTO public.moon VALUES (16, 'Ariel', 5, true, 450);
INSERT INTO public.moon VALUES (17, 'Umbriel', 5, true, 450);
INSERT INTO public.moon VALUES (18, 'Titania', 5, true, 450);
INSERT INTO public.moon VALUES (19, 'Oberon', 5, true, 450);
INSERT INTO public.moon VALUES (20, 'Triton', 6, true, 1000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, '{terrestrial}', false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, '{terrestrial}', false, 1.5);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, '{"gas giant"}', true, 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, '{"gas giant"}', true, 9.5);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, '{"ice giant"}', false, 19.8);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, '{"ice giant"}', false, 30.1);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, '{terrestrial}', false, 0.39);
INSERT INTO public.planet VALUES (8, 'Venus', 1, '{terrestrial}', false, 0.72);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, '{"dwarf planet"}', false, 39.5);
INSERT INTO public.planet VALUES (10, 'Eris', 1, '{"dwarf planet"}', false, 96.4);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, '{"dwarf planet"}', false, 43.2);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, '{"dwarf planet"}', false, 45.7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 200, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 1000000, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4000, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 5000, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 500, true);


--
-- Name: distance_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_distance_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: distance distance_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_name_key UNIQUE (name);


--
-- Name: distance distance_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_pkey PRIMARY KEY (distance_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: distance distance_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: distance distance_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

