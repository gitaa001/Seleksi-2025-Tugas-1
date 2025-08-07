--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: delete_concept_perf_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_concept_perf_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM concept_performance WHERE id_perform = OLD.id_perform;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_concept_perf_func() OWNER TO postgres;

--
-- Name: delete_episode_rank_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_episode_rank_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM trainee_episode_rank WHERE episode = OLD.episode;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_episode_rank_func() OWNER TO postgres;

--
-- Name: delete_eval_trainee_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_eval_trainee_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM trainee_evaluation WHERE evaluation_id = OLD.evaluation_id;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_eval_trainee_func() OWNER TO postgres;

--
-- Name: delete_evaluation_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_evaluation_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM individual_evaluation WHERE evaluation_id = OLD.evaluation_id;
    DELETE FROM group_battle_evaluation WHERE evaluation_id = OLD.evaluation_id;
    DELETE FROM position_evaluation WHERE evaluation_id = OLD.evaluation_id;
    DELETE FROM concept_evaluation WHERE evaluation_id = OLD.evaluation_id;
    DELETE FROM debut_evaluation WHERE evaluation_id = OLD.evaluation_id;
    DELETE FROM trainee_evaluation WHERE evaluation_id = OLD.evaluation_id;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_evaluation_func() OWNER TO postgres;

--
-- Name: delete_group_battle_perf_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_group_battle_perf_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM group_battle_performance WHERE id_perform = OLD.id_perform;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_group_battle_perf_func() OWNER TO postgres;

--
-- Name: delete_position_perf_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_position_perf_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM position_performance WHERE id_perform = OLD.id_perform;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_position_perf_func() OWNER TO postgres;

--
-- Name: delete_trainee_eval_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_trainee_eval_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM trainee_evaluation WHERE trainee_id = OLD.id_trainee;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_trainee_eval_func() OWNER TO postgres;

--
-- Name: delete_trainee_rank_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_trainee_rank_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM trainee_episode_rank WHERE id_trainee = OLD.id_trainee;
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.delete_trainee_rank_func() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    id_album integer NOT NULL,
    title text NOT NULL,
    release_date text,
    label text,
    formats text,
    jpn_hot integer,
    jpn_digital integer,
    us_world integer,
    sales integer
);


ALTER TABLE public.album OWNER TO postgres;

--
-- Name: album_id_album_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_id_album_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_id_album_seq OWNER TO postgres;

--
-- Name: album_id_album_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.album_id_album_seq OWNED BY public.album.id_album;


--
-- Name: concept_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concept_evaluation (
    id_perform integer NOT NULL,
    evaluation_id integer NOT NULL,
    concept text,
    producer text,
    id_single integer,
    votes integer
);


ALTER TABLE public.concept_evaluation OWNER TO postgres;

--
-- Name: concept_evaluation_id_perform_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concept_evaluation_id_perform_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concept_evaluation_id_perform_seq OWNER TO postgres;

--
-- Name: concept_evaluation_id_perform_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concept_evaluation_id_perform_seq OWNED BY public.concept_evaluation.id_perform;


--
-- Name: concept_performance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concept_performance (
    id integer NOT NULL,
    id_perform integer NOT NULL,
    trainee_position text,
    trainee_votes integer,
    trainee_rank integer,
    bonus integer
);


ALTER TABLE public.concept_performance OWNER TO postgres;

--
-- Name: concept_performance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concept_performance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concept_performance_id_seq OWNER TO postgres;

--
-- Name: concept_performance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concept_performance_id_seq OWNED BY public.concept_performance.id;


--
-- Name: debut_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.debut_evaluation (
    id_perform integer NOT NULL,
    evaluation_id integer NOT NULL,
    id_single text,
    trainee_position text
);


ALTER TABLE public.debut_evaluation OWNER TO postgres;

--
-- Name: debut_evaluation_id_perform_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.debut_evaluation_id_perform_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.debut_evaluation_id_perform_seq OWNER TO postgres;

--
-- Name: debut_evaluation_id_perform_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.debut_evaluation_id_perform_seq OWNED BY public.debut_evaluation.id_perform;


--
-- Name: episodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episodes (
    episode integer NOT NULL,
    broadcast_date text,
    nationwide_rate real,
    seoul_rate real
);


ALTER TABLE public.episodes OWNER TO postgres;

--
-- Name: evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation (
    evaluation_id integer NOT NULL,
    evaluation_type text NOT NULL
);


ALTER TABLE public.evaluation OWNER TO postgres;

--
-- Name: evaluation_evaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluation_evaluation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evaluation_evaluation_id_seq OWNER TO postgres;

--
-- Name: evaluation_evaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluation_evaluation_id_seq OWNED BY public.evaluation.evaluation_id;


--
-- Name: group_battle_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_battle_evaluation (
    id_perform integer NOT NULL,
    evaluation_id integer NOT NULL,
    original_artist text,
    song text
);


ALTER TABLE public.group_battle_evaluation OWNER TO postgres;

--
-- Name: group_battle_evaluation_id_perform_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_battle_evaluation_id_perform_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_battle_evaluation_id_perform_seq OWNER TO postgres;

--
-- Name: group_battle_evaluation_id_perform_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_battle_evaluation_id_perform_seq OWNED BY public.group_battle_evaluation.id_perform;


--
-- Name: group_battle_performance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_battle_performance (
    id integer NOT NULL,
    id_perform integer,
    team_name text,
    trainee_position text,
    trainee_votes integer,
    trainee_bonus integer
);


ALTER TABLE public.group_battle_performance OWNER TO postgres;

--
-- Name: group_battle_performance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_battle_performance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_battle_performance_id_seq OWNER TO postgres;

--
-- Name: group_battle_performance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_battle_performance_id_seq OWNED BY public.group_battle_performance.id;


--
-- Name: individual_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_evaluation (
    id_perform integer NOT NULL,
    evaluation_id integer NOT NULL,
    company text,
    grade text,
    song text
);


ALTER TABLE public.individual_evaluation OWNER TO postgres;

--
-- Name: individual_evaluation_id_perform_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individual_evaluation_id_perform_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.individual_evaluation_id_perform_seq OWNER TO postgres;

