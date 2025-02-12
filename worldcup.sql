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
    round character varying(50) NOT NULL,
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
    name text NOT NULL
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

INSERT INTO public.games VALUES (449, 2018, 'Final', 472, 473, 4, 2);
INSERT INTO public.games VALUES (450, 2018, 'Third Place', 474, 475, 2, 0);
INSERT INTO public.games VALUES (451, 2018, 'Semi-Final', 473, 475, 2, 1);
INSERT INTO public.games VALUES (452, 2018, 'Semi-Final', 472, 474, 1, 0);
INSERT INTO public.games VALUES (453, 2018, 'Quarter-Final', 473, 476, 3, 2);
INSERT INTO public.games VALUES (454, 2018, 'Quarter-Final', 475, 477, 2, 0);
INSERT INTO public.games VALUES (455, 2018, 'Quarter-Final', 474, 478, 2, 1);
INSERT INTO public.games VALUES (456, 2018, 'Quarter-Final', 472, 479, 2, 0);
INSERT INTO public.games VALUES (457, 2018, 'Eighth-Final', 475, 480, 2, 1);
INSERT INTO public.games VALUES (458, 2018, 'Eighth-Final', 477, 481, 1, 0);
INSERT INTO public.games VALUES (459, 2018, 'Eighth-Final', 474, 482, 3, 2);
INSERT INTO public.games VALUES (460, 2018, 'Eighth-Final', 478, 483, 2, 0);
INSERT INTO public.games VALUES (461, 2018, 'Eighth-Final', 473, 484, 2, 1);
INSERT INTO public.games VALUES (462, 2018, 'Eighth-Final', 476, 485, 2, 1);
INSERT INTO public.games VALUES (463, 2018, 'Eighth-Final', 479, 486, 2, 1);
INSERT INTO public.games VALUES (464, 2018, 'Eighth-Final', 472, 487, 4, 3);
INSERT INTO public.games VALUES (465, 2014, 'Final', 488, 487, 1, 0);
INSERT INTO public.games VALUES (466, 2014, 'Third Place', 489, 478, 3, 0);
INSERT INTO public.games VALUES (467, 2014, 'Semi-Final', 487, 489, 1, 0);
INSERT INTO public.games VALUES (468, 2014, 'Semi-Final', 488, 478, 7, 1);
INSERT INTO public.games VALUES (469, 2014, 'Quarter-Final', 489, 490, 1, 0);
INSERT INTO public.games VALUES (470, 2014, 'Quarter-Final', 487, 474, 1, 0);
INSERT INTO public.games VALUES (471, 2014, 'Quarter-Final', 478, 480, 2, 1);
INSERT INTO public.games VALUES (472, 2014, 'Quarter-Final', 488, 472, 1, 0);
INSERT INTO public.games VALUES (473, 2014, 'Eighth-Final', 478, 491, 2, 1);
INSERT INTO public.games VALUES (474, 2014, 'Eighth-Final', 480, 479, 2, 0);
INSERT INTO public.games VALUES (475, 2014, 'Eighth-Final', 472, 492, 2, 0);
INSERT INTO public.games VALUES (476, 2014, 'Eighth-Final', 488, 493, 2, 1);
INSERT INTO public.games VALUES (477, 2014, 'Eighth-Final', 489, 483, 2, 1);
INSERT INTO public.games VALUES (478, 2014, 'Eighth-Final', 490, 494, 2, 1);
INSERT INTO public.games VALUES (479, 2014, 'Eighth-Final', 487, 481, 1, 0);
INSERT INTO public.games VALUES (480, 2014, 'Eighth-Final', 474, 495, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (472, 'France');
INSERT INTO public.teams VALUES (473, 'Croatia');
INSERT INTO public.teams VALUES (474, 'Belgium');
INSERT INTO public.teams VALUES (475, 'England');
INSERT INTO public.teams VALUES (476, 'Russia');
INSERT INTO public.teams VALUES (477, 'Sweden');
INSERT INTO public.teams VALUES (478, 'Brazil');
INSERT INTO public.teams VALUES (479, 'Uruguay');
INSERT INTO public.teams VALUES (480, 'Colombia');
INSERT INTO public.teams VALUES (481, 'Switzerland');
INSERT INTO public.teams VALUES (482, 'Japan');
INSERT INTO public.teams VALUES (483, 'Mexico');
INSERT INTO public.teams VALUES (484, 'Denmark');
INSERT INTO public.teams VALUES (485, 'Spain');
INSERT INTO public.teams VALUES (486, 'Portugal');
INSERT INTO public.teams VALUES (487, 'Argentina');
INSERT INTO public.teams VALUES (488, 'Germany');
INSERT INTO public.teams VALUES (489, 'Netherlands');
INSERT INTO public.teams VALUES (490, 'Costa Rica');
INSERT INTO public.teams VALUES (491, 'Chile');
INSERT INTO public.teams VALUES (492, 'Nigeria');
INSERT INTO public.teams VALUES (493, 'Algeria');
INSERT INTO public.teams VALUES (494, 'Greece');
INSERT INTO public.teams VALUES (495, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 480, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 495, true);


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

