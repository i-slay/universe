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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    size character varying(10),
    distance text,
    luminosity character varying(15)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    type character varying(50) NOT NULL,
    radius character varying(50),
    surface_craters integer
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
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    observation_info text NOT NULL,
    observation_date date NOT NULL,
    is_successful boolean,
    name character varying(30)
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    type character varying(30) NOT NULL,
    radius character varying(50),
    number_of_moons integer,
    surface_temp_in_kelvin numeric
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
    galaxy_id integer,
    mass character varying(50),
    binary_star boolean,
    temperature character varying(30),
    luminosity text
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Spiral', 'Large', '2.537 million light-years', 'High');
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'Barred Spiral', 'Large', 'Approx. 100,000 light-years', 'Moderate');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 'Small', 'Approx. 3 million light-years', 'Low');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Spiral', 'Medium', '28 million light-years', 'Moderate');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 'Large', '23.5 million light-years', 'High');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 'Massive', '53.5 million light-years', 'Very High');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Natural Satellite', '1,737.1 km', 350000);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Natural Satellite', '11.1 km', 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 3, 'Natural Satellite', '2,631.2 km', 300);
INSERT INTO public.moon VALUES (4, 'Deimos', 2, 'Natural Satellite', '6.2 km', 2);
INSERT INTO public.moon VALUES (5, 'Titan', 5, 'Natural Satellite', '2,575 km', 100);
INSERT INTO public.moon VALUES (6, 'Europa', 3, 'Natural Satellite', '1,560.8 km', 200);
INSERT INTO public.moon VALUES (7, 'Io', 3, 'Natural Satellite', '1,821.6 km', 400);
INSERT INTO public.moon VALUES (8, 'Callisto', 3, 'Natural Satellite', '2,410.3 km', 200);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 'Natural Satellite', '252.1 km', 100);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 'Natural Satellite', '198.2 km', 40);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 'Natural Satellite', '1,353.4 km', 50);
INSERT INTO public.moon VALUES (12, 'Phoebe', 5, 'Natural Satellite', '106.6 km', 10);
INSERT INTO public.moon VALUES (13, 'Charon', 7, 'Natural Satellite', '606 km', 100);
INSERT INTO public.moon VALUES (14, 'Hyperion', 9, 'Natural Satellite', '133.6 km', 10);
INSERT INTO public.moon VALUES (15, 'Tethys', 5, 'Natural Satellite', '531.1 km', 25);
INSERT INTO public.moon VALUES (16, 'Rhea', 5, 'Natural Satellite', '764.5 km', 50);
INSERT INTO public.moon VALUES (17, 'Dione', 5, 'Natural Satellite', '561.4 km', 30);
INSERT INTO public.moon VALUES (18, 'Oberon', 9, 'Natural Satellite', '761.4 km', 10);
INSERT INTO public.moon VALUES (19, 'Iapetus', 5, 'Natural Satellite', '735.6 km', 150);
INSERT INTO public.moon VALUES (20, 'Miranda', 10, 'Natural Satellite', '235.8 km', 20);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (4, 2, 2, NULL, NULL, 'Observation of Sirius', '2023-11-25', true, 'Observation');
INSERT INTO public.observation VALUES (1, 2, 1, NULL, NULL, 'Observation of the Milky Way', '2023-11-22', false, 'Observation');
INSERT INTO public.observation VALUES (2, 1, 4, 11, NULL, 'Observation of Jupiter and its moons', '2023-11-23', true, 'Observation');
INSERT INTO public.observation VALUES (3, 3, 3, 6, 18, 'Study of the Triangulum Galaxy', '2023-11-24', false, 'Study');
INSERT INTO public.observation VALUES (6, 2, 5, NULL, NULL, 'Stellar phenomena in the Milky Way', '2023-11-27', true, 'Event');
INSERT INTO public.observation VALUES (5, 1, 6, 8, NULL, 'Exoplanet analysis in the Andromeda Galaxy', '2023-11-26', true, 'Analysis');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 'Terrestrial', '6,371 km', 1, 15.0);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 'Terrestrial', '3,389.5 km', 2, -60.0);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 'Gas Giant', '69,911 km', 79, -110.0);
INSERT INTO public.planet VALUES (4, 'Venus', 2, 'Terrestrial', '6,051.8 km', 0, 464.0);
INSERT INTO public.planet VALUES (5, 'Saturn', 2, 'Gas Giant', '58,232 km', 82, -140.0);
INSERT INTO public.planet VALUES (6, 'Neptune', 2, 'Ice Giant', '24,622 km', 14, -214.0);
INSERT INTO public.planet VALUES (7, 'Mercury', 2, 'Terrestrial', '2,439.7 km', 0, 427.0);
INSERT INTO public.planet VALUES (8, 'Uranus', 2, 'Ice Giant', '25,362 km', 27, -224.0);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 4, 'Terrestrial', '8,790 km', 0, -32.0);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 5, 'Terrestrial', '13,100 km', 2, -37.0);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 6, 'Gas Giant', '74,810 km', 1, 1700.0);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 1, 'Terrestrial', '8,580 km', 0, -39.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, '1 Solar Mass', false, '5,500 K', '1 Solar Luminosity');
INSERT INTO public.star VALUES (2, 'Sirius', 2, '2.02 Solar Masses', true, '9,940 K', '25.4 Solar Luminosities');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, '1.1 Solar Masses', false, '5,790 K', '1.5 Solar Luminosities');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Varies', false, '3,500 K', '120,000 Solar Luminosities');
INSERT INTO public.star VALUES (5, 'Vega', 2, '2.1 Solar Masses', false, '9,546 K', '40 Solar Luminosities');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 2, '0.12 Solar Masses', false, '3,042 K', '0.0017 Solar Luminosities');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: observation observation_date_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_date_unique UNIQUE (observation_date);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


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