--
-- Name: individual_evaluation_id_perform_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individual_evaluation_id_perform_seq OWNED BY public.individual_evaluation.id_perform;


--
-- Name: position_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.position_evaluation (
    id_perform integer NOT NULL,
    evaluation_id integer NOT NULL,
    category text,
    song text,
    original_artist text
);


ALTER TABLE public.position_evaluation OWNER TO postgres;

--
-- Name: position_evaluation_id_perform_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_evaluation_id_perform_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_evaluation_id_perform_seq OWNER TO postgres;

--
-- Name: position_evaluation_id_perform_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_evaluation_id_perform_seq OWNED BY public.position_evaluation.id_perform;


--
-- Name: position_performance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.position_performance (
    id integer NOT NULL,
    id_perform integer NOT NULL,
    trainee_votes double precision,
    rank_in_team integer,
    trainee_bonus integer
);


ALTER TABLE public.position_performance OWNER TO postgres;

--
-- Name: position_performance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_performance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_performance_id_seq OWNER TO postgres;

--
-- Name: position_performance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_performance_id_seq OWNED BY public.position_performance.id;


--
-- Name: single_chart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.single_chart (
    id_single integer NOT NULL,
    year integer NOT NULL,
    peak_kor integer,
    kor_hot_100 integer,
    id_album integer
);


ALTER TABLE public.single_chart OWNER TO postgres;

--
-- Name: single_chart_id_single_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.single_chart_id_single_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.single_chart_id_single_seq OWNER TO postgres;

--
-- Name: single_chart_id_single_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.single_chart_id_single_seq OWNED BY public.single_chart.id_single;


--
-- Name: singles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.singles (
    id_single integer NOT NULL,
    title text NOT NULL,
    lyrics_writer text,
    music_producer text,
    arrangement text,
    duration text
);


ALTER TABLE public.singles OWNER TO postgres;

--
-- Name: singles_id_single_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.singles_id_single_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.singles_id_single_seq OWNER TO postgres;

--
-- Name: singles_id_single_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.singles_id_single_seq OWNED BY public.singles.id_single;


--
-- Name: trainee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainee (
    id_trainee integer NOT NULL,
    name text NOT NULL,
    company text,
    age integer,
    first_grade text,
    last_grade text,
    first_rank integer,
    final_rank text
);


ALTER TABLE public.trainee OWNER TO postgres;

--
-- Name: trainee_episode_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainee_episode_rank (
    episode integer NOT NULL,
    id_trainee integer NOT NULL,
    rank text
);


ALTER TABLE public.trainee_episode_rank OWNER TO postgres;

--
-- Name: trainee_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainee_evaluation (
    id integer NOT NULL,
    trainee_id integer NOT NULL,
    evaluation_id integer NOT NULL
);


ALTER TABLE public.trainee_evaluation OWNER TO postgres;

--
-- Name: trainee_evaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainee_evaluation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainee_evaluation_id_seq OWNER TO postgres;

--
-- Name: trainee_evaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainee_evaluation_id_seq OWNED BY public.trainee_evaluation.id;


--
-- Name: trainee_id_trainee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainee_id_trainee_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trainee_id_trainee_seq OWNER TO postgres;

--
-- Name: trainee_id_trainee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainee_id_trainee_seq OWNED BY public.trainee.id_trainee;


--
-- Name: album id_album; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album ALTER COLUMN id_album SET DEFAULT nextval('public.album_id_album_seq'::regclass);


--
-- Name: concept_evaluation id_perform; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_evaluation ALTER COLUMN id_perform SET DEFAULT nextval('public.concept_evaluation_id_perform_seq'::regclass);


--
-- Name: concept_performance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_performance ALTER COLUMN id SET DEFAULT nextval('public.concept_performance_id_seq'::regclass);


--
-- Name: debut_evaluation id_perform; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debut_evaluation ALTER COLUMN id_perform SET DEFAULT nextval('public.debut_evaluation_id_perform_seq'::regclass);


--
-- Name: evaluation evaluation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation ALTER COLUMN evaluation_id SET DEFAULT nextval('public.evaluation_evaluation_id_seq'::regclass);


--
-- Name: group_battle_evaluation id_perform; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_battle_evaluation ALTER COLUMN id_perform SET DEFAULT nextval('public.group_battle_evaluation_id_perform_seq'::regclass);


--
-- Name: group_battle_performance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_battle_performance ALTER COLUMN id SET DEFAULT nextval('public.group_battle_performance_id_seq'::regclass);


--
-- Name: individual_evaluation id_perform; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_evaluation ALTER COLUMN id_perform SET DEFAULT nextval('public.individual_evaluation_id_perform_seq'::regclass);


--
-- Name: position_evaluation id_perform; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_evaluation ALTER COLUMN id_perform SET DEFAULT nextval('public.position_evaluation_id_perform_seq'::regclass);


--
-- Name: position_performance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_performance ALTER COLUMN id SET DEFAULT nextval('public.position_performance_id_seq'::regclass);


--
-- Name: single_chart id_single; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.single_chart ALTER COLUMN id_single SET DEFAULT nextval('public.single_chart_id_single_seq'::regclass);


--
-- Name: singles id_single; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singles ALTER COLUMN id_single SET DEFAULT nextval('public.singles_id_single_seq'::regclass);


--
-- Name: trainee id_trainee; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee ALTER COLUMN id_trainee SET DEFAULT nextval('public.trainee_id_trainee_seq'::regclass);


