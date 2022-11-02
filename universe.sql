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
-- Name: assets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.assets (
    assets_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    asset_type character varying(10),
    asset_url text,
    is_image boolean
);


ALTER TABLE public.assets OWNER TO freecodecamp;

--
-- Name: assets_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.assets ALTER COLUMN assets_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.assets_asset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    num_stars integer,
    num_planets integer,
    num_moons integer,
    has_life boolean,
    galaxy_type character varying(80),
    size numeric,
    age_in_millions_of_years numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    planet_parent text,
    has_life boolean,
    moon_type character varying(80),
    size numeric,
    age_in_millions_of_years numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    star_parent text,
    galaxy_parent text,
    num_moons integer,
    has_life boolean,
    planet_type character varying(80),
    size numeric,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    galaxy_parent text,
    num_planets integer,
    has_life boolean,
    star_type character varying(80),
    size numeric,
    age_in_millions_of_years numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.assets OVERRIDING SYSTEM VALUE VALUES (1, 'name', 'description', 'asset_type', 'asset_url', false);
INSERT INTO public.assets OVERRIDING SYSTEM VALUE VALUES (2, 'test1', 'js file', 'javascript', '~/javascript.js', false);
INSERT INTO public.assets OVERRIDING SYSTEM VALUE VALUES (3, 'test2', 'jpeg image file', 'image', '~/image.jpg', true);
INSERT INTO public.assets OVERRIDING SYSTEM VALUE VALUES (4, 'test3', 'html file', 'html', '~/index.html', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Test Galaxy', 'This is a test', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way.', 1001, 12311, 1, true, 'barred spiral galaxy', 1, 1);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Pinwheel Galaxy', 'Similar in appearance to a pinwheel toy.', 311, 10111, 3, false, 'spiral galaxy', 3, 3);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Large Magellanic Cloud', 'Named after Ferdinand Magellan', 214, 19800, 4, false, 'magellanic spiral', 4, 4);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Mice Galaxies', 'Appearance is similar to a mouse.', 341, 12001, 5, false, 'spiral galaxy', 5, 5);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (7, 'Sombrero Galaxy', 'Similar in appearance to a sombrero.', 3110, 9812, 6, true, 'unclassified', 6, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 'Beautiful at night', 'Earth', false, 'moon/satellite', 1234, 2340, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Proteus', 'its moon number 2', 'Neptune', false, 'moon/satellite', 1212, 4520, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Triton', 'its moon number 3', 'Neptune', false, 'moon/satellite', 6200, 5752, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Oberon', 'its moon number 4', 'Uranus', false, 'moon/satellite', 453, 88910, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Titania', 'its moon number 5', 'Uranus', false, 'moon/satellite', 270, 20071, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Titan', 'its moon number 6', 'Saturn', false, 'moon/satellite', 70012, 6336, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Rhea', 'its moon number 7', 'Saturn', false, 'moon/satellite', 201, 6210, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Dione', 'its moon number 8', 'Saturn', false, 'moon/satellite', 1190, 5150, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Tethys', 'its moon number 9', 'Saturn', false, 'moon/satellite', 212, 7689, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Enceladus', 'its moon number 10', 'Saturn', false, 'moon/satellite', 404, 2179, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Mimas', 'its moon number 11', 'Saturn', false, 'moon/satellite', 1884, 3412, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Callisto', 'its moon number 12', 'Jupiter', false, 'moon/satellite', 312, 5558, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Ganymede', 'its moon number 13', 'Jupiter', false, 'moon/satellite', 7934, 19193, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Europa', 'its moon number 14', 'Jupiter', false, 'moon/satellite', 1427, 2034, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Io', 'its moon number 15', 'Jupiter', false, 'moon/satellite', 456, 7129, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Thebe', 'its moon number 16', 'Jupiter', false, 'moon/satellite', 1533, 6890, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Amaltea', 'its moon number 17', 'Jupiter', false, 'moon/satellite', 57071, 5523, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Metis', 'its moon number 19', 'Jupiter', false, 'moon/satellite', 1863, 2901, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Phobos', 'its moon number 20', 'Mars', false, 'moon/satellite', 9979, 8089, NULL);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Phobos', 'A Mars Moon', 'Mars', false, 'moon/satellite', 9979, 8089, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Earth', 'Green and has a water or air', 'Sun', 'Milky Way', 1, true, 'Terrestrial', 24901.461, 45400, 0, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Earth', 'Green and has a water or air', 'Sun', 'Milky Way', 1, true, 'Terrestrial', 24901.461, 45400, 0, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Mercury', 'The smallest planet in the Solar System. Closest planet to the Sun.', 'Sun', 'Milky Way', 0, false, 'Terrestrial', 0.055, 12311, 2, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Venus', 'Where women are said to come from', 'Sun', 'Milky Way', 0, false, 'Terrestrial', 1091, 2222, 1, false, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Mars', 'Where men are said to have been created', 'Sun', 'Milky Way', 2, false, 'Terrestrial', 112, 6091, 1, false, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Jupiter', 'The big one with the tornado spot', 'Sun', 'Milky Way', 80, false, 'Giant', 3232, 7070, 2, false, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Saturn', 'This one RINGS a bell', 'Sun', 'Milky Way', 83, false, 'Giant', 542, 1231, 3, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Uranus', 'Scientists intent on drilling are set to probe Uranus', 'Sun', 'Milky Way', 27, false, 'Giant', 10117, 7754, 4, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Neptune', 'No not the sea god', 'Sun', 'Milky Way', 14, false, 'Giant', 5142, 11101, 5, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Eris', 'I heard about a playstation modification project with the same name', 'Sun', 'Milky Way', 1, false, 'Terrestrial', 2114, 4112, 6, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Makemake', 'The planet so fun they named it twice', 'Sun', 'Milky Way', 1, false, 'Terrestrial', 417, 33123, 7, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Pluto', 'Our solar systems forgetten dwarf planet', 'Sun', 'Milky Way', 5, false, 'Dwarf', 9111, 6767, 8, true, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 'Haumea', 'Not to be confused with Humans who live on Earth', 'Sun', 'Milky Way', 2, false, 'Terrestrial', 911, 11991, 9, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System.', 'Milky Way', 8, true, 'G-Type Main Sequencer (G2V)', 432168.6, 4600, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Canis Majoris', 'Sounds like the name of a great dog', 'Milky Way', 7, true, 'Constellation', 740.000, 10, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Errai', 'Not to be confused with Error', 'Milky Way', 7, true, 'Spectoscopic Binary (K1IV)', 1.4100, 3250, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Alshat', 'Not to be confused with Asshat', 'Milky Way', 0, false, 'Subgiant Star (B9IV)', 1913984995, 32600, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Godstar', 'This is not real. Nothing is real.', 'Heaven', 777, true, 'Evening Star (OOO)', 123, 456, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Diablo', 'This is not real. Nothing is real.', 'Hell', 666, true, 'Morning Star (XXX)', 456, 123, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (7, 'Death Star', 'You know the one from Star Wars', 'Star Wars', 999, true, 'Death Star (DS1)', 999, 888, NULL);


--
-- Name: assets_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.assets_asset_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 4, true);


--
-- Name: assets assests_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assests_unique UNIQUE (assets_id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (assets_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