--
-- Name: trainee_evaluation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_evaluation ALTER COLUMN id SET DEFAULT nextval('public.trainee_evaluation_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (id_album, title, release_date, label, formats, jpn_hot, jpn_digital, us_world, sales) FROM stdin;
1	30 Girls 6 Concepts	August 18, 2018	Stone Music Entertainment	Digital download	14	7	9	2473
2	Produce 48 Final	September 1, 2018	Stone Music Entertainment	Digital download	22	0	0	0
\.


--
-- Data for Name: concept_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concept_evaluation (id_perform, evaluation_id, concept, producer, id_single, votes) FROM stdin;
1	5	Contemporary Girls Pop	oReO	5	138
2	5	New Jack Swing	Masked Rider (Kamen Rider)	2	242
3	5	Hip Hop R&B Pop	Full8loom	6	89
4	5	Tropical Pop Dance	WonderKid & Shin Kung	1	266
5	5	Moombahton Trap	EDEN	3	241
6	5	Pop Dance	Lee Daehwi	4	222
\.


--
-- Data for Name: concept_performance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concept_performance (id, id_perform, trainee_position, trainee_votes, trainee_rank, bonus) FROM stdin;
1	1	Main vocal	18	24	0
2	1	Sub vocal 1	42	13	0
3	1	Sub vocal 2	28	19	0
4	1	Sub vocal 3	10	28	0
5	1	Sub vocal 4	37	15	0
6	2	Main vocal	27	20	0
7	2	Sub vocal 1	76	3	0
8	2	Sub vocal 2	59	6	0
9	2	Sub vocal 3	16	26	0
10	2	Sub vocal 4	63	5	0
11	3	Main vocal	9	30	0
12	3	Sub vocal 1	26	21	0
13	3	Sub vocal 2	22	23	0
14	3	Rapper 1	17	25	0
15	3	Rapper 2	15	27	0
16	4	Main vocal	36	16	200000
17	4	Sub vocal 1	50	10	200000
18	4	Sub vocal 2	79	2	500000
19	4	Sub vocal 3	53	9	200000
20	4	Rapper	46	11	200000
21	5	Main vocal	65	4	0
22	5	Sub vocal 1	44	12	0
23	5	Sub vocal 2	56	7	0
24	5	Rapper 1	41	14	0
25	5	Rapper 2	35	17	0
26	6	Main vocal	55	8	0
27	6	Sub vocal 1	35	17	0
28	6	Sub vocal 2	10	28	0
29	6	Sub vocal 3	23	22	0
30	6	Sub vocal 4	99	1	0
\.


--
-- Data for Name: debut_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.debut_evaluation (id_perform, evaluation_id, id_single, trainee_position) FROM stdin;
1	5	8	Main vocal
2	5	8	Sub vocal 1
3	5	8	Sub vocal 2
4	5	8	Sub vocal 3
5	5	8	Sub vocal 4
6	5	8	Sub vocal 5
7	5	8	Sub vocal 6
8	5	8	Sub vocal 7
9	5	8	Sub vocal 8
10	5	8	Sub vocal 9
11	5	7	Main vocal
12	5	7	Sub vocal 1
13	5	7	Sub vocal 2
14	5	7	Sub vocal 3
15	5	7	Sub vocal 4
16	5	7	Sub vocal 5
17	5	7	Sub vocal 6
18	5	7	Sub vocal 7
19	5	7	Sub vocal 8
20	5	7	Sub vocal 9
\.


--
-- Data for Name: episodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episodes (episode, broadcast_date, nationwide_rate, seoul_rate) FROM stdin;
1	June 15, 2018	1.132	0
2	June 22, 2018	1.913	1.768
3	June 29, 2018	1.999	2.098
4	July 6, 2018	2.833	3.068
5	July 13, 2018	2.538	2.732
6	July 20, 2018	2.479	3.08
7	July 27, 2018	2.075	2.266
8	August 3, 2018	2.397	2.399
9	August 10, 2018	2.561	2.79
10	August 17, 2018	2.594	3.087
11	August 24, 2018	2.435	2.556
12	August 31, 2018	3.085	3.299
\.


--
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (evaluation_id, evaluation_type) FROM stdin;
1	individual
2	group_battle
3	position
4	concept
5	debut
\.


--
-- Data for Name: group_battle_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_battle_evaluation (id_perform, evaluation_id, original_artist, song) FROM stdin;
1	2	GFRIEND	Love Whisper
2	2	Red Velvet	Peek-a-Boo
3	2	AOA	Short Hair
4	2	Kara	Mamma Mia!
5	2	AKB48	High Tension
6	2	BLACKPINK	Boombayah
7	2	TWICE	Like Ooh-Ahh (Japanese version)
8	2	I.O.I	Very Very Very
\.


--
-- Data for Name: group_battle_performance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_battle_performance (id, id_perform, team_name, trainee_position, trainee_votes, trainee_bonus) FROM stdin;
1	1	ChilJeonPalgi	Main vocal	28	0
2	1	ChilJeonPalgi	Sub vocal 1	52	0
3	1	ChilJeonPalgi	Sub vocal 2	88	0
4	1	ChilJeonPalgi	Sub vocal 3	22	0
5	1	ChilJeonPalgi	Sub vocal 4	106	0
6	1	ChilJeonPalgi	Sub vocal 5	38	0
7	1	Giant Baby	Main vocal	330	10000
8	1	Giant Baby	Sub vocal 1	42	10000
9	1	Giant Baby	Sub vocal 2	32	10000
10	1	Giant Baby	Sub vocal 3	30	10000
11	1	Giant Baby	Sub vocal 4	18	10000
12	1	Giant Baby	Sub vocal 5	36	10000
13	2	pikachu chu	Main vocal	78	0
14	2	pikachu chu	Sub vocal 1	4	0
15	2	pikachu chu	Sub vocal 2	74	0
16	2	pikachu chu	Sub vocal 3	28	0
17	2	pikachu chu	Sub vocal 4	110	0
18	2	pikachu chu	Sub vocal 5	54	0
19	2	Heuheungee Nan Yeowoo	Main vocal	92	10000
20	2	Heuheungee Nan Yeowoo	Sub vocal 1	26	10000
21	2	Heuheungee Nan Yeowoo	Sub vocal 2	98	10000
22	2	Heuheungee Nan Yeowoo	Sub vocal 3	116	10000
23	2	Heuheungee Nan Yeowoo	Sub vocal 4	102	10000
24	2	Heuheungee Nan Yeowoo	Sub vocal 5	40	10000
25	3	BbaekkomBbaekkom	Main vocal	152	10000
26	3	BbaekkomBbaekkom	Sub vocal 1	52	10000
27	3	BbaekkomBbaekkom	Sub vocal 2	64	10000
28	3	BbaekkomBbaekkom	Sub vocal 3	120	10000
29	3	BbaekkomBbaekkom	Rapper 1	28	10000
30	3	BbaekkomBbaekkom	Rapper 2	26	10000
31	3	High Class	Main vocal	148	0
32	3	High Class	Sub vocal 2	50	0
33	3	High Class	Sub vocal 3	90	0
34	3	High Class	Rapper 1	16	0
35	3	High Class	Rapper 2	36	0
36	4	Eyeshadow	Main vocal	66	10000
37	4	Eyeshadow	Sub vocal 1	32	10000
38	4	Eyeshadow	Sub vocal 2	48	10000
39	4	Eyeshadow	Sub vocal 3	138	10000
40	4	Eyeshadow	Sub vocal 4	138	10000
41	4	OMG What to do	Main vocal	18	0
42	4	OMG What to do	Sub vocal 1	88	0
43	4	OMG What to do	Sub vocal 2	92	0
44	4	OMG What to do	Sub vocal 3	86	0
45	4	OMG What to do	Sub vocal 4	28	0
46	4	OMG What to do	Sub vocal 5	56	0
47	5	Power Rainbow	Main vocal	40	0
48	5	Power Rainbow	Sub vocal 1	46	0
49	5	Power Rainbow	Sub vocal 2	56	0
50	5	Power Rainbow	Sub vocal 3	28	0
51	5	Power Rainbow	Rapper 1	58	0
52	5	Power Rainbow	Rapper 2	50	0
53	5	Tensionup Girls	Main vocal	84	10000
54	5	Tensionup Girls	Sub vocal 1	60	10000
55	5	Tensionup Girls	Sub vocal 2	188	10000
56	5	Tensionup Girls	Rapper 1	160	10000
57	5	Tensionup Girls	Rapper 2	12	10000
58	6	BLACK WORLD	Main rapper	54	0
59	6	BLACK WORLD	Sub rapper 1	198	0
60	6	BLACK WORLD	Sub rapper 2	22	0
61	6	BLACK WORLD	Vocal 1	22	0
62	6	BLACK WORLD	Vocal 2	30	0
63	6	SNACK	Main rapper	44	10000
64	6	SNACK	Sub rapper 1	102	10000
65	6	SNACK	Sub rapper 2	86	10000
66	6	SNACK	Vocal 1	42	10000
67	6	SNACK	Vocal 2	144	10000
68	6	SNACK	Vocal 3	30	10000
69	7	Pyong	Main vocal	50	10000
70	7	Pyong	Sub vocal 1	104	10000
71	7	Pyong	Sub vocal 2	172	10000
72	7	Pyong	Sub vocal 3	26	10000
73	7	Pyong	Rapper 1	10	10000
74	7	Pyong	Rapper 2	80	10000
75	7	NeoKkeoYa	Main vocal	86	0
76	7	NeoKkeoYa	Sub vocal 1	14	0
77	7	NeoKkeoYa	Sub vocal 2	86	0
78	7	NeoKkeoYa	Sub vocal 3	72	0
79	7	NeoKkeoYa	Rapper 1	38	0
80	7	NeoKkeoYa	Rapper 2	46	0
81	8	MixJuice	Main vocal	64	10000
82	8	MixJuice	Sub vocal 1	42	10000
83	8	MixJuice	Sub vocal 2	112	10000
84	8	MixJuice	Sub vocal 3	70	10000
85	8	MixJuice	Rapper 1	62	10000
86	8	MixJuice	Rapper 2	90	10000
87	8	BerryBerry Raspberry	Main vocal	34	0
88	8	BerryBerry Raspberry	Sub vocal 1	24	0
89	8	BerryBerry Raspberry	Sub vocal 2	164	0
90	8	BerryBerry Raspberry	Sub vocal 3	46	0
91	8	BerryBerry Raspberry	Rapper 1	34	0
92	8	BerryBerry Raspberry	Rapper 2	54	0
\.


--
-- Data for Name: individual_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individual_evaluation (id_perform, evaluation_id, company, grade, song) FROM stdin;
1	1	Independent	C	Roller Coaster - Chungha
3	1	8D Creative	F	You and I - IU
4	1	A Team Entertainment	A	Lip & Hip - Hyuna
5	1	Banana Culture	C	I Don't Like Your Girlfriend - Weki Meki
6	1	Banana Culture	A	I Don't Like Your Girlfriend - Weki Meki
7	1	Blockberry Creative	C	Lip & Hip - Hyuna
8	1	CNC Entertainment	B	Team - Iggy Azalea
11	1	CNC Entertainment	C	Team - Iggy Azalea
13	1	Collazoo Company	B	My House - 2PM
14	1	CUBE Entertainment	D	Red - Hyuna
15	1	FAVE Entertainment	D	Playing With Fire - Black Pink
16	1	FENT	A	So Hot - Wonder Girls
17	1	FNC Entertainment	A	Power - Little Mix
18	1	FNC Entertainment	C	Power - Little Mix
19	1	HOW Entertainment	C	Celeb Five - Celeb Five
20	1	HOW Entertainment	B	Celeb Five - Celeb Five
21	1	HOW Entertainment	A	Celeb Five - Celeb Five
22	1	Million Market	C	Humble - Kendrick Lamar & Aing - Orange Caramel
23	1	Million Market	B	Humble - Kendrick Lamar & Aing - Orange Caramel
24	1	MMO Entertainment	C	Heroine - Sunmi
25	1	M&D17	B	Roller Coaster - Chungha
26	1	M&D17	C	Roller Coaster - Chungha
28	1	MNH Entertainment	A	Burn Break Crash - Aanysa x Snakehips
29	1	PLEDIS Entertainment	A	Havana - Camila Cabello
30	1	PLEDIS Entertainment	C	Havana - Camila Cabello
31	1	RBW Entertainment	A	Pretty U - Seventeen
32	1	RBW Entertainment	C	Pretty U - Seventeen
33	1	Starship Entertainment	B	Wings - Little Mix
36	1	Stone Music Entertainment	C	Chewing Gum - NCT Dream
38	1	Stone Music Entertainment	B	Chewing Gum - NCT Dream
39	1	Stone Music Entertainment	A	Chewing Gum - NCT Dream
40	1	The Music Works	B	?Question Mark - Primary
42	1	Urban Works Entertainment	D	No Matter What - BoA X Beenzino
43	1	Wellmade Yedang	B	Breathe - Miss A
44	1	Wellmade Yedang	A	Breathe - Miss A
45	1	WM Entertainment	B	Shower - Becky G
46	1	WM Entertainment	A	Shower - Becky G
48	1	Woollim Entertainment	A	Ah-Choo - Lovelyz & Bad - Infinite
49	1	Woollim Entertainment	C	Ah-Choo - Lovelyz & Bad - Infinite
51	1	Woollim Entertainment	B	Ah-Choo - Lovelyz & Bad - Infinite
52	1	YGK+ Entertainment	F	Only You - Miss A
53	1	YGK+ Entertainment	D	Only You - Miss A
54	1	Yuehua Entertainment	B	Move - Little Mix
56	1	Yuehua Entertainment	A	Move - Little Mix
57	1	ZB Label	B	Gashina - Sunmi
58	1	AKB48	A	Dancing Hero (Eat You Up) - Yoko Oginome
59	1	AKB48	F	Dancing Hero (Eat You Up) - Yoko Oginome
60	1	AKB48	B	Dancing Hero(Eat You Up) - Yoko Oginome
61	1	AKB48	D	Mister - KARA
62	1	AKB48	F	Mister - KARA
63	1	AKB48	C	Mister - KARA
64	1	AKB48	C	Get you! - AKB48
65	1	AKB48	D	Get you! - AKB48
66	1	AKB48	D	What's Your Name? - 4Minute
67	1	AKB48	F	What's Your Name? - 4Minute
71	1	AKB48	B	Playing With Fire - Blackpink
72	1	AKB48	C	Playing With Fire - Blackpink
73	1	AKB48	D	Playing With Fire - Blackpink
74	1	AKB48	F	Nage Kiss de Uchi Otose! - AKB48
75	1	AKB48	D	Nage Kiss de Uchi Otose! - AKB48
77	1	HKT48	D	Tomaranai Kanransha - HKT48
79	1	HKT48	F	Tomaranai Kanransha - HKT48
84	1	HKT48	A	Kuroi Tenshi - AKB48
85	1	HKT48	F	Tonari no Banana - AKB48
87	1	NGT48	C	Gee - SNSD
88	1	NGT48	D	Gee - SNSD
89	1	NMB48	D	Warota People - NMB48
91	1	NMB48	B	Warota People - NMB48
92	1	NMB48	C	Warota People - NMB48
93	1	NMB48	F	Warota People - NMB48
94	1	NMB48 & SKE48	F	Knock Knock - Twice
96	1	SKE48	B	Dear J - Itano Tomomi
\.


--
-- Data for Name: position_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.position_evaluation (id_perform, evaluation_id, category, song, original_artist) FROM stdin;
1	3	Vocal & Rap	Energetic	Wanna One
2	3	Vocal & Rap	Don't Know You	Heize
4	3	Vocal & Rap	Merry Christmas (Japanese version)	BoA
6	3	Vocal & Rap	Into the New World (Ballad Version)	Girls' Generation
8	3	Vocal & Rap	The Truth Untold	BTS
11	3	Vocal & Rap	Ddu-Du Ddu-Du	BLACKPINK
3	3	Dance	Side to Side	Ariana Grande
5	3	Dance	Sorry Not Sorry (Freedo Remix)	Demi Lovato
7	3	Dance	HandClap	Fitz and the Tantrums
9	3	Dance	Instruction	Jax Jones
10	3	Dance	Touch (Muffin Remix)	Little Mix
\.


--
-- Data for Name: position_performance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.position_performance (id, id_perform, trainee_votes, rank_in_team, trainee_bonus) FROM stdin;
1	1	511	1	5000
2	1	376	3	0
3	1	382	2	0
4	1	273	5	0
5	1	356	4	0
6	2	360	4	0
7	2	585	1	105000
8	2	400	3	0
9	2	499	2	0
10	4	543	1	5000
11	4	0	3	0
12	4	0	6	0
13	4	0	2	0
14	4	0	4	0
15	4	0	5	0
16	6	537	2	0
17	6	293	4	0
18	6	511	3	0
19	6	287	5	0
20	6	550	1	5000
21	8	298	2	0
22	8	289	4	0
23	8	559	1	5000
24	8	294	3	0
25	11	488	1	5000
26	11	352	4	0
27	11	384	3	0
28	11	432	2	0
29	11	311	5	0
30	11	176	6	0
31	3	358	5	0
32	3	411	3	0
33	3	446	2	0
34	3	391	4	0
35	3	469	1	5000
36	5	450	1	5000
37	5	403	2	0
38	5	364	4	0
39	5	397	3	0
40	5	337	5	0
41	7	312	6	0
42	7	442	3	0
43	7	313	5	0
44	7	477	1	105000
45	7	446	2	0
46	7	387	4	0
47	9	438	1	5000
48	9	287	6	0
49	9	358	3	0
50	9	313	5	0
51	9	382	2	0
52	9	335	4	0
53	10	369	3	0
54	10	395	2	0
55	10	423	1	5000
56	10	329	4	0
57	10	304	5	0
\.


--
-- Data for Name: single_chart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.single_chart (id_single, year, peak_kor, kor_hot_100, id_album) FROM stdin;
1	2018	66	66	1
2	2018	57	61	1
3	2018	24	37	1
4	2018	80	79	1
5	2018	70	68	1
6	2018	92	90	1
7	2018	0	0	2
8	2018	0	0	2
9	2018	0	0	2
10	2018	0	0	2
\.


--
-- Data for Name: singles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.singles (id_single, title, lyrics_writer, music_producer, arrangement, duration) FROM stdin;
1	Rollin' Rollin' (Love Potion)	Dally Sin-kung Wonderkid	Sin-kung Wonderkid	DallySin-kung Wonderkid	2:55
2	To Reach You (Memory Fabricators)	Lee Sang-ho Yong-bae (RBW)	Lee Sang-ho Yong-bae (RBW)	Lee Sang-ho Yong-bae (RBW)	3:30
3	Rumor (H.I.N.P)	SCORE Megatone EDENJ.rise	SCORE(Lee Kwan) Megatone(Kim Byeong Seok) EDEN	SCORE Megatone EDEN	3:17
4	See You Again (The Promise)	Lee Dae-hwi	Lee Dae-hwi Lissie Simpson	Lee Dae-hwi Lissie Simpson	3:07
5	1000% (Summer Wish)	Iggy (Oreo) Cino (Oreo) Uh-kim (Oreo)	Iggy (Oreo) Cino (Oreo) Uh-kim (Oreo)	Cino (Oreo) Uh-kim (Oreo)	3:36
6	I Am (1AM)	Jinri (Full8loom)	Glory Face (Full8oom) Jake K (Full8loom) Jinri (Full8loom)	Glory Face (Full8oom) Jake K (Full8loom)	3:24
7	We Together	Baekgom Bbaekkom Bernard	Baekgom Park Gi-tae	Park Gi-tae	4:03
8	Suki ni Nacchau Darou?	Yasushi Akimoto	Hirotaka Hayakawa Belex	Hirotaka Hayakawa Belex	4:09
9	Yume o Miteiru Aida (Korean Ver.)	Yasushi Akimoto	Iggy (OREO) Youngbae (RBW)	Iggy (OREO) Youngbae (RBW)	3:28
10	Yume o Miteiru Aida (Japanese Ver.)	Yasushi Akimoto	Iggy (OREO) Youngbae (RBW)	Iggy (OREO) Youngbae (RBW)	3:28
\.


--
-- Data for Name: trainee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainee (id_trainee, name, company, age, first_grade, last_grade, first_rank, final_rank) FROM stdin;
1	Park Seoyoung	Individual Trainee (No company)	20	C	D	34	55
2	Park Jinny	Individual Trainee (No company)	21	C	F	52	69
3	Kang Hyewon	8D Creative	20	F	F	38	8
4	Kim Choyeon	A Team Entertainment	18	A	C	68	50
5	Kim Nayoung	Banana Culture	17	C	A	55	21
6	Kim Dahye	Banana Culture	17	A	C	80	75
7	Go Yujin	Blockberry Creative	19	C	A	24	31
8	Kim Dayeon	CNC Entertainment	16	B	B	60	70
9	Kim Yubin	CNC Entertainment	17	B	D	90	88
10	Yoon Eunbin	CNC Entertainment	15	B	B	54	65
11	Lee Yujeong	CNC Entertainment	15	C	C	33	51
12	Hong Yeji	CNC Entertainment	17	B	F	76	78
13	Kim Hyunah	Collazoo Company	24	B	B	67	46
14	Han Chowon	CUBE Entertainment	17	D	B	64	13
15	Shin Suhyun	FAVE Entertainment	23	D	F	42	61
16	Kim Doah	Fent Entertainment	16	A	C	31	23
17	Park Haeyoon	FNC Entertainment	23	A	D	59	19
18	Cho Ahyeong	FNC Entertainment	18	C	B	83	72
19	Kim Minseo	HOW Entertainment	17	C	C	62	44
20	Wang Ke	HOW Entertainment	19	B	D	92	56
21	Yu Minyoung	HOW Entertainment	19	A	B	86	54
22	Son Eunchae	Million Market	20	C	B	95	32
23	Cho Sarang	Million Market	16	B	F	89	89
24	Won Seoyeon	MMO Entertainment	19	C	F	81	92
25	Park Minji	M&D17	20	B	B	49	53
26	Park Chanju	M&D17	20	C	D	85	68
27	Lee Chaejeong	M&D17	20	C	C	96	79
28	Lee Haeun	MNH Entertainment	15	A	A	51	48
29	Lee Gaeun	PLEDIS Entertainment	25	A	A	5	14
30	Huh Yunjin	PLEDIS Entertainment	18	C	F	19	26
31	Na Goeun	Rainbow Bridge World	20	A	A	36	29
32	Park Jieun	Rainbow Bridge World	22	C	F	77	80
33	An Yujin	Starship Entertainment	16	B	A	2	5
34	Jang Wonyoung	Starship Entertainment	15	B	B	3	1
35	Cho Kahyeon	Starship Entertainment	16	B	B	65	57
36	Bae Eunyeong	Stone Music Entertainment	22	C	B	18	36
37	Lee Sian	Stone Music Entertainment	20	C	D	8	30
38	Jang Gyuri	Stone Music Entertainment	22	B	F	6	25
39	Jo Yuri	Stone Music Entertainment	18	A	F	10	3
40	Yoon Haesol	The Music Works	22	B	D	40	35
41	Choi Soeun	The Music Works	18	B	C	86	90
42	Kim Minju	Urban Works Entertainment	18	D	C	13	11
43	Kang Damin	Wellmade Yedang	15	B	A	70	62
44	Hwang Soyeon	Wellmade Yedang	19	A	A	90	60
45	Lee Seunghyeon	WM Entertainment	18	B	C	66	73
46	Lee Chaeyeon	WM Entertainment	19	A	A	29	12
47	Cho Yeongin	WM Entertainment	18	B	C	74	84
48	Kwon Eunbi	Woollim Entertainment	24	A	C	25	7
49	Kim Sohee	Woollim Entertainment	16	C	B	48	43
50	Kim Suyun	Woollim Entertainment	18	C	C	58	47
51	Kim Chaewon	Woollim Entertainment	19	B	B	21	10
52	Ahn Yewon	YGK+ Entertainment	18	F	F	82	86
53	Choi Yeonsoo	YGK+ Entertainment	20	D	F	47	66
54	Kim Sihyeon	Yuehua Entertainment	20	B	A	15	27
55	Wang Yiren	Yuehua Entertainment	19	B	C	11	28
56	Choi Yena	Yuehua Entertainment	20	A	B	7	4
57	Alex Christine	ZB Label	23	B	C	88	82
58	Goto Moe	AKB48	18	F	C	16	24
59	Nagano Serika	AKB48	18	F	F	72	77
60	Nakano Ikumi	AKB48	19	D	B	43	59
61	Nakanishi Chiyori	AKB48	24	D	C	22	37
62	Mogi Shinobu	AKB48	22	F	D	44	63
63	Muto Tomu	AKB48	25	D	D	23	38
64	Miyazaki Miho	AKB48	26	D	D	17	15
65	Sato Minami	AKB48	16	D	F	57	39
66	Shinozaki Ayana	AKB48	23	F	F	84	91
67	Shitao Miu	AKB48	18	D	D	41	18
68	Asai Nanami	AKB48	19	F	D	26	42
69	Oda Erina	AKB48	22	C	F	56	64
70	Iwatate Saho	AKB48	25	B	D	46	40
71	Ichikawa Manami	AKB48	20	F	C	79	81
72	Chiba Erii	AKB48	16	F	F	27	33
73	Kojima Mako	AKB48	22	C	B	12	34
74	Takahashi Juri	AKB48	22	B	A	20	16
75	Takeuchi Miyu	AKB48	23	A	B	39	17
76	Honda Hitomi	AKB48	18	C	A	30	9
77	Matsuoka Natsumi	HKT48	23	F	C	35	67
78	Motomura Aoi	HKT48	22	D	B	37	52
79	Murakawa Bibian	HKT48	20	F	F	28	45
80	Miyawaki Sakura	HKT48	21	A	A	1	2
81	Aramaki Misaki	HKT48	18	F	F	50	49
82	Yabuki Nako	HKT48	18	F	A	14	6
83	Imada Mina	HKT48	22	D	C	53	76
84	Tsukiashi Amane	HKT48	20	F	F	78	Left The Show
85	Kurihara Sae	HKT48	23	F	D	73	83
86	Tanaka Miku	HKT48	18	F	C	63	Left The Show
87	Yamada Noe	NGT48	20	C	F	45	41
88	Hasegawa Rena	NGT48	18	D	F	61	71
89	Naiki Kokoro	NMB48	22	D	C	75	87
90	Murase Sae	NMB48	22	D	C	32	22
91	Shiroma Miru	NMB48	22	B	D	9	20
92	Umeyama Cocona	NMB48	16	F		94	Left The Show
93	Uemura Azusa	NMB48	20	F		93	Left The Show
94	Kato Yuuka	NMB48	22	C	B	71	74
95	Matsui Jurina	SKE48	22	B	B	4	Left the Show
96	Asai Yuka	SKE48	16	F	D	69	85
\.


--
-- Data for Name: trainee_episode_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainee_episode_rank (episode, id_trainee, rank) FROM stdin;
\.


--
-- Data for Name: trainee_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainee_evaluation (id, trainee_id, evaluation_id) FROM stdin;
\.


--
-- Name: album_id_album_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_id_album_seq', 1, false);


--
-- Name: concept_evaluation_id_perform_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concept_evaluation_id_perform_seq', 1, false);


--
-- Name: concept_performance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concept_performance_id_seq', 30, true);


--
-- Name: debut_evaluation_id_perform_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.debut_evaluation_id_perform_seq', 1, false);


--
-- Name: evaluation_evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluation_evaluation_id_seq', 1, false);


--
-- Name: group_battle_evaluation_id_perform_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_battle_evaluation_id_perform_seq', 1, false);


--
-- Name: group_battle_performance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_battle_performance_id_seq', 92, true);


--
-- Name: individual_evaluation_id_perform_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individual_evaluation_id_perform_seq', 96, true);


--
-- Name: position_evaluation_id_perform_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_evaluation_id_perform_seq', 1, false);


--
-- Name: position_performance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_performance_id_seq', 57, true);


--
-- Name: single_chart_id_single_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.single_chart_id_single_seq', 1, false);


--
-- Name: singles_id_single_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.singles_id_single_seq', 1, false);


--
-- Name: trainee_evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainee_evaluation_id_seq', 1, false);


--
-- Name: trainee_id_trainee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainee_id_trainee_seq', 1, false);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id_album);


--
-- Name: concept_evaluation concept_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_evaluation
    ADD CONSTRAINT concept_evaluation_pkey PRIMARY KEY (id_perform);


--
-- Name: concept_performance concept_performance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_performance
    ADD CONSTRAINT concept_performance_pkey PRIMARY KEY (id);


--
-- Name: debut_evaluation debut_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debut_evaluation
    ADD CONSTRAINT debut_evaluation_pkey PRIMARY KEY (id_perform);


--
-- Name: episodes episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_pkey PRIMARY KEY (episode);


--
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (evaluation_id);


--
-- Name: group_battle_evaluation group_battle_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_battle_evaluation
    ADD CONSTRAINT group_battle_evaluation_pkey PRIMARY KEY (id_perform);


--
-- Name: group_battle_performance group_battle_performance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_battle_performance
    ADD CONSTRAINT group_battle_performance_pkey PRIMARY KEY (id);


--
-- Name: individual_evaluation individual_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_evaluation
    ADD CONSTRAINT individual_evaluation_pkey PRIMARY KEY (id_perform);


--
-- Name: position_evaluation position_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_evaluation
    ADD CONSTRAINT position_evaluation_pkey PRIMARY KEY (id_perform);


--
-- Name: position_performance position_performance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_performance
    ADD CONSTRAINT position_performance_pkey PRIMARY KEY (id);


--
-- Name: single_chart single_chart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.single_chart
    ADD CONSTRAINT single_chart_pkey PRIMARY KEY (id_single);


--
-- Name: singles singles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singles
    ADD CONSTRAINT singles_pkey PRIMARY KEY (id_single);


--
-- Name: trainee_episode_rank trainee_episode_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_episode_rank
    ADD CONSTRAINT trainee_episode_rank_pkey PRIMARY KEY (episode, id_trainee);


--
-- Name: trainee_evaluation trainee_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_evaluation
    ADD CONSTRAINT trainee_evaluation_pkey PRIMARY KEY (id);


--
-- Name: trainee_evaluation trainee_evaluation_trainee_id_evaluation_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_evaluation
    ADD CONSTRAINT trainee_evaluation_trainee_id_evaluation_id_key UNIQUE (trainee_id, evaluation_id);


--
-- Name: trainee trainee_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee
    ADD CONSTRAINT trainee_name_key UNIQUE (name);


--
-- Name: trainee trainee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee
    ADD CONSTRAINT trainee_pkey PRIMARY KEY (id_trainee);


--
-- Name: individual_evaluation unique_individual_eval; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_evaluation
    ADD CONSTRAINT unique_individual_eval UNIQUE (evaluation_id, company, grade, song);


--
-- Name: concept_evaluation delete_concept_perf; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_concept_perf AFTER DELETE ON public.concept_evaluation FOR EACH ROW EXECUTE FUNCTION public.delete_concept_perf_func();


--
-- Name: episodes delete_episode_rank; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_episode_rank AFTER DELETE ON public.episodes FOR EACH ROW EXECUTE FUNCTION public.delete_episode_rank_func();


--
-- Name: evaluation delete_eval_trainee; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_eval_trainee AFTER DELETE ON public.evaluation FOR EACH ROW EXECUTE FUNCTION public.delete_eval_trainee_func();


--
-- Name: evaluation delete_evaluation; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_evaluation AFTER DELETE ON public.evaluation FOR EACH ROW EXECUTE FUNCTION public.delete_evaluation_func();


--
-- Name: group_battle_evaluation delete_group_battle_perf; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_group_battle_perf AFTER DELETE ON public.group_battle_evaluation FOR EACH ROW EXECUTE FUNCTION public.delete_group_battle_perf_func();


--
-- Name: position_evaluation delete_position_perf; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_position_perf AFTER DELETE ON public.position_evaluation FOR EACH ROW EXECUTE FUNCTION public.delete_position_perf_func();


--
-- Name: trainee delete_trainee_eval; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_trainee_eval AFTER DELETE ON public.trainee FOR EACH ROW EXECUTE FUNCTION public.delete_trainee_eval_func();


--
-- Name: trainee delete_trainee_rank; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER delete_trainee_rank AFTER DELETE ON public.trainee FOR EACH ROW EXECUTE FUNCTION public.delete_trainee_rank_func();


--
-- Name: concept_evaluation concept_evaluation_evaluation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_evaluation
    ADD CONSTRAINT concept_evaluation_evaluation_id_fkey FOREIGN KEY (evaluation_id) REFERENCES public.evaluation(evaluation_id) ON DELETE CASCADE;


--
-- Name: concept_evaluation concept_evaluation_id_single_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_evaluation
    ADD CONSTRAINT concept_evaluation_id_single_fkey FOREIGN KEY (id_single) REFERENCES public.singles(id_single) ON DELETE CASCADE;


--
-- Name: concept_performance concept_performance_id_perform_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concept_performance
    ADD CONSTRAINT concept_performance_id_perform_fkey FOREIGN KEY (id_perform) REFERENCES public.concept_evaluation(id_perform) ON DELETE CASCADE;


--
-- Name: debut_evaluation debut_evaluation_evaluation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.debut_evaluation
    ADD CONSTRAINT debut_evaluation_evaluation_id_fkey FOREIGN KEY (evaluation_id) REFERENCES public.evaluation(evaluation_id) ON DELETE CASCADE;


--
-- Name: group_battle_evaluation group_battle_evaluation_evaluation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_battle_evaluation
    ADD CONSTRAINT group_battle_evaluation_evaluation_id_fkey FOREIGN KEY (evaluation_id) REFERENCES public.evaluation(evaluation_id) ON DELETE CASCADE;


--
-- Name: group_battle_performance group_battle_performance_id_perform_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_battle_performance
    ADD CONSTRAINT group_battle_performance_id_perform_fkey FOREIGN KEY (id_perform) REFERENCES public.group_battle_evaluation(id_perform) ON DELETE CASCADE;


--
-- Name: individual_evaluation individual_evaluation_evaluation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_evaluation
    ADD CONSTRAINT individual_evaluation_evaluation_id_fkey FOREIGN KEY (evaluation_id) REFERENCES public.evaluation(evaluation_id) ON DELETE CASCADE;


--
-- Name: position_evaluation position_evaluation_evaluation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_evaluation
    ADD CONSTRAINT position_evaluation_evaluation_id_fkey FOREIGN KEY (evaluation_id) REFERENCES public.evaluation(evaluation_id) ON DELETE CASCADE;


--
-- Name: position_performance position_performance_id_perform_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_performance
    ADD CONSTRAINT position_performance_id_perform_fkey FOREIGN KEY (id_perform) REFERENCES public.position_evaluation(id_perform) ON DELETE CASCADE;


--
-- Name: single_chart single_chart_id_album_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.single_chart
    ADD CONSTRAINT single_chart_id_album_fkey FOREIGN KEY (id_album) REFERENCES public.album(id_album) ON DELETE SET NULL;


--
-- Name: single_chart single_chart_id_single_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.single_chart
    ADD CONSTRAINT single_chart_id_single_fkey FOREIGN KEY (id_single) REFERENCES public.singles(id_single);


--
-- Name: trainee_episode_rank trainee_episode_rank_episode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_episode_rank
    ADD CONSTRAINT trainee_episode_rank_episode_fkey FOREIGN KEY (episode) REFERENCES public.episodes(episode) ON DELETE CASCADE;


--
-- Name: trainee_episode_rank trainee_episode_rank_id_trainee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_episode_rank
    ADD CONSTRAINT trainee_episode_rank_id_trainee_fkey FOREIGN KEY (id_trainee) REFERENCES public.trainee(id_trainee) ON DELETE CASCADE;


--
-- Name: trainee_evaluation trainee_evaluation_evaluation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_evaluation
    ADD CONSTRAINT trainee_evaluation_evaluation_id_fkey FOREIGN KEY (evaluation_id) REFERENCES public.evaluation(evaluation_id) ON DELETE CASCADE;


--
-- Name: trainee_evaluation trainee_evaluation_trainee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainee_evaluation
    ADD CONSTRAINT trainee_evaluation_trainee_id_fkey FOREIGN KEY (trainee_id) REFERENCES public.trainee(id_trainee) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

