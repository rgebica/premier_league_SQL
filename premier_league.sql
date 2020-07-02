--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 11.6

-- Started on 2020-01-31 20:18:58

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

--
-- TOC entry 19 (class 2615 OID 203524)
-- Name: premier_league; Type: SCHEMA; Schema: -; Owner: 2019_gebica_rafal
--

CREATE SCHEMA premier_league;


ALTER SCHEMA premier_league OWNER TO "2019_gebica_rafal";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 241 (class 1259 OID 203533)
-- Name: Klub; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Klub" (
    id_klubu integer NOT NULL,
    nazwa_klubu character varying(50) NOT NULL,
    "liczba_zwycięstw" bigint NOT NULL,
    libcza_remisow bigint NOT NULL,
    liczba_porazek bigint NOT NULL,
    liczba_meczow bigint NOT NULL,
    strzelone_bramki bigint NOT NULL,
    stracone_bramki bigint NOT NULL,
    bilans_bramek bigint NOT NULL,
    liczba_punktow bigint NOT NULL,
    CONSTRAINT "Klub_libcza_remisow_check" CHECK ((libcza_remisow >= 0)),
    CONSTRAINT "Klub_liczba_meczow_check" CHECK ((liczba_meczow >= 0)),
    CONSTRAINT "Klub_liczba_porazek_check" CHECK ((liczba_porazek >= 0)),
    CONSTRAINT "Klub_liczba_punktow_check" CHECK ((liczba_punktow >= 0)),
    CONSTRAINT "Klub_liczba_zwycięstw_check" CHECK (("liczba_zwycięstw" >= 0)),
    CONSTRAINT "Klub_stracone_bramki_check" CHECK ((stracone_bramki >= 0)),
    CONSTRAINT "Klub_strzelone_bramki_check" CHECK ((strzelone_bramki >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Klub" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 240 (class 1259 OID 203531)
-- Name: Klub_id_klubu_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Klub_id_klubu_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Klub_id_klubu_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 240
-- Name: Klub_id_klubu_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Klub_id_klubu_seq" OWNED BY premier_league."Klub".id_klubu;


--
-- TOC entry 254 (class 1259 OID 203617)
-- Name: Komentarze; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Komentarze" (
    id_komentarza integer NOT NULL,
    id_meczu integer NOT NULL,
    username character varying(50) NOT NULL,
    komentarz character varying(200) NOT NULL,
    data date NOT NULL
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Komentarze" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 253 (class 1259 OID 203615)
-- Name: Komentarze_id_komentarza_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Komentarze_id_komentarza_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Komentarze_id_komentarza_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 253
-- Name: Komentarze_id_komentarza_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Komentarze_id_komentarza_seq" OWNED BY premier_league."Komentarze".id_komentarza;


--
-- TOC entry 246 (class 1259 OID 203568)
-- Name: Mecz; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Mecz" (
    id_meczu integer NOT NULL,
    id_gospodarza integer NOT NULL,
    id_goscia integer NOT NULL,
    stadion_id_stadionu integer NOT NULL,
    sedzia_id_sedziego integer NOT NULL,
    sedzia_glowny integer NOT NULL,
    sedzia_liniowy1 integer NOT NULL,
    sedzia_liniowy2 integer NOT NULL,
    nr_kolejki bigint NOT NULL,
    gole_gospodarzy bigint NOT NULL,
    gole_gosci bigint NOT NULL,
    widownia bigint NOT NULL,
    data_spotkania character varying(200)[],
    CONSTRAINT "Mecz_gole_gosci_check" CHECK ((gole_gosci >= 0)),
    CONSTRAINT "Mecz_gole_gospodarzy_check" CHECK ((gole_gospodarzy >= 0)),
    CONSTRAINT "Mecz_nr_kolejki_check" CHECK ((nr_kolejki >= 0)),
    CONSTRAINT "Mecz_widownia_check" CHECK ((widownia >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Mecz" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 245 (class 1259 OID 203566)
-- Name: Mecz_id_meczu_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Mecz_id_meczu_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Mecz_id_meczu_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 245
-- Name: Mecz_id_meczu_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Mecz_id_meczu_seq" OWNED BY premier_league."Mecz".id_meczu;


--
-- TOC entry 248 (class 1259 OID 203589)
-- Name: Sedziowie; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Sedziowie" (
    id_sedziego integer NOT NULL,
    imie character varying(50) NOT NULL,
    nazwisko character varying(50) NOT NULL,
    rodzaj_sedziego character varying(50) NOT NULL
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Sedziowie" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 247 (class 1259 OID 203587)
-- Name: Sedziowie_id_sedziego_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Sedziowie_id_sedziego_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Sedziowie_id_sedziego_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 247
-- Name: Sedziowie_id_sedziego_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Sedziowie_id_sedziego_seq" OWNED BY premier_league."Sedziowie".id_sedziego;


--
-- TOC entry 250 (class 1259 OID 203597)
-- Name: Stadion; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Stadion" (
    id_stadionu integer NOT NULL,
    nazwa_stadionu character varying(50) NOT NULL,
    pojemnosc bigint NOT NULL,
    CONSTRAINT "Stadion_pojemnosc_check" CHECK ((pojemnosc >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Stadion" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 249 (class 1259 OID 203595)
-- Name: Stadion_id_stadionu_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Stadion_id_stadionu_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Stadion_id_stadionu_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 249
-- Name: Stadion_id_stadionu_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Stadion_id_stadionu_seq" OWNED BY premier_league."Stadion".id_stadionu;


--
-- TOC entry 243 (class 1259 OID 203549)
-- Name: Trener; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Trener" (
    id_trenera integer NOT NULL,
    id_klubu integer NOT NULL,
    imie character varying(50) NOT NULL,
    nazwisko character varying(50) NOT NULL,
    data_urodzenia date NOT NULL,
    dlugosc_kontraktu bigint,
    pensja bigint NOT NULL,
    CONSTRAINT "Trener_pensja_check" CHECK ((pensja >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Trener" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 242 (class 1259 OID 203547)
-- Name: Trener_id_trenera_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Trener_id_trenera_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Trener_id_trenera_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 242
-- Name: Trener_id_trenera_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Trener_id_trenera_seq" OWNED BY premier_league."Trener".id_trenera;


--
-- TOC entry 244 (class 1259 OID 203559)
-- Name: Wydarzenia_meczowe_gosci; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Wydarzenia_meczowe_gosci" (
    id_wydarzen_meczowych bigint NOT NULL,
    id_meczu integer NOT NULL,
    id_zawodnika integer NOT NULL,
    id_gospodarza integer NOT NULL,
    id_goscia integer NOT NULL,
    liczba_minut bigint NOT NULL,
    minuta_meczu bigint NOT NULL,
    id_wydarzenia bigint NOT NULL,
    CONSTRAINT "Wydarzenia_meczowe_gosci_liczba_minut_check" CHECK ((liczba_minut >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Wydarzenia_meczowe_gosci" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 258 (class 1259 OID 203642)
-- Name: Wydarzenia_meczowe_gospodarzy; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Wydarzenia_meczowe_gospodarzy" (
    id_wydarzen_meczowych bigint NOT NULL,
    id_meczu integer NOT NULL,
    id_zawodnika integer NOT NULL,
    id_gospodarza integer NOT NULL,
    id_goscia integer NOT NULL,
    liczba_minut bigint NOT NULL,
    minuta_meczu bigint NOT NULL,
    id_wydarzenia bigint NOT NULL,
    CONSTRAINT "Wydarzenia_meczowe_gospodarzy_liczba_minut_check" CHECK ((liczba_minut >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Wydarzenia_meczowe_gospodarzy" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 252 (class 1259 OID 203606)
-- Name: Wykluczeni_zawodnicy; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Wykluczeni_zawodnicy" (
    id_wyklucznych_zawodnikow integer NOT NULL,
    id_zawodnika integer NOT NULL,
    rodzaj_wykluczenia character varying(50) NOT NULL,
    id_klubu integer NOT NULL,
    dlugosc_wykluczenia daterange[]
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Wykluczeni_zawodnicy" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 251 (class 1259 OID 203604)
-- Name: Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 251
-- Name: Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq" OWNED BY premier_league."Wykluczeni_zawodnicy".id_wyklucznych_zawodnikow;


--
-- TOC entry 260 (class 1259 OID 203651)
-- Name: Zawodnik1; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Zawodnik1" (
    id_zawodnika integer NOT NULL,
    imie character varying(50) NOT NULL,
    nazwisko character varying(50) NOT NULL,
    pozycja character varying(50) NOT NULL,
    data_urodzenia date NOT NULL,
    wzrost bigint NOT NULL,
    pensja bigint,
    CONSTRAINT "Zawodnik1_pensja_check" CHECK ((pensja >= 0)),
    CONSTRAINT "Zawodnik1_wzrost_check" CHECK ((wzrost >= 0))
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Zawodnik1" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 259 (class 1259 OID 203649)
-- Name: Zawodnik1_id_zawodnika_seq; Type: SEQUENCE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE SEQUENCE premier_league."Zawodnik1_id_zawodnika_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE premier_league."Zawodnik1_id_zawodnika_seq" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 259
-- Name: Zawodnik1_id_zawodnika_seq; Type: SEQUENCE OWNED BY; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER SEQUENCE premier_league."Zawodnik1_id_zawodnika_seq" OWNED BY premier_league."Zawodnik1".id_zawodnika;


--
-- TOC entry 239 (class 1259 OID 203525)
-- Name: Zawodnik_klubu; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league."Zawodnik_klubu" (
    id_zawodnika integer NOT NULL,
    id_klubu integer NOT NULL
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league."Zawodnik_klubu" OWNER TO "2019_gebica_rafal";

--
-- TOC entry 257 (class 1259 OID 203634)
-- Name: rodzaje_wydarzen; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league.rodzaje_wydarzen (
    id_wydarzenia bigint NOT NULL,
    nazwa_wydarzenia character varying NOT NULL
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league.rodzaje_wydarzen OWNER TO "2019_gebica_rafal";

--
-- TOC entry 256 (class 1259 OID 203629)
-- Name: sklad_gosci; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league.sklad_gosci (
    id_gospodarza integer NOT NULL,
    id_goscia integer NOT NULL,
    id_zawodnika integer NOT NULL,
    id_meczu integer NOT NULL,
    rezerwa boolean
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league.sklad_gosci OWNER TO "2019_gebica_rafal";

--
-- TOC entry 255 (class 1259 OID 203624)
-- Name: sklad_gosp; Type: TABLE; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE TABLE premier_league.sklad_gosp (
    id_gospodarza integer NOT NULL,
    id_goscia integer NOT NULL,
    id_zawodnika integer NOT NULL,
    id_meczu integer NOT NULL,
    rezerwa boolean
)
WITH (autovacuum_enabled='true');


ALTER TABLE premier_league.sklad_gosp OWNER TO "2019_gebica_rafal";

--
-- TOC entry 3123 (class 2604 OID 203536)
-- Name: Klub id_klubu; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Klub" ALTER COLUMN id_klubu SET DEFAULT nextval('premier_league."Klub_id_klubu_seq"'::regclass);


--
-- TOC entry 3143 (class 2604 OID 203620)
-- Name: Komentarze id_komentarza; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Komentarze" ALTER COLUMN id_komentarza SET DEFAULT nextval('premier_league."Komentarze_id_komentarza_seq"'::regclass);


--
-- TOC entry 3134 (class 2604 OID 203571)
-- Name: Mecz id_meczu; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz" ALTER COLUMN id_meczu SET DEFAULT nextval('premier_league."Mecz_id_meczu_seq"'::regclass);


--
-- TOC entry 3139 (class 2604 OID 203592)
-- Name: Sedziowie id_sedziego; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Sedziowie" ALTER COLUMN id_sedziego SET DEFAULT nextval('premier_league."Sedziowie_id_sedziego_seq"'::regclass);


--
-- TOC entry 3140 (class 2604 OID 203600)
-- Name: Stadion id_stadionu; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Stadion" ALTER COLUMN id_stadionu SET DEFAULT nextval('premier_league."Stadion_id_stadionu_seq"'::regclass);


--
-- TOC entry 3131 (class 2604 OID 203552)
-- Name: Trener id_trenera; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Trener" ALTER COLUMN id_trenera SET DEFAULT nextval('premier_league."Trener_id_trenera_seq"'::regclass);


--
-- TOC entry 3142 (class 2604 OID 203609)
-- Name: Wykluczeni_zawodnicy id_wyklucznych_zawodnikow; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wykluczeni_zawodnicy" ALTER COLUMN id_wyklucznych_zawodnikow SET DEFAULT nextval('premier_league."Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq"'::regclass);


--
-- TOC entry 3145 (class 2604 OID 203654)
-- Name: Zawodnik1 id_zawodnika; Type: DEFAULT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Zawodnik1" ALTER COLUMN id_zawodnika SET DEFAULT nextval('premier_league."Zawodnik1_id_zawodnika_seq"'::regclass);


--
-- TOC entry 3333 (class 0 OID 203533)
-- Dependencies: 241
-- Data for Name: Klub; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Klub" (id_klubu, nazwa_klubu, "liczba_zwycięstw", libcza_remisow, liczba_porazek, liczba_meczow, strzelone_bramki, stracone_bramki, bilans_bramek, liczba_punktow) FROM stdin;
1	Liverpool	24	12	11	38	43	77	-84	32
2	Man City	26	25	33	38	81	68	-83	82
3	Leicester	32	27	33	38	70	84	-97	56
4	Chelsea	31	19	13	38	74	19	-95	60
5	Man Utd	37	5	12	38	40	80	-72	74
6	Sheff Utd	34	7	7	38	89	50	28	58
7	Wolves	6	8	24	38	15	93	-99	40
8	Tottenham	7	23	3	38	95	77	-12	67
9	Crystal	33	36	32	38	96	45	90	17
10	Arsenal	27	13	20	38	96	98	91	83
11	Everton	25	17	17	38	12	24	6	83
12	Southampton	7	18	7	38	27	57	-71	14
13	Newcastle	13	25	37	38	27	53	98	10
14	Brighton	37	5	16	38	46	18	74	46
15	Burnley	31	36	6	38	18	53	30	86
16	West Ham	36	15	25	38	28	33	-43	89
17	Watford	36	32	28	38	81	19	-23	108
18	Aston V	19	27	32	38	61	5	-31	30
19	Bournemouth	25	28	20	38	16	86	-90	89
20	Norwich	19	30	33	38	33	65	-68	99
\.


--
-- TOC entry 3346 (class 0 OID 203617)
-- Dependencies: 254
-- Data for Name: Komentarze; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Komentarze" (id_komentarza, id_meczu, username, komentarz, data) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 203568)
-- Dependencies: 246
-- Data for Name: Mecz; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Mecz" (id_meczu, id_gospodarza, id_goscia, stadion_id_stadionu, sedzia_id_sedziego, sedzia_glowny, sedzia_liniowy1, sedzia_liniowy2, nr_kolejki, gole_gospodarzy, gole_gosci, widownia, data_spotkania) FROM stdin;
1	12	13	13	67	54	47	43	22	8	2	20385	\N
2	6	3	20	99	85	23	77	12	2	3	24847	\N
3	17	8	19	51	24	90	77	24	7	1	93426	\N
4	10	1	19	22	54	90	50	6	8	3	74379	\N
5	13	2	14	50	25	2	67	9	4	10	58389	\N
6	19	10	16	36	29	2	95	38	5	8	85786	\N
7	6	5	1	72	46	81	95	38	6	3	69196	\N
8	6	4	9	98	46	81	95	19	6	5	78078	\N
9	13	14	18	24	1	81	6	24	9	3	78112	\N
10	7	3	10	1	43	92	90	5	7	9	27213	\N
11	2	1	17	83	27	92	90	8	10	1	38756	\N
12	20	1	18	93	22	92	90	21	3	4	90480	\N
13	15	8	17	3	71	14	41	22	7	3	23881	\N
14	11	12	12	91	27	14	5	11	9	1	62329	\N
15	12	13	7	75	93	35	8	24	10	4	17591	\N
16	19	20	10	42	8	16	41	3	4	2	40249	\N
17	17	19	9	97	82	16	39	10	5	5	72973	\N
18	13	7	15	99	8	27	39	21	2	10	43711	\N
19	11	12	14	34	72	27	39	27	8	1	62590	\N
20	3	11	12	79	62	27	85	24	7	7	57108	\N
21	6	8	15	71	28	28	85	34	9	9	27499	\N
22	14	13	6	40	41	28	6	32	5	4	28010	\N
23	3	11	4	38	78	59	6	35	5	4	15503	\N
24	15	16	14	50	55	58	95	2	6	10	32626	\N
25	10	7	16	88	7	58	95	10	8	7	15573	\N
26	6	17	1	30	41	77	95	14	6	6	39415	\N
27	18	6	16	52	11	77	17	38	9	8	78574	\N
28	8	9	7	24	52	77	17	22	2	3	29293	\N
29	12	13	5	28	88	66	47	34	9	5	48545	\N
30	14	7	16	90	97	48	47	31	10	0	43085	\N
31	19	7	18	37	39	48	40	23	5	4	99419	\N
32	10	17	5	31	72	9	40	22	1	8	45426	\N
33	9	7	12	8	83	9	40	8	7	0	45871	\N
34	8	14	13	37	8	48	56	12	0	4	28752	\N
35	16	17	20	66	1	48	56	23	1	3	28709	\N
36	12	15	1	20	78	98	33	29	9	1	68112	\N
37	19	2	15	3	49	98	33	7	0	4	58362	\N
38	9	1	18	42	77	47	29	34	10	5	60918	\N
39	8	6	8	28	21	47	29	38	2	9	70723	\N
40	13	12	19	88	27	47	29	19	3	3	58430	\N
41	17	13	2	47	59	3	6	17	5	7	68390	\N
42	13	3	3	9	20	3	6	15	3	10	55469	\N
43	12	12	5	29	27	3	50	35	1	8	15203	\N
44	20	14	13	45	31	60	50	27	3	6	48122	\N
45	11	14	20	5	24	60	56	21	3	6	23699	\N
46	6	11	1	97	16	60	56	36	6	9	91045	\N
47	6	6	16	32	4	14	67	18	2	5	28304	\N
48	4	16	2	81	49	14	67	20	0	6	19025	\N
49	13	5	20	16	75	88	67	1	5	7	94660	\N
50	1	10	14	48	77	88	57	25	8	4	62934	\N
51	5	8	19	47	14	88	57	11	2	0	27049	\N
52	12	4	14	98	75	95	57	36	6	3	44145	\N
53	16	6	3	70	100	18	12	10	6	10	79023	\N
54	11	7	17	87	48	90	12	23	8	10	81334	\N
55	14	2	3	1	31	90	22	15	9	8	36408	\N
56	11	18	17	66	77	90	22	17	9	1	49104	\N
57	12	14	4	94	1	87	22	37	4	0	10114	\N
58	7	2	11	82	71	87	97	16	4	5	93865	\N
59	14	4	9	73	23	81	97	33	0	2	96356	\N
60	17	6	19	86	2	81	97	31	6	3	10191	\N
61	9	19	1	71	70	71	62	18	6	7	34881	\N
62	18	4	10	66	78	71	62	35	2	9	82052	\N
63	17	3	2	88	48	93	20	33	2	2	15365	\N
64	16	1	8	3	75	76	20	8	7	6	17770	\N
65	14	18	9	64	16	66	42	5	6	2	90475	\N
66	20	4	7	26	34	66	42	3	10	9	31516	\N
67	6	15	6	77	38	83	27	34	10	5	23051	\N
68	11	19	9	49	20	83	27	8	9	8	93725	\N
69	6	11	18	94	53	95	27	30	9	7	56710	\N
70	19	9	6	19	57	18	65	3	0	9	23214	\N
71	19	17	20	80	74	18	65	18	1	5	98006	\N
72	5	20	13	84	14	18	65	38	9	5	40600	\N
73	9	16	20	36	57	57	21	19	7	10	87719	\N
74	8	15	17	30	60	57	35	28	0	7	54787	\N
75	13	1	1	53	16	57	73	8	3	9	96618	\N
76	6	18	9	43	9	97	73	11	2	3	32072	\N
77	11	14	6	93	48	82	14	30	9	1	84868	\N
78	12	6	20	45	60	79	14	31	6	8	25430	\N
79	9	19	8	100	37	79	14	1	2	4	31728	\N
80	20	2	19	1	98	79	14	16	5	9	28674	\N
81	20	6	19	91	14	64	41	4	4	6	92410	\N
82	20	2	18	40	74	64	41	7	0	4	35611	\N
83	4	18	4	83	22	69	41	10	10	1	22841	\N
84	5	13	18	1	20	69	35	4	10	10	87156	\N
85	11	11	6	34	76	69	35	38	10	7	39985	\N
86	8	12	12	55	31	71	41	19	10	10	14144	\N
87	13	16	20	75	13	71	41	20	7	5	29183	\N
88	15	19	15	16	45	71	44	4	8	1	13154	\N
89	12	20	11	13	16	23	44	21	9	2	93794	\N
91	4	12	5	95	87	23	44	28	8	10	77528	\N
92	19	9	6	81	88	23	31	15	5	10	25243	\N
93	13	19	14	84	85	39	31	24	6	10	93247	\N
94	10	4	11	52	42	100	31	1	2	0	21795	\N
95	15	12	12	89	58	100	70	38	6	9	43404	\N
96	8	13	13	79	90	100	41	17	0	5	93120	\N
97	17	5	5	45	15	69	93	15	0	9	68544	\N
98	12	10	2	66	78	69	93	15	1	8	35738	\N
99	4	16	10	20	72	4	93	19	7	1	28842	\N
100	2	19	8	56	9	4	47	7	9	3	74579	\N
101	11	8	12	5	18	4	47	27	8	5	52436	\N
\.


--
-- TOC entry 3340 (class 0 OID 203589)
-- Dependencies: 248
-- Data for Name: Sedziowie; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Sedziowie" (id_sedziego, imie, nazwisko, rodzaj_sedziego) FROM stdin;
1	Tom	Patricelli	Asystent VAR
2	Miriam	Turk	Sędzia liniowy 2
3	Charlotte	Sharp	Sędzia liniowy 2
4	Camille	Stockton	Sędzia liniowy 1
5	Jack	Riegel	Asystent VAR
6	Erin	Bitmacs	Asystent VAR
7	Cameron	van het Hof	Asystent VAR
8	Viktor	Long	Asystent VAR
9	Willy	Nefos	Sędzia liniowy 1
10	Maaike	Bertelson	Sędzia liniowy 2
11	Cristian	Newman	Sędzia liniowy 2
12	Rick	Robertson	Asystent VAR
13	Lincoln	Wood	Sędzia liniowy 2
14	Nicoline	Vostreys	Asystent VAR
15	Helma	Ecchevarri	Sędzia główny
16	Henk	Ward\t	Sędzia liniowy 1
17	Malgorzata	Gerschkow	Sędzia liniowy 2
18	Louise	Makelaar	Sędzia liniowy 1
19	Rolla	Aldritch	Sędzia liniowy 2
20	Dorothy	Herrin	Sędzia liniowy 1
21	Paula	Herring	Sędzia główny
22	Lucas	Harness	Sędzia liniowy 1
23	Jolanda	Forsberg	Sędzia główny
24	Will	Morton	Asystent VAR
25	Lia	Koch	Sędzia liniowy 2
26	Lucas	Imhoff	Sędzia liniowy 2
27	Lena	Mcgrew	Asystent VAR
28	Leah	Wood	Sędzia liniowy 1
29	Sjanie	Durso	Sędzia liniowy 2
30	Lucille	Zia	Sędzia główny
31	Leah	Nahay	Sędzia liniowy 2
32	Margaret	Alspaugh	Sędzia główny
33	Matthew	Davis	Asystent VAR
34	Stephen	Pearlman	Sędzia liniowy 1
35	GertJan	Newman	Sędzia liniowy 1
36	Marie	Brennan	Sędzia główny
37	Roger	Cooper	Sędzia liniowy 2
38	Caroline	Sanders	Sędzia liniowy 2
39	Juana	Freed	Asystent VAR
40	Stanislaw	Vanderoever	Sędzia główny
41	Pablo	Sanders	Sędzia liniowy 2
42	Marco	Durso	Sędzia liniowy 1
43	Sergio	Kepler	Asystent VAR
44	Tobias	Mayberry	Sędzia główny
45	Susan	Pyland	Sędzia główny
46	Isabelle	Mcnally	Asystent VAR
47	Katie	Anderson	Sędzia główny
48	Saskia	Chwatal	Asystent VAR
49	Kaylee	Evans	Sędzia liniowy 1
50	Jo	Blount	Sędzia liniowy 2
51	Joshua	Dean	Sędzia liniowy 1
52	Cian	Schubert	Sędzia główny
53	Edwina	Kellock	Sędzia liniowy 1
54	Catherine	Francis	Sędzia liniowy 2
55	Coby	van het Hof	Sędzia liniowy 2
56	Martin	Beckbau	Asystent VAR
57	Daan	Langham\t	Sędzia główny
58	Cloe	Roger	Sędzia liniowy 1
59	Margo	Ecchevarri	Sędzia liniowy 1
60	Julia	Zimmerman	Sędzia liniowy 2
61	Isabelle	Jones	Asystent VAR
62	Steve	Beckbau	Sędzia główny
63	JanCees	van Doorn	Sędzia główny
64	Sylvia	Thompson	Sędzia liniowy 1
65	Cameron	McCrary	Sędzia liniowy 2
66	Leon	Chapman	Sędzia liniowy 1
67	Lincoln	Lejarette	Asystent VAR
68	Kayleigh	Chwatal	Asystent VAR
69	Patricia	Moore	Sędzia liniowy 2
70	Sjon	Davis	Sędzia główny
71	Johnny	Stewart	Sędzia główny
72	Femke	Nefos	Asystent VAR
73	Willy	Patricelli	Sędzia liniowy 1
74	Gert	Stevens	Sędzia liniowy 2
75	Dick	Uitergeest	Sędzia liniowy 1
76	Mike	Hendrix	Sędzia główny
77	Sherman	Nahay	Sędzia liniowy 1
78	Joe	Naley	Sędzia liniowy 2
79	Mary	Imhoff	Sędzia liniowy 1
80	Adrian	Chwatal	Asystent VAR
81	Marieke	Tudisco	Sędzia główny
82	Lucia	Wesolowski	Sędzia liniowy 1
83	Kaylee	Dulisse	Sędzia główny
84	Jim	Pensec	Sędzia liniowy 1
85	Catharine	Voigt	Sędzia główny
86	Ronald	van Goes	Sędzia liniowy 1
87	Lucas	Stockton	Sędzia główny
88	Maaike	Moore	Sędzia liniowy 2
89	Marco	Wilson	Asystent VAR
90	Godfrey	Freeman	Sędzia główny
91	Margaret	King	Sędzia liniowy 2
92	Sophie	Muench	Sędzia główny
93	Jozef	Hendrix	Sędzia liniowy 2
94	Jack	Muench	Sędzia główny
95	Matt	Martin	Sędzia liniowy 1
96	Mads	Pyland	Sędzia liniowy 2
97	Erin	Cappello	Sędzia liniowy 1
98	Samantha	Jackson	Sędzia liniowy 2
99	Luke	Ionescu	Sędzia liniowy 2
100	Ton	Waddell	Sędzia liniowy 1
\.


--
-- TOC entry 3342 (class 0 OID 203597)
-- Dependencies: 250
-- Data for Name: Stadion; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Stadion" (id_stadionu, nazwa_stadionu, pojemnosc) FROM stdin;
1	Goodison Park 	92678
2	London Stadium 	91665
3	Emirates Stadium	30238
4	Stadium Turf Moor 	33929
5	King Power Stadium 	52737
6	Anfield	40462
7	Molineux Stadium 	87749
8	Park St James’ 	30174
9	Lane Carrow	65343
10	Park St Mary’s Stadium 	67363
11	Bramall	28422
12	Villa Park	71970
13	Etihad Stadium	44685
14	Vicarage Road 	69234
15	Tottenham Hotspur 	82093
16	Stamford Bridge 	65671
17	Old Trafford 	33217
18	Selhurst 	50913
19	Road Dean	33630
20	Falmer Stadium 	35477
\.


--
-- TOC entry 3335 (class 0 OID 203549)
-- Dependencies: 243
-- Data for Name: Trener; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Trener" (id_trenera, id_klubu, imie, nazwisko, data_urodzenia, dlugosc_kontraktu, pensja) FROM stdin;
1	10	Mikel	Arteta	1970-03-11	4	20020
2	18	Dean	Smith	1969-02-13	2	200000
3	11	Carlo	Ancelotti	1966-05-05	1	200000
4	19	Eddie	Howe	1977-11-12	3	200000
5	15	Sean	Dyche	1974-07-05	4	3970030
6	14	Graham	Potter	1983-09-23	5	5974043
7	4	Frank	Lampard	1985-02-27	2	1424538
8	9	Roy	Hodgson	1988-08-04	3	5277652
9	3	Brendan	Rodgers	1990-05-21	3	8629227
10	1	Jorgen	Klopp	1971-07-13	3	3603755
11	2	Pep	Guardiola	1976-11-01	1	4742617
12	13	Steve	Bruce	1977-06-01	4	633554
13	20	Daniel	Farke 	1996-08-13	4	3404887
14	6	Chris	Wilder 	1997-04-22	1	9217909
15	12	Ralph 	Hasenhuttl	1965-10-01	2	3721312
16	17	Nigel	Pearson	1971-07-13	2	8790676
17	8	Jose	Mourinho	1991-05-08	2	2221327
18	16	David	Moyes	1966-04-13	3	960042
19	7	Nuno	Espirito Santo	1987-01-22	1	9958534
20	5	Ole	Gunnar Solsker	1971-07-13	4	4222625
\.


--
-- TOC entry 3336 (class 0 OID 203559)
-- Dependencies: 244
-- Data for Name: Wydarzenia_meczowe_gosci; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Wydarzenia_meczowe_gosci" (id_wydarzen_meczowych, id_meczu, id_zawodnika, id_gospodarza, id_goscia, liczba_minut, minuta_meczu, id_wydarzenia) FROM stdin;
\.


--
-- TOC entry 3350 (class 0 OID 203642)
-- Dependencies: 258
-- Data for Name: Wydarzenia_meczowe_gospodarzy; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Wydarzenia_meczowe_gospodarzy" (id_wydarzen_meczowych, id_meczu, id_zawodnika, id_gospodarza, id_goscia, liczba_minut, minuta_meczu, id_wydarzenia) FROM stdin;
\.


--
-- TOC entry 3344 (class 0 OID 203606)
-- Dependencies: 252
-- Data for Name: Wykluczeni_zawodnicy; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Wykluczeni_zawodnicy" (id_wyklucznych_zawodnikow, id_zawodnika, rodzaj_wykluczenia, id_klubu, dlugosc_wykluczenia) FROM stdin;
\.


--
-- TOC entry 3352 (class 0 OID 203651)
-- Dependencies: 260
-- Data for Name: Zawodnik1; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Zawodnik1" (id_zawodnika, imie, nazwisko, pozycja, data_urodzenia, wzrost, pensja) FROM stdin;
1	Philippa	DeWilde	Bramkarz	1976-10-29	175	3110288
2	Jody	Stockton	Bramkarz	2013-10-22	178	\N
3	Cian	Cantere	Obrońca	1978-06-26	161	61508530
4	Christian	Duvall	Pomocnik	2007-08-16	178	5852260
5	Cameron	Miller	Pomocnik	1982-03-25	178	45703181
6	Samantha	Watson	Pomocnik	2004-09-15	194	59342816
7	Lea	Uitergeest	Bramkarz	1989-04-14	194	\N
8	Cecilie	Richter	Bramkarz	1993-03-02	166	53951425
9	Carolina	Visentini	Napastnik	2009-03-12	165	22471454
10	Marty	Trainor	Napastnik	2000-04-20	182	76093383
11	Tony	Pickering	Bramkarz	2009-02-09	199	\N
12	Lu	Huston	Pomocnik	1991-11-11	188	\N
13	Sjaak	Walker	Bramkarz	1984-12-02	194	52622262
14	Nate	Koch	Pomocnik	2011-01-21	186	47062903
15	Hannah	Suszantor	Obrońca	2006-04-29	177	93383512
16	Conor	Chwatal	Napastnik	2017-01-08	184	79422638
17	Anton	Queen	Bramkarz	1998-04-17	184	33317226
18	Gill	Griffith	Napastnik	2010-12-22	172	47123665
19	Scotty	Reames	Bramkarz	1999-11-07	175	90663872
20	Babette	Shapiro	Bramkarz	2014-09-11	169	46230634
21	Jurre	Naley	Napastnik	1999-11-23	196	53179644
22	Syd	Angarano	Napastnik	1983-10-01	190	\N
23	Adam	Storrs	Obrońca	1990-09-11	181	97911366
24	Iris	Chapman	Napastnik	1978-06-28	180	18156240
25	Richard	Duvall	Obrońca	1987-04-24	196	40262886
26	Pedro	Hulshof	Obrońca	1993-06-26	162	\N
27	Erin	Chwatal	Obrońca	1995-10-19	199	51650635
28	Lea	Visentini	Pomocnik	2011-11-19	177	22923137
29	Catharine	Symms	Bramkarz	1994-05-31	166	50374528
30	Sofia	Bright	Napastnik	2001-10-20	174	22339786
31	Anthony	Ionescu	Bramkarz	1994-05-11	178	27272410
32	Sherm	Stannard	Bramkarz	1997-07-04	169	\N
33	Maggie	Toler	Obrońca	1987-04-22	189	\N
34	Leah	Moreau	Napastnik	2014-05-01	194	\N
35	Daan	Framus	Bramkarz	1976-07-07	171	\N
36	Talitha	Brylle	Pomocnik	1984-05-26	168	56965300
37	Lena	Langham\t	Pomocnik	1991-03-27	182	99218926
38	Carolina	Kuehn	Napastnik	1999-05-12	176	95309969
39	Edward	Suszantor	Napastnik	1976-12-15	167	55984039
40	Jules	Hoyt	Obrońca	1975-09-25	173	\N
41	Eleanor	Lamere	Bramkarz	2019-04-17	170	80474182
42	Babette	Lee	Bramkarz	1989-08-12	163	66942210
43	Leonie	Francis	Bramkarz	1986-02-16	161	\N
44	Dylan	Gerschkow	Pomocnik	2003-08-28	183	94078810
45	Maria	Jenssen	Napastnik	2007-03-02	173	\N
46	Julia	Schmidt	Bramkarz	2006-11-17	166	94348402
47	Siem	Cross	Pomocnik	1979-08-06	191	85042139
48	Cecilie	DeBuck	Pomocnik	1992-08-28	189	74454797
49	Barbara	Long	Bramkarz	2002-11-15	168	\N
50	Samuel	Arnold	Bramkarz	1989-01-22	195	3841829
51	Freja	Ionescu	Pomocnik	1977-05-27	183	\N
52	Jack	Baltec	Bramkarz	1984-07-16	178	94082923
53	Krystyna	Lee	Pomocnik	1998-09-02	181	2114918
54	Isabel	Gerschkow	Obrońca	2015-12-11	194	3229986
55	Mario	Wood	Obrońca	1995-02-04	192	57647176
56	Charlie	Langham\t	Obrońca	1977-10-18	187	84998040
57	Nick	Millis	Napastnik	1976-04-16	191	21207283
58	Barbara	Rauch	Obrońca	2013-06-17	169	35770650
59	Charlie	Walker	Napastnik	1985-07-19	181	78586461
60	Martina	Linhart	Obrońca	2005-03-19	166	15859654
61	Madison	Maribarski	Bramkarz	2000-01-05	168	4518458
62	Ewa	Huston	Napastnik	1982-10-28	162	\N
63	Sjaak	Ecchevarri	Obrońca	1985-01-21	191	98821239
64	Maja	Boyer	Bramkarz	1988-03-12	162	20045155
65	Amber	Daniel	Obrońca	2013-03-18	168	\N
66	Maaike	Pickering	Bramkarz	1975-03-14	200	5142964
67	Kayleigh	Byrnes	Pomocnik	2017-09-30	163	87844513
68	John	Ahlgren	Pomocnik	1981-10-14	194	4753707
69	Luca	Little	Bramkarz	1978-02-18	180	\N
70	Rasmus	Nefos	Obrońca	2013-08-05	173	87832473
71	Alejandro	Knight	Pomocnik	2006-04-03	196	\N
72	Leo	Manson	Bramkarz	1976-09-09	188	44699749
73	Helen	Menovosa	Napastnik	1983-01-05	199	51184351
74	Maggie	Little	Pomocnik	1979-10-24	175	\N
75	Nathan	Watson	Obrońca	2015-11-30	200	39418449
76	Anthony	McCrary	Napastnik	2015-08-15	172	60534842
77	Tyler	Orcutt	Bramkarz	1976-07-11	177	20151804
78	Christopher	Manson	Bramkarz	2001-10-15	189	36903563
79	Karen	Chapman	Bramkarz	2013-11-12	183	40825896
80	Sem	Hoogbandt	Pomocnik	1983-01-22	190	98934125
81	Lucia	Oyler	Bramkarz	1999-07-18	191	\N
82	Claudia	Thompson	Bramkarz	1984-01-06	160	\N
83	Rosa	Brylle	Obrońca	1978-11-16	196	94900399
84	Henk	Lee	Bramkarz	1991-01-01	168	17836135
85	Sherman	Kuehn	Obrońca	1978-04-14	171	19434354
86	Lotte	Mairy	Bramkarz	2016-07-01	183	\N
87	Elena	Brumley	Bramkarz	2019-04-15	197	61625499
88	Ivan	White	Obrońca	1991-07-12	189	\N
89	Katarzyna	Keller	Napastnik	1989-04-30	186	60857079
90	Lauren	Cantere	Napastnik	2013-01-12	163	43616348
91	Martin	Kingslan	Napastnik	1979-11-16	171	\N
92	Chuck	Green	Napastnik	1976-04-16	183	22232164
93	Paul	McCrary	Napastnik	2011-04-29	178	20616226
94	Andrew	Baltec	Pomocnik	1995-11-23	189	\N
95	Joop	Lejarette	Obrońca	1995-03-05	171	\N
96	Michel	Grote	Napastnik	1994-03-10	167	78403025
97	Charlotte	van Dijk	Bramkarz	1987-10-31	190	99932327
98	Guus	Hoyt	Bramkarz	1989-11-05	175	48929660
99	Leo	Conley	Obrońca	2009-08-22	198	7545121
100	Jeanne	Toler	Napastnik	1992-07-02	181	44330038
101	Babet	Hendrix	Obrońca	2001-12-04	197	3227775
102	Izzy	Lee	Napastnik	2011-03-07	177	84052554
103	Lewis	Cooper	Napastnik	2012-02-17	161	\N
104	Gillian	Visentini	Napastnik	2008-12-27	179	10284544
105	Ciska	Bright	Obrońca	1991-06-05	199	93434564
106	Mart	Guyer	Obrońca	2013-09-11	189	56386748
107	Ruth	Johnson	Napastnik	2004-07-08	180	\N
108	Sue	Cohen	Bramkarz	2004-11-15	160	\N
109	Ada	Raines	Pomocnik	1981-04-24	194	\N
110	Truus	Archer	Bramkarz	1979-08-31	178	29493541
111	Lotte	Turk	Obrońca	1991-11-01	160	36758820
112	Jeanne	Ladaille	Bramkarz	2000-04-02	189	35649147
113	Cath	DelRosso	Napastnik	2018-11-16	199	84501582
114	Edwyn	Morton	Pomocnik	2018-05-22	179	2137454
115	Kimmy	Millikin	Napastnik	1979-11-28	198	52801433
116	Liza	Hollman	Pomocnik	1999-11-03	191	93746745
117	Rogier	Brown	Napastnik	2007-05-04	171	82180253
118	Sjef	Mairy	Bramkarz	1983-02-21	175	27778662
119	Amy	Morton	Pomocnik	2000-03-15	165	56403858
120	Jolanda	King	Napastnik	2015-12-23	194	31934857
121	Patty	Archer	Pomocnik	2004-02-26	168	67267322
122	Suzanne	Zimmerman	Pomocnik	2008-01-02	168	45587478
123	Scotty	Patricelli	Pomocnik	2017-07-09	191	47930361
124	Marcin	Lannigham	Obrońca	2019-01-03	186	\N
125	Amy	Bright	Pomocnik	2007-10-20	188	96759268
126	Anna	DeWilde	Bramkarz	2006-06-07	183	4008794
127	Peter	Barnett	Napastnik	1984-01-28	175	32797066
128	Nigel	van het Hof	Obrońca	1995-06-30	171	\N
129	Malgorzata	Mcnally	Pomocnik	1987-02-20	193	56015536
130	Ashley	Crocetti	Pomocnik	1991-01-25	161	\N
131	Maximilian	DelRosso	Napastnik	2008-09-12	182	90964510
132	Oscar	Young	Napastnik	1975-12-06	189	37962426
133	Lucas	Turk	Napastnik	2011-09-10	175	76008351
134	Michael	Krutkov	Obrońca	2014-06-23	185	45829659
135	Jose	Wood	Napastnik	1994-03-19	175	28292454
136	Leon	Jones	Napastnik	1999-12-07	193	38152710
137	Daan	Weaver	Bramkarz	1983-10-01	183	49511851
138	Jesse	Hulshof	Napastnik	2014-11-13	168	\N
139	Marek	Plantz	Pomocnik	1985-01-22	192	91989450
140	Amy	Moore	Napastnik	1995-02-28	175	46687479
141	Joe	Buchholz	Napastnik	1977-03-01	194	\N
142	Laura	Moore	Bramkarz	1996-07-23	183	4335083
143	Co	Oyler	Obrońca	2002-12-27	160	54855349
144	Johnny	Climent	Napastnik	2018-06-05	161	43430598
145	John	Chwatal	Bramkarz	1985-11-17	195	8864179
146	Jeanne	Schmidt	Obrońca	1986-06-26	185	98436240
147	Jessica	Stannard	Obrońca	1978-05-24	180	75816112
148	Zoe	Arnold	Napastnik	1998-03-15	192	19707355
149	Marieke	Suszantor	Bramkarz	1997-03-30	160	70531404
150	Javier	Thompson	Obrońca	1998-11-04	180	54128470
151	Klara	DeWald	Napastnik	1993-03-24	161	\N
152	Katie	Stockton	Pomocnik	2010-09-12	195	\N
153	Sherman	Griffith	Obrońca	2010-01-13	163	94167575
154	Cees	Brendjens	Bramkarz	1981-03-23	183	78031872
155	Maggie	Arnold	Napastnik	1986-04-08	187	65280415
156	Rachel	Glanswol	Napastnik	1989-11-20	195	63635038
157	Lucas	Mcgrew	Bramkarz	1991-04-04	166	25535938
158	Lucille	Van Dinter	Obrońca	2003-03-25	180	9179136
159	Harold	Martin	Napastnik	2002-12-09	183	43316215
160	Edwyn	Mulders	Bramkarz	2003-04-25	186	\N
161	Maja	Brady	Pomocnik	1996-05-04	195	46226011
162	Sally	Zapetis	Napastnik	2017-06-09	196	64582963
163	Niklas	Wood	Obrońca	2018-07-10	161	\N
164	Teun	Francis	Bramkarz	1998-10-18	173	\N
165	Truus	Morton	Obrońca	1995-07-02	177	11146664
166	Sherm	Willis	Obrońca	1980-08-27	164	96613814
167	Jorge	Herring	Pomocnik	2005-12-29	191	50640043
168	Anthony	Ditmanen	Bramkarz	1993-06-24	188	82898081
169	Jeanette	Robbins	Napastnik	1985-07-02	171	\N
170	Victor	Walker	Pomocnik	1994-04-29	198	15253929
171	Steph	Polti	Pomocnik	1976-08-24	173	7898453
172	Helma	Koss	Pomocnik	2005-01-16	176	\N
173	Marek	Millikin	Pomocnik	2011-04-10	178	63685840
174	Philippa	Stockton	Pomocnik	1983-06-09	184	12248494
175	Liam	Hedgecock	Bramkarz	2018-12-21	163	30257888
176	Teun	Linhart	Bramkarz	2015-01-31	182	\N
177	Juan	Naff	Pomocnik	1998-04-10	187	\N
178	Jonas	Watson	Pomocnik	1982-02-17	197	79485515
179	Jeanette	Mitchell	Obrońca	2000-09-14	186	99300316
180	Tomas	Linton	Bramkarz	1995-01-06	179	88392212
181	Sylvia	Morgan	Bramkarz	1995-11-22	192	11012409
182	Nate	Kingslan	Obrońca	1978-01-27	180	67315034
183	Stephanie	Leonarda	Pomocnik	2013-10-23	193	64746194
184	Will	Ayers	Obrońca	1984-04-06	163	78748085
185	Mick	Slocum	Napastnik	1981-12-14	199	\N
186	Martin	Boyer	Bramkarz	1994-06-21	169	17862200
187	Suzanne	Griffith	Napastnik	2018-09-26	173	\N
188	Paula	Gunter	Pomocnik	2000-05-23	197	18898664
189	Taylor	Stockton	Pomocnik	2004-05-16	194	71092004
190	Tomasz	Trainor	Pomocnik	1989-03-26	187	\N
191	Jeffery	Cain	Napastnik	2008-01-11	184	\N
192	Elzbieta	Raines	Pomocnik	1989-12-10	193	52241589
193	Ed	Marra	Bramkarz	2019-12-05	180	5711087
194	Kay	Riegel	Obrońca	2007-09-29	180	73920710
195	JanCees	Depew	Obrońca	1975-08-14	163	5353648
196	Rick	van Doorn	Pomocnik	2009-12-18	175	2751499
197	Andy	Queen	Napastnik	1990-01-13	183	16007441
198	Niklas	White	Pomocnik	2007-02-21	175	48544197
199	Sergio	Long	Obrońca	1987-03-19	183	67227215
200	Joe	Menovosa	Napastnik	1986-03-04	176	46084228
201	Hannah	Harness	Bramkarz	2011-03-12	174	19003792
202	GertJan	Ratliff	Bramkarz	1990-02-06	163	56820446
203	Sjaak	Botsik	Pomocnik	1990-12-25	171	\N
204	Talita	Zimmerman	Obrońca	2003-11-05	171	12001290
205	Samuel	Ostanik	Obrońca	1982-02-08	196	76181797
206	Elzbieta	Ray	Obrońca	1997-03-28	172	\N
207	Edwin	Moore	Bramkarz	1988-12-10	183	\N
208	Camila	Matthew	Pomocnik	2011-03-13	164	\N
209	Simon	Perilloux	Pomocnik	1993-01-12	182	\N
210	Ed	Donatelli	Obrońca	2010-02-06	178	24194871
211	Kayleigh	Noteboom	Obrońca	1986-05-02	175	52822996
212	Nicholas	Moon	Pomocnik	2004-12-27	173	8638542
213	Leonie	Dittrich	Napastnik	2001-06-14	175	18580602
2532	Ike	Julieze	Pomocnik	2008-12-28	184	\N
214	Gabrielle	McCrary	Bramkarz	1994-07-25	179	99501856
215	Freja	Stannard	Pomocnik	1984-02-29	160	74467846
216	Lauren	Howe	Obrońca	1981-04-04	179	11882816
217	Cian	Nahay	Bramkarz	2018-09-20	193	51404575
218	Chloe	Chwatal	Bramkarz	1998-07-29	199	\N
219	Peg	Simonent	Obrońca	1996-08-29	187	50829816
220	Bram	Manson	Pomocnik	2005-06-14	179	442625
221	Dorothy	Moreau	Napastnik	2005-08-11	181	16145658
222	David	Stevenson	Obrońca	1999-08-20	161	45060306
223	Patricia	Weaver	Napastnik	1991-01-14	161	70061409
224	Linnea	Gonzalez	Bramkarz	1988-06-24	195	52184878
225	Thomas	Mejia	Pomocnik	1987-10-12	163	46854833
226	Milan	Davis	Napastnik	2013-06-13	175	71724803
227	Madison	Meterson	Napastnik	2013-02-19	167	42191483
228	Marek	Ward\t	Pomocnik	1979-09-08	199	87419156
229	Ciara	Roche	Pomocnik	1983-07-30	161	27968396
230	Oliver	Hollman	Obrońca	1975-11-28	193	4572208
231	Adrian	Robbins	Napastnik	1977-02-06	187	86633221
232	Saskia	Schlee	Bramkarz	2002-01-04	192	31830186
233	Mariska	Cramer	Napastnik	2001-07-19	162	30355796
234	Rachel	Mitchell	Pomocnik	2013-09-26	196	42610548
235	Sigrid	Uitergeest	Napastnik	2002-01-14	195	51471978
236	Pawel	Green	Pomocnik	2003-12-30	166	31147030
237	Tommy	Langham\t	Pomocnik	1994-04-01	177	58716978
238	Joop	van Doorn	Napastnik	1996-08-24	182	\N
239	Olivia	Herrin	Napastnik	2011-05-03	181	15277918
240	Christian	Uprovski	Napastnik	2011-05-04	187	\N
241	Joshua	DeWald	Bramkarz	2000-08-19	163	\N
242	Rosa	Francis	Pomocnik	2015-12-22	173	14870176
243	Marie	Thaler	Bramkarz	2011-10-04	171	49235841
244	Shermie	Uprovski	Napastnik	2018-03-22	195	\N
245	Hannah	Anderson	Napastnik	2003-07-05	177	7512576
246	Nicholas	Spensley	Napastnik	1982-12-12	177	3560938
247	Benjamin	Korkovski	Bramkarz	1987-08-11	182	83871384
248	Dave	Griffioen	Bramkarz	2002-12-13	183	33048407
249	Janet	Brumley	Pomocnik	1982-02-02	172	9572392
250	Theodore	Wilson	Napastnik	1993-05-23	191	\N
251	Sergio	Koss	Bramkarz	2015-09-19	160	67708604
252	Janet	Bugno	Obrońca	2007-11-18	199	30225235
253	Chloe	Dulisse	Napastnik	1982-10-02	168	2947556
254	Ciara	Jones	Pomocnik	2017-03-17	167	77422043
255	Edwina	Robertson	Pomocnik	2007-11-20	164	86886215
256	Ivan	Brown	Napastnik	1998-08-15	192	\N
257	Tomasz	Thompson	Obrońca	2016-07-29	168	58235580
258	Maria	Love	Napastnik	1995-05-24	191	79556821
259	Ben	Rauch	Obrońca	1998-05-26	164	39760074
260	Rik	Waddell	Obrońca	2001-01-31	162	91922150
261	Frederik	Climent	Pomocnik	2010-12-15	199	62540024
262	Susan	Browne	Bramkarz	1988-09-26	171	38779520
263	Ciara	Zimmerman	Pomocnik	2008-10-04	183	11730898
264	Leah	Wesolowski	Obrońca	2015-10-26	162	48421732
265	Mike	Davis	Napastnik	1993-06-11	180	\N
266	Charles	Blount	Bramkarz	2005-06-11	170	95352715
267	Luke	Caffray	Obrońca	1979-10-21	182	1136404
268	Julian	Thompson	Obrońca	2013-10-12	178	55119193
269	Vincent	Aldritch	Pomocnik	1988-10-05	168	\N
270	Kay	Ray	Bramkarz	1985-01-25	177	43143285
271	Hugo	Kingslan	Pomocnik	2005-11-13	178	41928743
272	Joseph	Schlee	Obrońca	1989-09-23	185	31970747
273	Kayleigh	Guethlein	Obrońca	1975-04-13	193	3559494
274	Ike	Royal	Obrońca	1993-07-02	174	33604585
275	Scotty	Lawton	Pomocnik	2009-09-18	168	\N
276	Alexis	White	Obrońca	2001-08-03	164	19353674
277	Suzanne	Pengilly	Bramkarz	1998-07-21	172	3781599
278	Matt	Morgan	Napastnik	2018-09-22	178	21678725
279	Elzbieta	Hendrix	Napastnik	2012-08-28	186	\N
280	Samuel	Visentini	Obrońca	1985-04-12	191	98569752
281	Caitlin	Cross	Napastnik	1984-12-17	181	85013517
282	Marta	Chwatal	Obrońca	2012-07-05	160	91916955
283	Thomas	Kingslan	Pomocnik	1983-06-22	197	37747351
284	Niklas	Olson	Napastnik	1989-12-26	161	79648564
285	Isak	Ray	Obrońca	1983-12-15	164	26817807
286	Tom	Crocetti	Bramkarz	1999-01-30	189	19246643
287	Ainhoa	Roche	Napastnik	2017-03-16	181	70025787
288	Jace	Mulders	Bramkarz	2007-02-26	168	22068394
289	Claudia	Beckbau	Napastnik	1999-11-28	162	62036981
290	Eleanor	Knight	Obrońca	2012-03-23	198	19586039
291	Andrew	Stevens	Pomocnik	2019-05-01	160	\N
292	Jill	Brisco	Napastnik	2008-04-17	179	79210479
293	Siem	Schmidt	Bramkarz	1979-03-12	191	\N
294	Kees	Lee	Napastnik	1976-10-20	188	16159996
295	Edward	Ionescu	Obrońca	2011-07-05	188	34912870
296	Gabrielle	van Dijk	Bramkarz	2005-09-20	178	23874432
297	Gert	Sharp	Napastnik	2010-01-17	194	\N
298	Edward	Stevens	Bramkarz	1997-09-10	191	\N
299	Maria	Ecchevarri	Pomocnik	2001-04-30	194	\N
300	Ashley	Ratliff	Obrońca	2009-10-23	199	50287562
301	Laura	Hamilton	Obrońca	1983-03-11	191	63045347
302	Pauline	Leonarda	Bramkarz	1994-10-05	188	80267093
303	Amber	Griffith	Napastnik	2018-04-10	199	91837291
304	Elena	Poplock	Napastnik	2007-05-12	188	39283685
305	Roger	Bright	Bramkarz	1988-09-26	169	35456984
306	Esther	van Dijk	Obrońca	1978-05-09	178	76371914
307	Shermie	Naley	Napastnik	2010-08-11	172	2383535
308	Pieter	Mairy	Napastnik	1980-03-27	164	45356626
309	Stanislaw	Leonarda	Obrońca	2012-11-08	173	99184259
310	Cecilie	Stockton	Napastnik	1991-09-06	199	91762902
311	Gabrielle	van der Laar	Obrońca	1991-07-01	168	65175693
312	PieterJan	Phillips	Obrońca	2012-02-07	192	85924032
313	Ross	Lannigham	Bramkarz	2017-12-20	193	32498038
314	Robert	Menovosa	Napastnik	2006-04-17	171	57161057
315	Diego	LeGrand	Obrońca	2016-12-03	172	78936393
316	Jaclyn	Daley	Bramkarz	2017-07-28	175	\N
317	Jorge	Overton	Obrońca	1992-05-17	173	86368192
318	Lucia	Matthew	Obrońca	1979-03-12	181	81623423
319	Herbert	Seibel	Obrońca	2006-07-08	194	84881893
320	Pedro	Marra	Napastnik	2004-01-21	200	10790222
321	Ester	Paul	Obrońca	1982-09-01	177	98528017
322	Geoffery	van Doorn	Bramkarz	1994-02-28	184	\N
323	Mart	Franklin	Bramkarz	1985-09-20	172	69086874
324	Zoe	Makelaar	Napastnik	2011-06-07	173	87225795
325	Matthijs	Thompson	Bramkarz	1978-02-05	177	82916414
326	Netty	Arden	Pomocnik	1986-08-21	188	97435151
327	Lucy	Praeger	Napastnik	1994-11-20	160	33749992
328	Helma	Brylle	Obrońca	2001-01-18	182	14041391
329	Piet	Ladaille	Napastnik	2011-01-19	176	73990573
330	Joshua	Mejia	Pomocnik	2005-03-22	169	62940388
331	Elizabeth	Gibson	Pomocnik	1996-01-07	195	\N
332	Rachel	Cramer	Pomocnik	1988-07-01	162	\N
333	Maaike	Martin	Bramkarz	2001-02-13	181	15864213
334	Tonnie	Poole	Obrońca	1997-08-05	181	28126398
335	Richard	Kuehn	Obrońca	1983-07-11	191	\N
336	Teddy	van het Hof	Pomocnik	2018-12-10	184	\N
337	Ricardo	Carlos	Bramkarz	2008-04-27	167	20779126
338	Albert	Langham\t	Bramkarz	2008-03-13	180	30079004
339	Peter	Wesolowski	Napastnik	1989-05-15	175	15407572
340	Lauren	Barbee	Bramkarz	2018-05-06	200	98726948
341	Izzy	Lezniak	Pomocnik	1985-06-18	172	39894957
342	Matthew	Linhart	Napastnik	2011-02-12	180	\N
343	Ross	Mayberry	Napastnik	1992-09-21	169	42330329
344	Maja	Poole	Pomocnik	1996-03-27	172	9243661
345	Lewis	Ray	Napastnik	1985-05-11	160	\N
346	Shermie	Ionescu	Pomocnik	2011-09-11	170	7433078
347	Sjanie	Nobles	Obrońca	1987-04-05	189	58698879
348	Sydney	Duvall	Napastnik	1997-12-09	189	20920121
349	Lincoln	Brown	Napastnik	1990-01-02	198	66251584
350	Rogier	Wesolowski	Bramkarz	2010-12-31	178	588987
351	Camila	Ecchevarri	Obrońca	1994-06-19	189	86229100
352	Tom	Thaler	Pomocnik	1993-01-02	184	93278215
353	Roger	Hendrix	Napastnik	1994-09-17	176	41564300
354	Niek	Orcutt	Obrońca	2010-03-25	182	67470825
355	George	Zimmerman	Bramkarz	1999-09-26	166	10353129
356	Sjaak	Visentini	Pomocnik	1988-02-08	175	61129036
357	Jacob	Griffioen	Obrońca	2015-06-14	166	32532650
358	Jaap	Crocetti	Bramkarz	1982-08-17	173	21580354
359	Maaike	Naley	Pomocnik	2003-08-01	193	53024193
360	Alice	Howe	Napastnik	2011-08-16	192	19909996
361	Sanne	Suszantor	Bramkarz	2009-11-20	160	\N
362	Erin	Paddock	Pomocnik	1992-01-25	175	25985102
363	Marty	Imhoff	Obrońca	2006-05-21	191	66719995
364	Viktor	Krutkov	Napastnik	2000-02-20	180	\N
365	Sjaak	Gonzalez	Napastnik	1980-06-16	196	29291102
366	Piet	Geoppo	Bramkarz	1984-05-28	169	41630566
367	Sigrid	Freed	Obrońca	1993-02-27	182	78882572
368	Herbert	Hollman	Pomocnik	2003-12-31	196	\N
369	Sylvia	Clarke	Napastnik	2018-04-16	186	\N
370	Alice	Crocetti	Obrońca	2019-03-31	198	\N
371	Lena	Hamilton	Pomocnik	1985-11-02	181	68328145
372	Tomas	Crocetti	Pomocnik	2004-04-13	191	96319221
373	Manuel	Dittrich	Pomocnik	2005-11-08	186	51313087
374	Georgina	Kellock	Obrońca	1976-07-12	172	\N
375	Steve	Bertelson	Pomocnik	1976-07-11	186	\N
376	Lincoln	Bruno	Obrońca	1978-02-11	185	36825734
377	Oscar	Orcutt	Obrońca	1996-12-21	172	65861960
378	Niek	Turk	Bramkarz	2009-05-02	193	\N
379	Henk	Lezniak	Napastnik	1977-03-30	193	\N
380	Chuck	Roger	Pomocnik	1999-08-31	180	41464462
381	Sherm	DeWald	Pomocnik	1982-04-29	182	79861706
382	Luke	Friedman	Napastnik	1995-11-12	191	95416704
383	Henry	Hulshof	Obrońca	2001-06-06	168	\N
384	Edwin	Brisco	Pomocnik	2016-01-23	190	91185377
385	Sigrid	Van Toorenbeek	Napastnik	2009-05-03	187	5530739
386	Leontien	Walker	Bramkarz	1977-02-03	194	94181981
387	Margarita	Miller	Bramkarz	1989-03-27	174	38815369
388	Siska	Gua Lima	Pomocnik	1984-03-05	180	\N
389	Luis	Jones	Bramkarz	1981-01-17	168	\N
390	Edwina	Baltec	Pomocnik	2009-01-01	198	26508003
391	Tom	Menovosa	Bramkarz	1993-05-15	188	\N
392	Kaylee	Chwatal	Napastnik	1995-07-15	162	35420679
393	Ruth	Stannard	Obrońca	2005-08-18	194	\N
394	Philippa	Schlee	Pomocnik	1979-09-29	169	30657779
395	Julian	Young	Pomocnik	2001-09-07	200	98767370
396	Margarita	Mayberry	Obrońca	1991-11-20	199	\N
397	Maggie	Trainor	Obrońca	1997-03-02	197	92589951
398	Eleanor	Hummel	Pomocnik	1993-02-12	160	52347633
399	Tobias	Brisco	Napastnik	1978-05-21	194	48212261
400	Sophia	Conley	Pomocnik	1997-03-08	178	34279585
401	Lea	Hancock	Pomocnik	1984-07-08	189	86390569
402	Samuel	Anderson	Bramkarz	2006-09-15	174	71888991
403	Nicoline	Prior	Pomocnik	1985-03-27	170	43572668
404	Nicolas	Paul	Napastnik	1985-12-26	192	93521590
405	Pauline	Sterrett	Pomocnik	2003-07-26	172	78129565
406	Luis	Arden	Obrońca	2005-07-05	200	97470116
407	Luca	Trainor	Obrońca	2013-10-24	171	73221635
408	Fabian	Chwatal	Napastnik	1991-10-22	183	48972747
409	Jeffery	Raines	Pomocnik	2009-07-17	195	27932401
410	Coby	Fox	Bramkarz	1986-02-19	185	37927172
411	Lars	Suszantor	Pomocnik	2001-07-17	196	8684445
412	Shermie	Guethlein	Obrońca	1977-04-30	185	62618109
413	Cees	Herrin	Obrońca	1994-11-14	196	66094762
414	Syd	Turk	Bramkarz	1999-09-14	165	88609024
415	Drew	Matthew	Bramkarz	1980-11-25	172	73424303
416	Maaike	Durso	Bramkarz	2014-04-12	162	55487690
417	Joshua	Ditmanen	Napastnik	2016-09-23	187	61166137
418	Hiram	Little	Obrońca	2011-04-30	164	90967497
419	Jules	Van Toorenbeek	Bramkarz	1978-12-10	200	20935963
420	Ricardo	Chwatal	Pomocnik	2002-10-24	190	29819690
421	Daan	Dittrich	Napastnik	1995-05-22	184	75415237
422	Jonas	Lezniak	Pomocnik	1978-08-06	160	44233396
423	Krystyna	Davis	Bramkarz	1990-07-08	188	80488407
424	Trevor	Kuehn	Napastnik	1995-11-21	169	75157891
425	Andrew	Lawton	Napastnik	1993-06-20	186	81249125
426	Hiram	Thompson	Obrońca	1977-11-23	179	11762637
427	Martina	Freed	Bramkarz	1975-05-08	173	10663397
428	Nathan	Stevenson	Napastnik	1994-10-03	194	10042614
429	Jeffery	Barnett	Bramkarz	1985-11-14	175	31707926
430	Matthijs	Queen	Bramkarz	1993-09-06	165	84786868
431	Ann	Cappello	Obrońca	1975-04-21	194	10986814
432	Theodore	Raines	Obrońca	1984-10-26	177	\N
433	Jeffery	Bugno	Napastnik	1984-08-31	171	73464871
434	Anne	Mulders	Bramkarz	2001-11-04	171	30730292
435	Joop	van der Laar	Napastnik	1998-08-13	191	69824682
436	Nicoline	Hedgecock	Bramkarz	2009-04-06	184	55739689
437	Marco	Harder	Napastnik	1975-02-17	165	98139537
438	Tommy	van Doorn	Napastnik	1992-06-18	162	49326423
439	Trevor	Anderson	Obrońca	1982-12-07	181	64157940
440	Janet	Van Toorenbeek	Bramkarz	1987-08-26	166	82446652
441	Viktor	Morton	Napastnik	1983-08-15	165	34421172
442	Rasmus	Raines	Napastnik	2003-06-08	175	\N
443	Manuel	Orcutt	Pomocnik	2018-12-16	177	38475118
444	Louise	Lezniak	Bramkarz	1975-10-22	174	\N
445	Lea	Helbush	Pomocnik	1993-05-11	189	24501978
446	Ricardo	van Goes	Bramkarz	1980-01-15	176	17689484
447	Maggie	Mairy	Obrońca	1988-11-14	193	\N
448	Lia	Wilson	Bramkarz	1984-03-04	178	36601925
449	Claudia	Hollman	Pomocnik	2010-05-12	197	33429716
450	Katie	Wooten	Bramkarz	2007-11-23	188	98512233
451	Ainhoa	Weinstein	Pomocnik	1990-12-16	196	73473366
452	Theo	Reyes	Bramkarz	2012-07-04	195	69164969
453	Teun	Robbins	Napastnik	2006-07-07	169	93588470
454	Truus	Prior	Obrońca	2001-01-03	167	97874350
455	Barbara	Morgan	Napastnik	1976-02-08	169	42995122
456	Cristina	Matthew	Napastnik	2016-08-29	183	97602991
457	Lewis	DeWilde	Pomocnik	1990-09-12	181	42455161
458	Geoff	Cain	Bramkarz	1983-12-04	167	67899673
459	Kees	Gua Lima	Obrońca	1983-06-05	192	6772645
460	Luca	Scheffold	Napastnik	2015-07-03	200	43874929
461	Lara	Buchholz	Pomocnik	1981-01-18	173	98893485
462	Leo	DeWald	Bramkarz	1985-09-13	194	\N
463	Kaylee	Gerschkow	Pomocnik	2016-11-02	191	54018959
464	Dick	Storrs	Obrońca	2019-06-04	191	9119985
465	Lena	Fernandez	Pomocnik	2009-09-04	171	\N
466	Alice	Cramer	Obrońca	1996-12-15	169	50764870
467	Elena	Arcadi	Pomocnik	2020-01-06	183	\N
468	Alfons	Jenssen	Napastnik	2005-08-24	190	74977050
469	Bo	Harness	Pomocnik	2018-11-02	172	75472648
470	Herman	Griffioen	Pomocnik	1992-07-07	166	\N
471	Sanne	Queen	Bramkarz	1977-10-09	166	92883664
472	Emil	Deleo	Napastnik	1988-07-06	175	15124152
473	Bess	Keller	Pomocnik	1989-07-24	190	32089981
474	Leah	Hollman	Napastnik	2005-07-09	168	78779788
475	GertJan	Rivers	Pomocnik	1997-02-27	180	\N
476	Ruth	Zimmerman	Napastnik	2016-08-12	172	26355602
477	Paul	Schmidt	Pomocnik	1999-09-21	185	20050599
478	Hanna	Glanswol	Obrońca	1986-05-21	170	\N
479	Bas	Trainor	Bramkarz	1986-12-14	184	93401035
480	Camille	Lejarette	Obrońca	2006-10-08	169	16308128
481	Gabbie	Hoogbandt	Obrońca	2012-08-17	173	20905836
482	Joshua	van Dijk	Pomocnik	1981-08-09	176	27583500
483	James	Sirabella	Bramkarz	2006-02-18	167	19500417
484	Zoe	Symms	Pomocnik	2013-06-15	177	68260783
485	Juan	Carlos	Bramkarz	1992-04-17	199	\N
486	Sigrid	Deans	Pomocnik	2016-01-12	161	\N
487	Marco	Clark	Pomocnik	1978-04-12	196	75959201
488	Samuel	Angarano	Bramkarz	2013-08-20	200	77913776
489	Teun	Katsekes	Obrońca	2018-09-19	200	50357474
490	Marcin	Cantere	Napastnik	1992-12-19	172	69055715
491	Sanne	van Dijk	Napastnik	1981-09-03	192	\N
492	Rich	Zurich	Bramkarz	1982-04-07	196	56016067
493	Mick	Ahlgren	Napastnik	1983-07-04	163	52464473
494	Pieter	Dulisse	Napastnik	2002-02-04	191	44914386
495	Raul	Jones	Bramkarz	2002-01-22	200	\N
496	Chuck	Turk	Napastnik	2019-08-31	170	22127147
497	Martin	Paddock	Pomocnik	2017-03-25	163	45549546
498	Lucas	Arcadi	Pomocnik	2018-07-12	192	\N
499	Matthijs	Muench	Bramkarz	1993-12-21	192	17162120
500	Talita	Ionescu	Bramkarz	2000-07-27	169	20269330
501	Ricky	Hoyt	Napastnik	2014-04-06	175	8216609
502	Catharine	Bugno	Obrońca	1978-05-03	187	\N
503	Andrew	Gonzalez	Pomocnik	2007-12-13	190	76658429
504	Katarzyna	Lawton	Bramkarz	1984-07-01	165	31080314
505	Thomas	Muench	Bramkarz	2017-08-23	179	\N
506	Mick	Brumley	Pomocnik	1997-05-19	174	74360911
507	Pedro	Wilson	Pomocnik	2015-04-14	177	\N
508	Michel	Turk	Pomocnik	2018-10-14	189	\N
509	Karin	Paul	Obrońca	2013-03-05	191	78245018
510	Geoff	Climent	Pomocnik	2018-11-05	194	25614186
511	Ed	Stevens	Bramkarz	2013-11-16	166	83733304
512	Freja	Robbins	Obrońca	1985-12-21	175	88579166
513	Nicholas	Koch	Napastnik	1975-07-06	193	44957583
514	Marco	Caffray	Pomocnik	1995-11-15	162	88081373
515	Liza	Harder	Pomocnik	2017-08-17	177	89894790
516	Philip	DeWald	Bramkarz	1981-11-11	195	39527350
517	Trevor	Gibson	Obrońca	2007-07-25	180	17452925
518	Ana	Depew	Pomocnik	2003-11-27	188	10230556
519	Samantha	White	Napastnik	1978-10-04	193	\N
520	Callum	Chapman	Obrońca	1990-03-25	191	68185403
521	Piet	Shapiro	Bramkarz	1996-09-26	187	\N
522	Alfons	Bright	Napastnik	2009-09-30	189	90695174
523	Fons	Williamson	Pomocnik	1981-01-17	169	\N
524	Cian	Robertson	Napastnik	2000-01-14	185	98444550
525	Ciara	Freed	Obrońca	2009-08-20	184	88777732
526	Niklas	Stewart	Pomocnik	2002-04-08	170	\N
527	Ron	Olson	Pomocnik	2001-07-31	177	40400608
528	Lu	Makelaar	Pomocnik	1997-04-21	199	\N
529	Philippa	Lannigham	Napastnik	1983-05-09	180	44668583
530	Sally	Liddle	Pomocnik	1996-12-12	198	81496237
531	Piotr	Voigt	Pomocnik	1975-01-05	178	45278053
532	Gerrit	LeGrand	Pomocnik	2014-06-26	199	4949680
533	Lukas	Kingslan	Napastnik	2018-09-25	170	21575287
534	Wilma	Poplock	Pomocnik	1978-12-01	195	14997294
535	Kaylee	Bryant	Napastnik	2018-09-09	174	\N
536	Ada	Katsekes	Bramkarz	2018-12-11	178	77165551
537	Lauren	Duvall	Pomocnik	1986-07-11	185	22448615
538	Lauren	Millikin	Bramkarz	1983-08-11	184	\N
539	Delphine	Brylle	Obrońca	1981-01-29	184	66652267
540	Zoe	Ward\t	Obrońca	2009-06-02	193	45078429
541	Carolina	Fernandez	Obrońca	2002-05-09	182	80505679
542	Peggy	Guyer	Obrońca	1997-11-23	200	\N
543	Carolina	Keller	Pomocnik	2011-01-14	170	99784029
544	Sherman	Toler	Bramkarz	1998-12-20	166	77349357
545	Jesse	Walker	Napastnik	1996-03-06	185	14745106
546	Martien	Stewart	Bramkarz	2007-12-15	165	49520097
547	Susan	Robertson	Pomocnik	1975-11-07	165	90093756
548	Madison	Nobles	Bramkarz	1984-04-10	185	\N
549	Jack	Imhoff	Napastnik	2018-02-07	199	4921313
550	Bo	Symbouras	Bramkarz	1990-05-27	182	10438875
551	Scotty	Griffioen	Bramkarz	1985-11-21	182	76031906
552	Susan	Carlos	Bramkarz	1981-11-10	188	79545360
553	Izzy	Jones	Bramkarz	2012-01-06	178	608310
554	Alfons	Brisco	Obrońca	1980-01-26	177	\N
555	Sammy	Wilson	Bramkarz	1983-12-08	191	\N
556	Malgorzata	Daley	Pomocnik	1997-06-05	175	3364526
557	Sean	Massingill	Napastnik	2003-09-23	161	30456757
558	Ron	Hancock	Bramkarz	1992-11-11	178	38143858
559	Syd	Cappello	Bramkarz	2011-09-03	184	26280807
560	Lizzy	Knight	Obrońca	2018-09-06	187	95133953
561	Nick	Noteboom	Bramkarz	2013-10-19	187	73428510
562	Ben	Noteboom	Obrońca	2014-03-29	166	50236334
563	John	Gildersleeve	Bramkarz	1991-05-06	197	46859272
564	Nathan	Visentini	Obrońca	1992-09-04	171	56038914
565	Lia	Antonucci	Pomocnik	1991-11-10	180	\N
566	Taylor	Hendrix	Bramkarz	1996-07-14	187	4186840
567	Mariska	Praeger	Obrońca	2012-08-03	192	\N
568	Miriam	Bernstein	Bramkarz	1983-02-12	189	81768140
569	Ike	Buchholz	Napastnik	1991-01-22	165	41259632
570	Dylan	Watson	Pomocnik	1996-06-14	182	55379427
571	Alejandro	Stannard	Pomocnik	1999-11-17	169	51405346
572	Laura	Jackson	Bramkarz	2004-04-10	164	27287093
573	Mikkel	Polti	Bramkarz	1998-07-10	194	79360914
574	Lucy	Phelps	Pomocnik	2015-09-24	172	40384528
575	Cristian	Symbouras	Bramkarz	2008-12-08	172	\N
576	Geoffery	Conley	Bramkarz	1995-10-30	193	77143279
577	Juan	Moore	Pomocnik	1984-10-13	165	5537373
578	Sharon	Koss	Pomocnik	1985-05-10	173	81928895
579	Victor	Helfrich	Bramkarz	2015-12-08	185	43914993
580	Lizzy	Clark	Bramkarz	1990-12-03	181	\N
581	Petra	Francis	Bramkarz	1983-12-13	164	\N
582	Oliver	Lejarette	Bramkarz	2001-12-08	166	87282510
583	Ivan	Polti	Bramkarz	1995-06-03	176	26314129
584	Adrian	Brown	Napastnik	2004-06-06	200	\N
585	Bo	Evans	Bramkarz	2008-06-27	161	99030247
586	Ana	Guyer	Obrońca	1983-08-03	186	\N
587	Netty	Framus	Pomocnik	1982-11-09	197	81566148
588	Sjaak	Van Dinter	Napastnik	2008-08-05	185	\N
589	Izzy	Seibel	Bramkarz	1986-12-30	168	39375507
590	Cian	Swaine	Obrońca	1994-10-18	186	25679548
591	Bram	Matthew	Bramkarz	2012-09-28	175	2591945
592	Zoe	Thaler	Pomocnik	1991-08-15	163	\N
593	Georgina	King	Obrońca	2007-06-01	192	59372969
594	Edwina	Moore	Napastnik	2018-01-16	177	27903027
595	Emily	Petrzelka	Bramkarz	2018-08-07	192	6235400
596	Barbara	Ahlgren	Pomocnik	2005-11-16	194	52610803
597	Christa	Durso	Bramkarz	1988-12-18	162	\N
598	Katie	Friedman	Bramkarz	2004-11-13	193	\N
599	Jean	Brown	Napastnik	1999-02-07	199	76753881
600	Marie	Igolavski	Obrońca	1998-09-27	164	28361265
601	Syd	Zurich	Pomocnik	1997-12-21	170	\N
602	Pip	Richter	Napastnik	2012-10-29	183	1648059
603	Eleanor	Ionescu	Pomocnik	1991-08-03	177	71511792
604	Jody	Daughtery	Obrońca	2018-01-04	170	31133482
605	Siska	Turk	Pomocnik	2011-02-27	177	2632589
606	Catherine	Hummel	Pomocnik	1992-12-01	194	\N
607	Iris	Hardoon	Bramkarz	2012-08-01	194	\N
608	Sam	Newman	Bramkarz	2004-09-01	171	88099652
609	Lincoln	Watson	Obrońca	2015-09-18	186	82296892
610	Nicholas	Royal	Obrońca	1991-12-10	162	\N
611	Sherm	Hendrix	Napastnik	1999-02-17	199	13095003
612	Lia	Ayers	Pomocnik	1984-03-16	172	52441086
613	Sjanie	Hankins	Obrońca	1983-12-02	195	\N
614	Ida	Otto	Bramkarz	1993-06-09	164	\N
615	Joe	Mulders	Pomocnik	2004-08-15	191	\N
616	Camille	Watson	Bramkarz	2019-06-16	186	15868972
617	Marco	Moreau	Bramkarz	1988-12-27	185	94192998
618	Johnny	van der Laar	Pomocnik	1997-07-21	166	\N
619	Chuck	Gonzalez	Obrońca	1984-10-13	165	\N
620	Sigrid	Bruno	Bramkarz	1984-12-01	196	54276093
621	Ainhoa	Robinson	Pomocnik	1998-07-21	173	1444265
622	Taylor	Stockton	Obrońca	1990-01-11	163	68929367
623	Leonie	Browne	Napastnik	2016-01-29	192	\N
624	Giel	Hardoon	Bramkarz	2007-04-24	168	\N
625	Conor	Cross	Bramkarz	2015-05-03	164	32127530
626	Max	Toreau	Bramkarz	1997-07-25	173	34947530
627	Alva	Bogdanovich	Bramkarz	1983-09-05	169	18928699
628	Herbert	Helfrich	Obrońca	1990-10-03	179	6984712
629	Nicoline	Crocetti	Pomocnik	1999-08-19	164	24789361
630	Mariska	Uitergeest	Bramkarz	2008-01-26	192	83329513
631	Pauline	Harder	Bramkarz	2006-06-15	194	75219065
632	Mikkel	Crocetti	Obrońca	1998-08-21	182	\N
633	Herb	Sanders	Obrońca	1981-12-19	174	94064204
634	Philippa	Lee	Obrońca	2015-01-14	190	34659550
635	Johnny	Byrnes	Napastnik	2016-09-07	168	\N
636	Sharon	Jenssen	Bramkarz	1978-03-14	194	83848314
637	Ada	Morton	Bramkarz	1980-10-31	198	92095581
638	Peggy	Langham\t	Pomocnik	1998-08-21	175	32201281
639	Bas	Spensley	Bramkarz	2010-01-15	196	51513231
640	Herbert	Dean	Pomocnik	1999-04-12	170	59399822
641	Jeanette	Harder	Napastnik	1985-07-28	191	26096586
642	Pete	Schmidt	Obrońca	1990-08-13	195	79754301
643	Benjamin	Brennan	Pomocnik	2003-12-08	166	90155023
644	Carolina	Gonzalez	Pomocnik	1988-07-23	172	74861318
645	Scottie	Stockton	Napastnik	1991-03-07	169	\N
646	Albert	Grote	Napastnik	1981-01-06	171	73675671
647	Alba	Waldo	Obrońca	1979-11-30	166	\N
648	Oscar	Gua Lima	Bramkarz	2014-01-10	176	73372993
649	Pedro	Perilloux	Pomocnik	1980-12-21	174	29774104
650	Babet	Bugno	Obrońca	2003-10-24	170	25186927
651	Zofia	Petrzelka	Pomocnik	1979-07-27	175	44503059
652	Co	Mulders	Obrońca	1998-12-28	194	\N
653	Petra	Wilson	Pomocnik	2018-09-05	195	2905749
654	Sem	Hancock	Obrońca	1983-06-14	190	49887882
655	Sjon	Mitchell	Napastnik	2007-07-06	185	\N
656	Hanna	Jenssen	Bramkarz	2011-10-20	178	23830699
657	Stanislaw	Williams	Bramkarz	2017-06-14	191	93247541
658	Ruth	LeGrand	Pomocnik	2002-08-05	182	\N
659	Mathilde	Shapiro	Pomocnik	1999-04-24	186	29034457
660	Izzy	Marra	Pomocnik	1985-06-21	166	19606962
661	Alejandro	Browne	Pomocnik	2004-07-23	191	62660673
662	Anna	Willis	Pomocnik	1991-07-01	160	27103824
663	Isabel	Cantere	Napastnik	1999-01-21	169	52192020
664	Jack	Gunter	Obrońca	1984-12-03	162	76994363
665	Tinus	van der Laar	Napastnik	1979-11-24	198	1672691
666	Jacob	Cragin	Bramkarz	1979-04-09	173	81675736
667	Michel	Deleo	Pomocnik	2000-11-29	197	36003889
668	Bas	Jackson	Pomocnik	2009-07-28	181	93545858
669	Bob	Ward\t	Pomocnik	1993-02-17	172	\N
670	Pete	Schubert	Pomocnik	1975-06-02	186	89624295
671	Roger	Pekagnan	Obrońca	2013-03-05	176	94780763
672	Susan	Buchholz	Bramkarz	2009-03-14	163	93947552
673	Peter	Morton	Napastnik	1986-11-07	170	69582920
674	Bill	Bogdanovich	Napastnik	2012-03-18	190	96778803
675	Joseph	Nelson	Napastnik	1976-08-01	190	71209761
676	Mario	McCormick	Napastnik	1995-01-05	192	18718641
677	Bill	Blount	Napastnik	1975-09-14	179	96836612
678	Iris	Stevens	Obrońca	2018-08-14	197	\N
679	Joost	Wolpert	Napastnik	2006-07-08	172	\N
680	Javier	Phillips	Obrońca	2006-12-03	178	87180202
681	Sanne	Anderson	Pomocnik	1978-02-11	192	98992742
682	JanCees	Francis	Bramkarz	1977-02-18	171	6866862
683	Mikkel	McDaniel	Napastnik	2004-02-22	170	26592246
684	Kimberly	Freed	Obrońca	1987-08-02	181	68199375
685	Johnny	White	Pomocnik	1986-12-23	191	94242327
686	Alejandro	Guyer	Obrońca	2007-04-01	169	77635252
687	Talitha	McDaniel	Bramkarz	1982-09-19	169	62213850
688	Gillian	White	Obrońca	1998-08-04	196	93505070
689	Cees	Chwatal	Pomocnik	2003-03-17	170	77037484
690	Oscar	Meterson	Obrońca	2014-07-27	181	39521413
691	Claudia	Williams	Obrońca	1990-11-27	188	532535
692	Sjef	Phelps	Bramkarz	2019-10-31	173	29078051
693	Ulla	Jones	Pomocnik	2002-11-27	188	61406614
694	Netty	Stevenson	Pomocnik	1988-07-26	170	62359048
695	Camilla	Herzog	Pomocnik	1997-11-22	162	\N
696	Andrzej	Dulisse	Napastnik	2003-07-23	169	\N
697	Jose	Otto	Pomocnik	1987-08-10	200	55694271
698	Dave	Bernstein	Napastnik	2018-01-28	177	\N
699	Ed	Polti	Napastnik	1998-11-02	171	92757435
700	Maaike	Moore	Pomocnik	2013-04-05	181	90453508
701	Ada	Mitchell	Bramkarz	1992-03-02	174	70895159
702	Matt	Brylle	Pomocnik	1992-04-14	200	9050398
703	Camilla	Cooper	Napastnik	2018-06-26	196	84544302
704	Chris	Naff	Pomocnik	1984-12-18	180	\N
705	Alba	Johnson	Pomocnik	2010-03-21	172	17723124
706	Ike	Helbush	Obrońca	2003-10-27	163	61233544
707	Godfrey	Cooper	Napastnik	2006-06-26	178	33010739
708	Steph	Kellock	Obrońca	2016-05-18	194	45476064
709	Elizabeth	Griffioen	Napastnik	2010-02-09	191	58592963
710	Linnea	Lamere	Napastnik	2018-11-05	191	54809967
711	Mathias	Lamere	Pomocnik	1998-07-01	172	16180089
712	William	DeBuck	Pomocnik	2012-05-13	184	75131178
713	Ted	Cramer	Napastnik	2017-08-19	188	95061821
714	Daan	White	Pomocnik	1976-08-20	177	75576453
715	Mick	Phillips	Obrońca	2004-10-08	195	83228475
716	George	Cappello	Obrońca	1980-08-31	200	\N
717	Al	Mairy	Napastnik	2018-06-08	164	30262056
718	Gert	Willis	Pomocnik	1990-08-12	194	98180501
719	Maja	Mulders	Napastnik	1979-12-01	163	67525856
720	Robert	Guethlein	Pomocnik	2002-08-21	160	45476633
721	Taylor	Dean	Obrońca	2008-03-02	178	20832492
722	Ollie	Watson	Pomocnik	2014-08-18	172	\N
723	Ben	Wilson	Pomocnik	1993-11-06	190	\N
724	Lukas	Markovi	Napastnik	1997-12-06	185	31733281
725	Jozef	Knight	Pomocnik	1987-09-20	189	75166467
726	Eleanor	Oyler	Obrońca	2014-11-14	185	68821191
727	Isaac	Bruno	Napastnik	1999-06-02	198	87903944
728	Krzysztof	Praeger	Obrońca	1996-02-20	167	\N
729	Sam	Wesolowski	Bramkarz	1983-08-05	197	\N
730	Juan	Gonzalez	Bramkarz	2018-12-23	184	\N
731	Lena	Richter	Napastnik	2017-07-17	167	7502657
732	Jessica	Schubert	Obrońca	2019-12-09	173	43739694
733	Ivan	Phillips	Pomocnik	2011-03-30	195	1219695
734	Jonas	Cappello	Obrońca	2017-06-16	170	61482224
735	Linnea	Howe	Pomocnik	1982-07-25	177	77056781
736	Rogier	Harder	Obrońca	1997-03-10	183	91075453
737	Peggy	Nahay	Obrońca	1986-03-08	168	30132063
738	Joop	Guyer	Pomocnik	2014-09-14	166	63768746
739	Suzanne	Harness	Obrońca	2004-03-08	165	50059322
740	Michel	Gerschkow	Napastnik	1994-10-29	174	58183377
741	Carolina	Roche	Obrońca	2006-12-15	164	78706464
742	Hank	Durso	Pomocnik	1975-01-05	170	45562769
743	Nick	Kepler	Napastnik	1978-05-28	163	12990610
744	Alva	Lamere	Obrońca	1981-08-06	192	21743169
745	Jonas	Daughtery	Obrońca	1991-07-15	179	38430730
746	Pip	Thompson	Napastnik	1991-12-13	194	\N
747	Mariska	Robbins	Obrońca	1978-03-13	162	\N
748	Chris	Meterson	Napastnik	1979-08-29	196	72232390
749	Roger	Harder	Bramkarz	1991-12-10	184	54020474
750	Lena	Herring	Obrońca	2009-02-03	170	662106
751	Jessica	Davis	Obrońca	1990-06-10	171	42929577
752	Jacob	Wakefield	Bramkarz	1997-10-27	178	85046779
753	Piotr	Koss	Pomocnik	1984-04-20	184	11392077
754	Philippa	Novratni	Obrońca	1979-11-21	162	26880390
755	Cloe	Freed	Obrońca	2010-12-24	177	94446986
756	Andrea	Brylle	Bramkarz	1994-07-11	178	\N
757	Piotr	Sirabella	Napastnik	1993-08-24	163	53849983
758	Jurre	Brumley	Pomocnik	2008-04-28	194	\N
759	Jose	Swaine	Napastnik	2002-02-11	191	38986489
760	Margaret	Keller	Obrońca	1999-06-14	182	43319671
761	Al	Anderson	Pomocnik	2006-05-03	183	1053435
762	Cecilie	Mitchell	Obrońca	2010-06-11	180	94910844
763	Teun	Linhart	Obrońca	2015-11-14	193	85569009
764	Cristian	Ecchevarri	Pomocnik	1980-03-03	171	35669787
765	Taylor	Anderson	Pomocnik	1992-12-29	184	8715042
766	Steven	Hankins	Napastnik	1991-06-04	194	91467426
767	Jesse	Petrzelka	Bramkarz	1999-02-03	182	48358667
768	Ike	DeBerg	Napastnik	1976-05-27	197	29255803
769	Rolla	Bruno	Napastnik	1998-04-16	160	42630714
770	Giel	Goodman	Pomocnik	2005-06-10	194	68353168
771	Tobias	Ahlgren	Obrońca	1994-12-02	184	83107681
772	Oscar	Phillips	Napastnik	2010-08-30	173	63254757
773	Ashley	Makelaar	Pomocnik	2019-10-06	191	96416689
774	Nigel	Reyes	Napastnik	2018-10-25	178	74246218
775	Adam	Polti	Pomocnik	1985-08-15	189	94302165
776	Charlotte	Fox	Bramkarz	1981-12-06	181	88469837
777	Zofia	Lawton	Bramkarz	1993-07-12	170	\N
778	Ann	Depew	Obrońca	1993-02-04	188	34517028
779	Raul	Millis	Napastnik	1999-08-07	186	\N
780	Sjef	Paul	Obrońca	2016-07-07	169	\N
781	Nathan	Shapiro	Pomocnik	2001-09-02	176	75072378
782	Pip	Brendjens	Bramkarz	2005-06-15	192	55280991
783	Jim	Glanswol	Bramkarz	1991-11-23	163	49329638
784	Rosa	Foreman	Bramkarz	1991-10-18	176	\N
785	Jim	Cooper	Bramkarz	2002-08-26	179	3293021
786	Coby	Goodnight	Pomocnik	1981-05-09	175	\N
787	Maaike	Press	Obrońca	1998-04-20	162	25056552
788	Krystyna	Newman	Bramkarz	1980-01-13	160	65700684
789	Rich	Prior	Pomocnik	2009-06-23	190	\N
790	Jace	Langham\t	Bramkarz	2011-05-23	190	52182199
791	Martina	Robbins	Napastnik	1989-07-12	180	64235742
792	Rachael	Zurich	Obrońca	1994-07-29	199	94424750
793	Andy	Cramer	Obrońca	1989-04-12	180	35710029
794	Ester	Wakefield	Bramkarz	2014-04-17	178	46488575
795	Charlotte	Brennan	Obrońca	1976-08-02	183	66402089
796	Matthew	Phelps	Bramkarz	1988-11-09	165	79031599
797	Christopher	Willis	Napastnik	2002-09-23	170	73390416
798	Nathan	Wakefield	Obrońca	1979-11-14	189	70443071
799	Rachel	Cross	Napastnik	1995-01-30	189	26962063
800	Drew	Griffioen	Obrońca	1975-03-14	195	96083203
801	Laura	Botsik	Napastnik	1978-06-22	169	71915147
802	Lea	White	Napastnik	2010-11-27	178	63736044
803	Guus	Millis	Pomocnik	1984-05-29	187	17157635
804	Carolina	Anderson	Napastnik	2017-01-02	176	40287320
805	Aoife	Browne	Napastnik	1987-02-20	168	28024349
806	Emma	Bloom	Napastnik	2012-02-12	195	72965269
807	Benjamin	Bugno	Bramkarz	1985-09-26	174	90161290
808	Sara	Perilloux	Bramkarz	1987-05-17	179	\N
809	Tim	Freeman	Napastnik	1998-07-27	176	\N
810	Jaap	Wood	Bramkarz	2015-04-23	196	15685064
811	Lars	Raines	Bramkarz	1998-03-08	174	6500470
812	Martien	Huston	Obrońca	1995-12-20	186	\N
813	Helma	Warner	Napastnik	1986-01-07	197	15924370
814	Richard	DeWilde	Pomocnik	2017-10-19	187	92529568
815	Peg	Lannigham	Obrońca	2014-03-03	183	82299968
816	Alvaro	Helbush	Napastnik	2011-05-24	193	68618905
817	Theo	Brylle	Obrońca	1979-04-06	190	50782182
818	Nicoline	Durso	Pomocnik	2008-06-18	197	\N
819	Nicolas	Pierce	Pomocnik	1976-01-27	196	\N
820	Jody	Ayers	Obrońca	2017-12-18	166	55400328
821	Rasmus	Pekaban	Obrońca	1998-03-25	170	58914867
822	Trevor	Stockton	Obrońca	2018-12-17	199	71502032
823	Louise	Manson	Obrońca	1977-02-15	196	91208239
824	Sofia	Knight	Bramkarz	2012-12-24	173	56563206
825	Bob	Wood	Napastnik	1986-04-18	173	86546811
826	Samantha	Sirabella	Pomocnik	2002-08-18	181	78390041
827	Annie	Oyler	Bramkarz	2008-05-12	192	\N
828	Lewis	Moon	Pomocnik	2007-04-17	182	11869975
829	Geoff	Patricelli	Pomocnik	1983-01-18	164	34398901
830	Camilla	Nahay	Bramkarz	2015-09-26	181	\N
831	Oliver	Pekaban	Obrońca	1978-09-07	183	39354759
832	Betty	Toler	Pomocnik	2014-07-05	184	\N
833	Jordy	McDaniel	Bramkarz	2003-03-05	175	3375217
834	Andrzej	Gerschkow	Pomocnik	2012-08-19	191	58127163
835	Ainhoa	Lejarette	Napastnik	1984-07-02	196	37622831
836	Lincoln	Deans	Napastnik	2001-05-09	182	76453337
837	Talita	Wargula	Bramkarz	1986-09-23	198	34748441
838	Vincent	Nadalin	Pomocnik	2013-02-28	181	\N
839	Ollie	Braconi	Pomocnik	2015-03-23	183	92456545
840	Katie	van Dijk	Napastnik	1976-07-17	178	94483334
841	Joshua	Chwatal	Bramkarz	1993-08-09	168	84481357
842	Shermie	Goodman	Bramkarz	1996-01-17	172	\N
843	Carolina	Huffsmitt	Bramkarz	2015-08-17	183	\N
844	Diego	Bergdahl	Pomocnik	1979-04-18	181	29270616
845	Nigel	Gieske	Obrońca	2002-01-18	190	\N
846	Barbara	Crocetti	Napastnik	1990-03-21	180	85028627
847	Esther	Waldo	Obrońca	1977-07-22	164	38592703
848	Ciska	Howe	Obrońca	1981-01-23	173	12243933
849	Tim	Archer	Napastnik	1988-06-17	161	57075559
850	Jaap	Visentini	Napastnik	1981-07-31	198	34145811
851	Phil	DeBerg	Pomocnik	2003-10-03	192	1521250
852	Koos	Vanderoever	Bramkarz	2017-08-21	170	\N
853	Zoe	Bloom	Bramkarz	2002-11-02	162	78239202
854	Joanne	Lejarette	Pomocnik	1996-10-23	193	22985064
855	David	Symms	Pomocnik	2001-01-04	192	70307345
856	Lisa	Cramer	Obrońca	1995-08-15	167	80819062
857	Ester	DeWilde	Pomocnik	1989-01-22	179	54862280
858	Joost	Gieske	Obrońca	2004-08-27	189	\N
859	Marcin	DeWilde	Napastnik	1979-01-09	192	73848166
860	Lena	Brown	Napastnik	1993-04-21	170	40996477
861	Gerrit	Hancock	Bramkarz	1978-09-28	172	44862127
862	Barbara	Maribarski	Obrońca	1980-01-25	186	85278718
863	Christa	Brady	Napastnik	2019-05-21	182	82817393
864	Herb	Arcadi	Bramkarz	1999-08-18	166	41757361
865	Marco	Naff	Bramkarz	1983-08-26	193	77449455
866	Cian	Clark	Pomocnik	2008-03-09	180	39667481
867	Maximilian	Wood	Pomocnik	2008-04-13	185	\N
868	Catharine	Paul	Bramkarz	2018-12-28	172	83157980
869	Lara	Hankins	Pomocnik	2005-11-01	189	12675913
870	Victor	Thompson	Obrońca	1977-10-03	194	85782304
871	Piet	Herring	Bramkarz	2014-10-10	180	\N
872	Cristian	Ladaille	Napastnik	2014-01-06	174	49783662
873	Nick	Hendrix	Pomocnik	2003-02-21	199	67957147
874	Michel	Mairy	Obrońca	1982-05-12	184	823677
875	Luis	Poissant	Pomocnik	2016-02-28	188	84940413
876	Lucille	Bitmacs	Napastnik	2006-10-05	168	5157808
877	Katarzyna	Herzog	Obrońca	1985-08-25	179	24522254
878	Cathy	Yinger	Bramkarz	2015-06-26	188	6243046
879	Leo	Hoogbandt	Pomocnik	2002-03-03	167	55419049
880	Rachel	Francis	Obrońca	1981-09-21	163	18956332
881	Jesse	Ostanik	Pomocnik	2019-04-18	186	27282550
882	Lea	Haynes	Pomocnik	1991-01-11	174	18080402
883	Talitha	Jones	Bramkarz	1978-01-20	161	52957610
884	Koos	Weinstein	Napastnik	2018-03-27	200	39481370
885	David	Stannard	Pomocnik	1987-02-28	171	30220222
886	Philippa	Wolpert	Bramkarz	2008-09-03	188	97275504
887	Tim	Jones	Napastnik	1980-09-04	196	8466881
888	Tyler	Sharp	Obrońca	2007-05-11	169	\N
889	Agnieszka	Helbush	Obrońca	2017-12-03	177	17848505
890	Harold	Yinger	Obrońca	1997-09-12	177	53259098
891	Joe	Bernstein	Pomocnik	1998-06-24	169	6028982
892	Kimberly	Sterrett	Napastnik	2016-02-08	198	\N
893	Jan	Katsekes	Bramkarz	1993-05-20	198	\N
894	Jeffery	Paddock	Pomocnik	2001-11-02	169	70343551
895	Rick	Hollman	Pomocnik	2015-05-05	191	4347505
896	Emma	Williams	Napastnik	1978-06-24	160	43466402
897	Hank	Davis	Obrońca	1975-09-14	161	65715186
898	Sherman	Morgan	Napastnik	1980-07-16	181	52785684
899	Annie	Krutkov	Bramkarz	2017-03-24	166	57732728
900	Jane	Hoogbandt	Obrońca	1999-10-18	174	\N
901	Julian	Dittrich	Bramkarz	2007-11-06	190	11318778
902	Stephanie	Botsik	Obrońca	2012-12-20	171	\N
903	Jane	Arcadi	Napastnik	2009-01-08	173	30183957
904	Petra	Ionescu	Napastnik	2015-03-15	196	\N
905	Bengie	Hendrix	Bramkarz	1991-02-11	184	24681286
906	Georgina	Phillips	Napastnik	1987-01-13	190	20222022
907	Joseph	Ahlgren	Bramkarz	1997-08-27	192	79496914
908	Dick	Goodnight	Obrońca	2011-02-13	192	83207361
909	Jesse	Riegel	Pomocnik	1990-08-24	189	\N
910	Ricky	Herring	Napastnik	1976-04-15	165	\N
911	Talitha	van der Laar	Pomocnik	2018-08-19	196	\N
912	Matthijs	Waddell	Pomocnik	2004-11-02	171	74305229
913	Lucille	Cooper	Napastnik	1977-11-08	181	90756158
914	Jill	Bitmacs	Pomocnik	2002-08-30	200	71951939
915	Joe	Zurich	Napastnik	1983-05-09	182	58244983
916	Ann	Bergdahl	Pomocnik	2001-07-11	181	24300697
917	Andrew	Nefos	Bramkarz	1977-06-29	200	72739180
918	Theo	King	Napastnik	1988-05-11	160	52813368
919	Liam	Hummel	Napastnik	1994-10-14	173	\N
920	Liam	Dittrich	Bramkarz	2009-08-16	181	66241124
921	Nicolas	Hopper	Bramkarz	2002-09-02	198	37281488
922	Robert	Fox	Napastnik	2001-03-16	199	43235003
923	Helma	Helbush	Bramkarz	1976-08-09	178	\N
924	Sanne	Love	Obrońca	1979-01-22	179	\N
925	Fabian	Pensec	Pomocnik	1985-10-14	164	55865369
926	Victor	Seibel	Bramkarz	2008-06-25	182	\N
927	Ulla	Willis	Pomocnik	2008-05-20	181	\N
928	Carolina	Hedgecock	Napastnik	2010-01-21	178	\N
929	Philippa	Koch	Pomocnik	2017-11-04	170	88033958
930	Leo	Davis	Bramkarz	1985-03-23	177	3469063
931	Erin	Zia	Obrońca	1987-10-07	162	43084828
932	Ross	Uitergeest	Obrońca	2004-07-27	191	40944044
933	Cian	Moon	Bramkarz	1989-08-27	179	25841911
934	Tonnie	Geoppo	Obrońca	1981-05-12	165	94918638
935	Tonnie	Bitmacs	Napastnik	2016-10-01	177	65654359
936	Joey	Pekagnan	Bramkarz	2002-04-15	193	97930486
937	Leo	Morton	Napastnik	2008-11-29	179	48917949
938	Betty	Uitergeest	Bramkarz	1995-02-08	199	\N
939	Aoife	Durso	Napastnik	2016-07-27	180	\N
940	Albert	Millikin	Napastnik	2018-11-24	199	26711422
941	Jordy	Love	Napastnik	2017-08-17	195	87123728
942	Ton	Ahlgren	Napastnik	1985-10-24	171	\N
943	Anthony	Cramer	Pomocnik	2011-06-11	171	13847589
944	Rik	Mariojnisk	Obrońca	2005-10-06	186	68282397
945	Lena	Naley	Pomocnik	2000-12-01	185	48436620
946	Marta	Fernandez	Pomocnik	1980-05-12	171	53267834
947	Ton	Cohen	Pomocnik	2001-02-02	182	38079122
948	Bob	Wood	Pomocnik	1975-09-19	163	\N
949	Harold	Hoogbandt	Pomocnik	2009-04-03	195	12951659
950	Juana	Massingill	Obrońca	1988-08-03	197	58641285
951	Krystyna	Wong	Bramkarz	2018-06-04	191	37159895
952	Lucia	Ladaille	Obrońca	1978-01-15	174	39174447
953	Tom	Cross	Obrońca	1996-10-26	173	77050206
954	Tomasz	Korkovski	Bramkarz	2010-03-22	182	73601063
955	Rich	Emerson	Pomocnik	1982-09-18	171	36323373
956	Taylor	DelRosso	Bramkarz	2005-02-27	161	11945623
957	Sandra	Crocetti	Obrońca	2018-03-25	196	72290025
958	Kees	Ionescu	Napastnik	1983-10-10	162	20933480
959	Jeanette	Slocum	Pomocnik	2008-05-09	197	5107551
960	Talitha	Byrnes	Napastnik	1988-06-20	162	18843999
961	Lisa	Hoogbandt	Obrońca	1996-12-15	188	53419252
962	Jody	Stevenson	Pomocnik	2011-05-29	193	\N
963	Truus	Crocetti	Pomocnik	1978-09-03	177	95726420
964	Nick	Hopper	Bramkarz	2014-05-13	175	20205413
965	Jeanne	Cooper	Obrońca	2016-07-24	166	\N
966	Isaac	Mejia	Bramkarz	2002-11-04	163	60553984
967	Bram	Boyer	Obrońca	1984-06-02	162	86566671
968	Kim	Wakefield	Obrońca	1986-08-29	172	40679101
969	Chloe	Anderson	Napastnik	1981-05-09	173	19278510
970	Matt	Griffioen	Obrońca	2008-06-02	199	\N
971	Peg	Langham\t	Pomocnik	1992-05-28	178	50427871
972	Peg	Gunter	Bramkarz	1993-01-21	170	68028956
973	Sharon	Heyn	Napastnik	2002-12-09	161	38754712
974	Lu	Archer	Napastnik	2009-03-23	165	\N
975	Hannah	Byrnes	Napastnik	1996-10-22	182	\N
976	Caitlin	Hummel	Bramkarz	1990-09-23	163	36530962
977	Agnieszka	Zimmerman	Napastnik	1983-05-06	168	32176334
978	Juana	Moreau	Bramkarz	2009-05-28	199	\N
979	Shermie	Cramer	Pomocnik	1980-08-09	191	92806917
980	Anthony	Morton	Obrońca	2014-12-08	188	4541505
981	Luke	Framus	Bramkarz	1992-01-18	163	38657018
982	Marieke	Nahay	Obrońca	1995-01-17	171	55378338
983	Jeffery	Menovosa	Bramkarz	2019-08-24	166	43564184
984	Conor	Lamere	Napastnik	1987-07-31	169	36895198
985	Andrew	Green	Bramkarz	1991-07-21	184	42133212
986	Toon	Suszantor	Pomocnik	1979-04-07	164	94318856
987	Sarah	Van Toorenbeek	Bramkarz	1980-07-14	177	62451569
988	Dylan	Poplock	Pomocnik	2009-06-17	192	83135017
989	Jan	Paddock	Napastnik	1978-03-14	163	\N
990	Nate	Huston	Napastnik	1977-01-16	166	28834917
991	Steve	Moon	Obrońca	1976-05-17	180	\N
992	Steve	Williams	Pomocnik	2015-08-09	192	\N
993	Jaclyn	King	Bramkarz	2010-01-27	191	41473433
994	Syd	Hamilton	Pomocnik	2015-08-30	185	7409262
995	Krzysztof	Stevenson	Pomocnik	2000-06-01	192	87890412
996	Paul	Shapiro	Pomocnik	1984-06-18	194	7461460
997	Rachel	McCormick	Pomocnik	2013-04-20	197	\N
998	Marta	Voigt	Obrońca	1975-06-14	190	77641778
999	Suzanne	Franklin	Pomocnik	1994-03-20	177	24260952
1000	Martien	Nefos	Obrońca	1980-02-24	197	38341196
1001	Tyler	Boyer	Pomocnik	2004-08-19	191	12113769
1002	Isak	White	Bramkarz	1992-11-09	166	67362811
1003	Dave	Bloom	Napastnik	1987-08-31	173	\N
1004	Anna	White	Napastnik	2011-04-29	195	39955775
1005	Tim	Brylle	Obrońca	1990-12-10	195	\N
1006	Agnieszka	Robinson	Obrońca	2007-01-02	166	73522952
1007	Jane	Simonent	Pomocnik	2006-11-18	187	99419001
1008	Cecilie	Hardoon	Obrońca	2000-03-06	170	5850646
1009	Andy	Sanders	Napastnik	1977-10-06	165	71921121
1010	Jonas	Freeman	Bramkarz	2019-04-15	169	26081289
1011	Nicholas	Symms	Bramkarz	2001-03-04	170	61412447
1012	Jack	Daley	Napastnik	1979-06-13	188	6125110
1013	Maja	Yinger	Napastnik	2001-07-02	171	45564302
1014	Godfrey	DeWilde	Pomocnik	2010-03-11	167	2247720
1015	Andrzej	Manson	Pomocnik	2006-12-16	193	31608680
1016	Tomasz	Kuehn	Napastnik	2000-06-18	163	73459460
1017	Bert	Hopper	Pomocnik	2016-04-04	183	\N
1018	Bengie	Wood	Napastnik	2009-04-06	160	38293453
1019	Frederik	Schubert	Bramkarz	1989-09-19	179	74452634
1020	Martina	Wood	Bramkarz	2006-07-18	199	98005179
1021	Nathan	Symbouras	Obrońca	1992-03-10	173	95837463
1022	Sofia	Richter	Bramkarz	1975-02-16	187	1187915
1023	Joost	Gieske	Pomocnik	1976-07-16	197	76257412
1024	Mart	Climent	Obrońca	1990-05-18	187	55456808
1025	Theodore	Little	Bramkarz	2006-02-20	194	81812605
1026	Coby	Jessen	Bramkarz	1986-01-30	200	\N
1027	Shermie	Ditmanen	Obrońca	2017-06-06	175	86809912
1028	Jose	Harder	Napastnik	1986-05-11	166	38553594
1029	Nico	Brady	Pomocnik	1997-01-04	166	\N
1030	Tomas	Knopp	Napastnik	1993-07-19	171	77415683
1031	Marta	Lee	Obrońca	2012-02-29	177	78220231
1032	Daniel	Helbush	Bramkarz	1982-10-24	177	5098264
1033	Helma	Brown	Bramkarz	1991-12-04	180	11463831
1034	Scott	Geoppo	Bramkarz	2009-07-14	183	86494266
1035	Julian	Wakefield	Napastnik	2003-03-29	186	84936602
1036	Luka	Symbouras	Bramkarz	1978-04-28	191	89174045
1037	Piotr	Freed	Bramkarz	1996-01-26	181	88947887
1038	William	King	Obrońca	1990-12-11	187	6292081
1039	Cristina	Stevens	Obrońca	1976-08-06	194	42749271
1040	Phil	Katsekes	Bramkarz	2019-05-29	195	73422778
1041	Carolina	Polti	Obrońca	2009-07-03	177	9890452
1042	Megan	Kellock	Napastnik	1986-10-23	170	\N
1043	Duncan	Long	Pomocnik	2000-04-11	170	\N
1044	Ann	Naff	Pomocnik	2002-11-17	189	8398572
1045	Taylor	Nelson	Pomocnik	1987-05-14	190	36815693
1046	Saskia	Phillips	Pomocnik	1985-01-12	174	13770668
1047	Malgorzata	Jessen	Napastnik	2012-09-15	189	63619612
1048	Guus	DeWilde	Bramkarz	2006-02-15	170	63229774
1049	Marieke	Hulshof	Pomocnik	2008-05-16	191	\N
1050	Jorge	Kidd	Napastnik	2001-01-10	196	\N
1051	Nicoline	Koch	Obrońca	1983-09-26	174	56277161
1052	Albert	Brisco	Pomocnik	2000-04-19	196	\N
1053	Will	Lawton	Obrońca	1989-06-10	185	32860138
1054	Robert	Stevenson	Obrońca	2018-08-05	195	69555463
1055	Theodore	Nadalin	Pomocnik	1976-06-06	162	65697808
1056	Margo	Krutkov	Bramkarz	2014-08-18	168	86604372
1057	Julian	Menovosa	Obrońca	1989-11-07	184	\N
1058	Pieter	Bloom	Obrońca	1982-10-24	175	99185815
1059	Lia	Wooten	Pomocnik	1993-09-01	199	66457802
1060	Ben	Griffioen	Napastnik	2004-08-09	171	82403342
1061	Andrea	Mariojnisk	Pomocnik	2007-12-12	166	4146590
1062	Steven	Thaler	Napastnik	2016-04-25	172	8752946
1063	Jill	Paul	Bramkarz	2018-07-03	181	57644341
1064	Matthew	Brylle	Bramkarz	2002-07-16	177	74648556
1065	Chuck	DeWald	Napastnik	1979-07-09	182	20929008
1066	Elena	Thompson	Bramkarz	2013-04-24	178	81731265
1067	Stanislaw	Freed	Napastnik	1996-07-17	168	38064160
1068	Carla	Forsberg	Obrońca	2015-02-12	171	49765577
1069	Nienke	Jones	Pomocnik	2002-03-21	185	66509195
1070	Zoe	Haynes	Napastnik	2012-08-03	182	20605292
1071	Jaclyn	Stevenson	Pomocnik	1995-08-11	165	\N
1072	Alba	Schmidt	Obrońca	1996-07-13	177	95933950
1073	Ainhoa	Hoogbandt	Napastnik	2009-02-07	172	73555184
1074	Rik	Davis	Napastnik	2017-03-01	177	23706462
1075	Cloe	Naff	Pomocnik	1992-09-30	163	59616897
1076	Co	Yinger	Napastnik	2013-05-31	195	81969051
1077	Lisa	Oyler	Napastnik	2008-05-22	191	98635286
1078	Nicoline	Royal	Bramkarz	1996-04-01	167	8757784
1079	Carla	Chwatal	Napastnik	2001-12-20	195	9276866
1080	Chris	Griffith	Bramkarz	1978-03-12	199	52716503
1081	Sigrid	Forsberg	Bramkarz	1995-11-03	190	29204839
1082	Mathilde	Poplock	Pomocnik	1996-11-20	200	\N
1083	Cristina	Chwatal	Obrońca	1987-10-13	199	99271518
1084	Andrzej	Howe	Obrońca	2010-03-19	200	\N
1085	Herb	Ratliff	Bramkarz	2010-10-07	183	22035605
1086	Camila	Bryant	Bramkarz	1980-02-28	199	86122666
1087	Filip	Gieske	Bramkarz	1990-12-20	196	52121060
1088	Bo	Anderson	Bramkarz	2009-07-05	170	88886832
1089	Caitlin	Dean	Obrońca	1976-02-13	198	4031900
1090	Michel	Maribarski	Napastnik	1998-01-21	160	26388652
1091	Emma	Dittrich	Pomocnik	2010-07-24	176	68665731
1092	Isabel	Perilloux	Bramkarz	1995-07-31	199	71090708
1093	Eleanor	Williamson	Pomocnik	1987-09-29	177	17056651
1094	JanCees	Schmidt	Pomocnik	1979-12-11	167	55714390
1095	Jose	Mulders	Obrońca	1979-03-24	170	\N
1096	Saskia	Perilloux	Obrońca	2005-07-31	192	89921631
1097	Javier	Stewart	Pomocnik	2010-07-19	176	\N
1098	Elizabeth	Raines	Napastnik	2007-04-28	174	79024505
1099	Hank	Stannard	Obrońca	2014-03-12	193	9473417
1100	Dick	Green	Pomocnik	1998-12-16	194	25751289
1101	Sharon	Bloom	Bramkarz	1975-08-10	194	41197900
1102	Julia	Millikin	Napastnik	2008-02-13	166	40177344
1103	Freja	Clarke	Bramkarz	2019-09-25	169	33637168
1104	Guus	Cross	Napastnik	1998-09-25	162	31098271
1105	Jaap	Kidd	Pomocnik	2015-07-16	192	\N
1106	Barbara	Sanders	Pomocnik	2016-10-25	163	23836796
1107	Chris	Brown	Bramkarz	1982-02-07	169	90443808
1108	Ben	Cain	Bramkarz	1984-03-12	193	75819391
1109	Ann	van Dijk	Obrońca	2010-10-30	180	79276812
1110	Lara	Shapiro	Napastnik	1998-10-23	173	29212604
1111	Rick	Cragin	Bramkarz	1990-07-31	171	\N
1112	Mathias	Zurich	Obrońca	1980-04-16	195	97353394
1113	Herb	Depew	Pomocnik	2018-05-14	190	77454682
1114	Fons	Polti	Napastnik	1985-07-22	186	50766598
1115	Karen	Braconi	Pomocnik	1977-09-10	186	48439623
1116	Pawel	Sakurai	Bramkarz	1990-02-20	167	\N
1117	Jo	Menovosa	Pomocnik	1981-01-09	175	83836550
1118	Sherman	Freed	Obrońca	1984-05-05	167	76330467
1119	Charlie	Sanders	Bramkarz	2008-10-02	172	97383911
1120	Nerea	Toler	Napastnik	1990-09-18	167	81948681
1121	Simon	Julieze	Bramkarz	1981-02-05	176	62167879
1122	Joseph	Swaine	Bramkarz	2012-06-20	196	347605
1123	Marta	Forsberg	Obrońca	1992-09-30	174	61273834
1124	Katie	van Goes	Obrońca	1977-06-12	167	19838633
1125	Jamie	Ionescu	Napastnik	1981-01-21	164	3307737
1126	Ben	White	Napastnik	2007-11-17	183	50426525
1127	Sara	Lejarette	Bramkarz	1999-08-21	171	21613072
1128	Sydney	Knight	Pomocnik	1987-06-07	167	80459527
1129	Milan	Duvall	Pomocnik	1979-04-02	197	51284475
1130	Gill	Durso	Napastnik	2011-05-06	192	35858656
1131	Viktor	van Dijk	Bramkarz	1989-12-19	169	11695506
1132	Jolanda	Pierce	Bramkarz	1994-10-19	165	29271449
1133	Edwyn	Nefos	Bramkarz	2004-11-18	193	98086746
1134	Viktor	Ayers	Obrońca	2011-06-17	172	\N
1135	Lucia	Naley	Napastnik	2010-01-05	200	4029264
1136	Alvaro	Gonzalez	Pomocnik	1976-04-10	163	51294168
1137	Benjy	Wicks	Bramkarz	2006-01-23	182	97028819
1138	Matthew	Stevens	Pomocnik	1983-01-30	173	96811082
1139	Wilma	Carlos	Obrońca	2000-09-06	180	30364755
1140	Cath	Allison	Bramkarz	2015-11-12	194	\N
1141	Caitlin	Stevenson	Obrońca	1997-06-16	188	77043685
1142	Nicoline	Moon	Napastnik	2016-12-19	185	53083714
1143	James	Mejia	Obrońca	2011-05-04	170	68721116
1144	Klaas	Waldo	Bramkarz	2000-05-16	187	5828140
1145	Joe	Nadalin	Obrońca	2016-01-27	195	12678436
1146	Zoe	Waddell	Bramkarz	1996-07-03	180	36858929
1147	Gert	Poole	Napastnik	1977-04-07	172	53395539
1148	Helen	Bitmacs	Bramkarz	1979-06-29	172	77512034
1149	George	Barbee	Napastnik	2008-12-21	190	16539533
1150	Koos	Wargula	Napastnik	2010-11-13	163	\N
1151	Vanessa	Newman	Pomocnik	1995-07-10	198	\N
1152	Rolla	Deleo	Pomocnik	1975-11-19	186	95438347
1153	Roger	Heyn	Bramkarz	1976-12-23	188	42026538
1154	Leon	Lawton	Bramkarz	1994-09-07	190	45138922
1155	Sophia	Conley	Napastnik	2001-07-05	200	86427912
1156	Niek	Chwatal	Obrońca	2017-11-28	190	80507104
1157	Bob	Freeman	Pomocnik	2009-04-03	165	3568517
1158	Manuel	Brown	Bramkarz	1982-12-29	170	69345403
1159	Isaac	Fernandez	Napastnik	2011-07-21	180	70787757
1160	Jeffery	Ionescu	Pomocnik	2009-05-03	182	66939691
1161	Kees	Wesolowski	Napastnik	2011-10-12	182	83065750
1162	Joanne	Spensley	Obrońca	1975-08-28	168	54476526
1163	Cristian	Praeger	Bramkarz	1986-06-10	184	95540333
1164	Elzbieta	Bright	Napastnik	1977-07-22	181	2013001
1165	Ruth	Jiminez	Bramkarz	2006-08-27	186	\N
1166	Christian	Makelaar	Bramkarz	2010-11-01	172	11931119
1167	Rob	Swaine	Pomocnik	1978-09-04	177	39851588
1168	Jacob	Hedgecock	Pomocnik	2012-01-04	191	28603804
1169	Ester	Emerson	Bramkarz	2006-11-06	170	79010991
1170	Co	Herrin	Bramkarz	1990-02-10	162	10260349
1171	Hank	Williams	Bramkarz	2016-01-10	177	63187181
1172	Sjanie	Zimmerman	Bramkarz	1987-10-22	181	41222695
1173	Vincent	Reames	Obrońca	2019-03-16	169	22572529
1174	Dave	Lawton	Pomocnik	1977-07-17	197	41827354
1175	Ruth	Katsekes	Napastnik	2015-11-09	164	60781115
1176	Edward	Swaine	Obrońca	1979-02-26	195	18699198
1177	Henry	Swaine	Pomocnik	1985-10-12	200	3172539
1178	Gerrit	Brown	Obrońca	1984-09-04	165	44170640
1179	Adrian	Nahay	Obrońca	1997-01-19	199	68206463
1180	Carolina	Slater	Pomocnik	1985-11-05	163	\N
1181	Lea	Anderson	Napastnik	2015-02-20	188	\N
1182	Christian	Uprovski	Napastnik	1980-09-02	180	60717638
1183	Guus	Pengilly	Bramkarz	1986-01-12	173	46761353
1184	Albert	Sanders	Pomocnik	2002-10-17	175	28999961
1185	Ann	Brendjens	Obrońca	1995-03-17	186	28569668
1186	Bo	Watson	Napastnik	1979-09-16	182	85705672
1187	Julian	Nahay	Pomocnik	2015-06-07	160	42663190
1188	Ben	Wolpert	Napastnik	1985-11-11	162	\N
1189	John	Stevenson	Pomocnik	1988-02-07	197	63249586
1190	Drew	Ionescu	Pomocnik	1976-07-10	169	81643879
1191	Lars	Ecchevarri	Obrońca	2012-10-03	175	4392295
1192	William	van het Hof	Bramkarz	1989-10-21	188	16035931
1193	Bas	Nadalin	Napastnik	1989-09-05	176	\N
1194	Charles	Dulisse	Obrońca	1993-01-19	181	19269405
1195	Benjamin	Gieske	Obrońca	2018-01-11	185	82030022
1196	Andrzej	Brady	Bramkarz	1979-12-23	170	24825395
1197	Lena	Wicks	Bramkarz	2015-03-23	200	94358427
1198	Taylor	Ahlgren	Napastnik	2013-02-19	170	3389902
1199	Jeanne	Imhoff	Bramkarz	1996-09-08	185	38900855
1200	Klara	Wakefield	Obrońca	2002-09-14	172	24671246
1201	Andy	Antonucci	Pomocnik	1977-02-27	164	49501096
1202	Cecilie	Reames	Bramkarz	1992-08-25	185	38866486
1203	Sjanie	Hoogbandt	Obrońca	1979-11-26	197	20820215
1204	Siem	Langham	Bramkarz	2003-12-15	160	18717018
1205	Leah	Wood	Pomocnik	2010-06-10	164	47178214
1206	Raul	van Doorn	Napastnik	1988-01-22	173	\N
1207	George	Braconi	Bramkarz	2005-02-14	161	87169253
1208	Sally	Bergdahl	Bramkarz	1980-04-03	188	\N
1209	Jill	Bernstein	Napastnik	1999-08-25	192	\N
1210	Sue	Petrzelka	Bramkarz	2018-02-16	183	92902819
1211	Amy	Wood	Bramkarz	1994-03-11	179	16523522
1212	Godfrey	Hoyt	Napastnik	2013-08-22	163	3450670
1213	Leontien	Cain	Obrońca	1991-07-25	162	80482065
1214	Scott	Morton	Pomocnik	1997-05-20	166	71620799
1215	Kaylee	Olson	Bramkarz	1976-02-19	171	\N
1216	Philippa	DelRosso	Bramkarz	2000-09-18	178	55608122
1217	Teddy	Bitmacs	Bramkarz	2000-02-29	193	\N
1218	Talitha	Thompson	Napastnik	2003-11-18	186	24910581
1219	Liza	Durso	Obrońca	1989-09-18	166	94073225
1220	Lia	Prior	Bramkarz	2011-11-12	175	74422686
1221	Rob	Deleo	Obrońca	1984-10-14	199	5745587
1222	Izzy	Prior	Pomocnik	1980-12-20	170	60515198
1223	Marieke	Wooten	Pomocnik	1988-05-16	182	5860539
1224	Dorothy	Millikin	Bramkarz	2018-06-19	179	18751405
1225	Annie	Morton	Obrońca	2016-02-17	182	16748259
1226	Geoff	Spensley	Bramkarz	2001-12-28	176	64078932
1227	Liza	Mcgrew	Napastnik	1990-10-30	164	71656731
1228	Joe	King	Napastnik	1992-08-26	165	36808403
1229	Michael	Ditmanen	Napastnik	1999-10-31	199	34748180
1230	Ana	Jenssen	Bramkarz	2010-03-29	180	48773310
1231	Ainhoa	Clark	Pomocnik	1997-12-30	174	96544992
1232	Siem	Watson	Napastnik	2009-07-10	160	\N
1233	Bob	Mcgrew	Napastnik	2006-07-29	191	91344737
1234	Jurre	McCrary	Napastnik	1998-12-21	198	\N
1235	Jacob	Storrs	Napastnik	1975-04-08	169	12885294
1236	Amy	Baltec	Pomocnik	1995-07-26	184	57785941
1237	Mart	Brumley	Napastnik	1988-06-13	164	57895399
1238	Christian	Yinger	Pomocnik	1987-05-12	176	62628263
1239	Eleanor	Otto	Pomocnik	2009-12-26	163	49817814
1240	Oliver	Petterson	Obrońca	1992-03-20	170	20618798
1241	Ciara	Ladaille	Bramkarz	1978-04-13	196	\N
1242	Rosa	Weinstein	Napastnik	1977-10-31	184	92866299
1243	Daniel	Mitchell	Bramkarz	2013-06-23	188	\N
1244	Alejandro	Phillips	Napastnik	2000-11-21	170	99654287
1245	Siem	Lee	Pomocnik	1982-06-08	166	79382205
1246	Sam	Cooper	Bramkarz	1988-12-13	161	75154420
1247	Elizabeth	Deleo	Pomocnik	1990-08-05	198	12506127
1248	Krzysztof	Arcadi	Obrońca	1995-08-10	184	35922228
1249	Hannah	Heyn	Napastnik	1981-11-06	187	13327804
1250	Margo	Goodnight	Obrońca	2007-11-09	171	76888678
1251	Johnny	Katsekes	Pomocnik	2006-02-26	189	46528737
1252	Ricky	Paul	Bramkarz	1987-01-27	160	1631280
1253	Gabbie	Freeman	Pomocnik	1983-06-17	195	61710845
1254	Ann	van het Hof	Pomocnik	2001-10-29	170	76524737
1255	Jacob	Trainor	Pomocnik	1988-02-08	191	58719849
1256	Joseph	Dittrich	Pomocnik	2004-02-09	169	27544478
1257	Netty	Cantere	Napastnik	2003-05-20	179	83127235
1258	Sandra	Spensley	Pomocnik	2003-11-25	161	95964493
1259	Emma	Huffsmitt	Bramkarz	2003-06-20	180	37853680
1260	Sara	Donatelli	Pomocnik	2016-01-28	197	94054685
1261	Jamie	Ditmanen	Napastnik	1989-08-14	192	52331475
1262	Nathan	Vanderoever	Obrońca	2000-02-02	171	62020324
1263	Katarzyna	Trainor	Napastnik	2017-05-22	173	87647823
1264	Saskia	Millis	Bramkarz	1981-04-20	194	62724373
1265	Helen	Bogdanovich	Pomocnik	1995-11-20	182	15922386
1266	Jack	Ward\t	Pomocnik	2018-09-17	179	45980173
1267	Lizzy	Spensley	Bramkarz	1980-01-20	177	18188718
1268	Wilma	Mitchell	Bramkarz	1976-11-09	170	\N
1269	Zoe	Mitchell	Pomocnik	2012-04-26	200	53912350
1270	Lotte	Wilson	Pomocnik	2017-03-22	195	20916719
1271	Pauline	Kidd	Obrońca	2006-10-12	161	32221228
1272	Viktor	Oyler	Pomocnik	1996-10-03	179	\N
1273	Erin	Botsik	Pomocnik	2014-08-16	164	49127805
1274	Elzbieta	Hummel	Pomocnik	1997-10-24	199	17878078
1275	Kayleigh	Cramer	Bramkarz	2001-12-15	190	92232213
1276	Benjy	Hancock	Napastnik	1993-11-08	161	99081289
1277	Truus	Bright	Pomocnik	2010-04-09	184	61061065
1278	Alexander	Bugno	Napastnik	1995-04-18	177	62365728
1279	Jules	King	Napastnik	2005-09-17	199	41929279
1280	Ciska	Weaver	Napastnik	2014-05-19	182	43922126
1281	Alexis	Slemp	Bramkarz	2015-08-01	163	9958003
1282	Pawel	van het Hof	Napastnik	1975-06-10	175	38953997
1283	Leo	Arcadi	Pomocnik	1988-07-11	162	53324808
1284	Dirk	Sakurai	Obrońca	1978-12-04	189	1201435
1285	Peggy	Makelaar	Bramkarz	1983-02-27	160	\N
1286	Malgorzata	Watson	Obrońca	2013-05-31	191	93358762
1287	Alice	Robbins	Pomocnik	1982-02-13	170	89724255
1288	Emma	Johnson	Napastnik	2011-12-19	183	71678588
1289	Sigrid	Mitchell	Napastnik	1978-07-19	162	88055510
1290	Joanne	Deans	Obrońca	1977-11-26	161	75131723
1291	Lewis	Harder	Pomocnik	2010-02-19	180	72284048
1292	Carlos	Millis	Obrońca	1985-06-13	168	27643481
1293	Rob	Aldritch	Bramkarz	2012-03-16	180	66082353
1294	Julie	Mayberry	Bramkarz	1998-05-28	199	17393816
1295	Steven	Richter	Obrońca	2010-12-27	186	9925647
1296	Patty	Mejia	Bramkarz	1980-04-19	194	54602709
1297	Dylan	Weaver	Obrońca	2002-06-22	181	\N
1298	Piet	Sanders	Bramkarz	2009-12-11	176	\N
1299	Ewa	Bertelson	Pomocnik	1978-01-16	161	65566833
1300	Alexis	Lee	Bramkarz	1986-08-12	164	52462609
1301	Phil	Watson	Obrońca	1990-09-19	181	30875649
1302	Anne	Glanswol	Pomocnik	2014-09-11	168	86515811
1303	Jeanette	Barnett	Napastnik	1994-07-26	190	\N
1304	Cathy	Heyn	Obrońca	2014-08-29	186	\N
1305	Henry	Kellock	Obrońca	2013-05-04	176	\N
1306	Aoife	Kingslan	Bramkarz	1997-05-09	185	19277712
1307	Pieter	Forsberg	Obrońca	2007-01-29	195	\N
1308	Sem	Schlee	Pomocnik	1997-01-07	175	53873753
1309	Chuck	Anderson	Obrońca	1990-10-04	195	57649253
1310	Matthijs	Pyland	Pomocnik	1997-09-01	199	\N
1311	Thelma	Cramer	Pomocnik	1989-11-05	168	33222509
1312	Sherm	Ditmanen	Napastnik	1977-07-28	192	\N
1313	Rich	Slemp	Pomocnik	1993-12-20	197	52861374
1314	Mikkel	Voigt	Napastnik	1976-11-05	190	67760900
1315	Milan	Morgan	Obrońca	1990-09-25	196	36608461
1316	Al	Shapiro	Napastnik	1987-01-02	191	95514740
1317	Alejandro	Foreman	Bramkarz	1993-09-15	181	\N
1318	Megan	Brown	Obrońca	2013-03-20	168	\N
1319	Dorothy	Otto	Obrońca	2013-09-06	188	76986553
1320	Joshua	Bloom	Obrońca	2007-09-03	187	\N
1321	Will	Newman	Napastnik	2006-06-06	162	\N
1322	Robert	Kepler	Bramkarz	1990-01-29	197	\N
1323	Elizabeth	Waldo	Obrońca	1990-07-13	162	843919
1324	Janet	Ladaille	Bramkarz	2007-02-20	173	55612044
1325	Hank	Deleo	Napastnik	2001-04-09	161	39364149
1326	Jan	Boyer	Napastnik	2013-03-25	195	53319429
1327	Edward	Guyer	Napastnik	1997-10-01	166	3701680
1328	Rosa	Patricelli	Pomocnik	2000-12-28	167	66641436
1329	Cath	Brendjens	Pomocnik	1982-11-16	191	\N
1330	Talitha	Ionescu	Napastnik	2009-08-25	181	33244300
1331	Siem	Petrzelka	Pomocnik	2004-12-18	193	\N
1332	Bas	Thompson	Pomocnik	2015-11-01	162	\N
1333	John	Wood	Pomocnik	2020-01-07	170	64391768
1334	Willy	Sterrett	Bramkarz	1985-02-20	167	13928370
1335	Patricia	Hummel	Obrońca	1997-10-24	175	90339037
1336	Bram	Davis	Pomocnik	2007-05-08	169	\N
1337	Gill	Wolpert	Pomocnik	2008-05-30	190	33613641
1338	Ike	Pyland	Bramkarz	2010-03-30	165	31143529
1339	Dirk	Thompson	Pomocnik	1993-10-21	176	92241561
1340	Scott	Chwatal	Obrońca	2011-05-03	165	8299224
1341	Magnus	Weinstein	Obrońca	2001-02-02	165	40487493
1342	Susan	DeWald	Pomocnik	2012-05-17	197	67218503
1343	Krystyna	Uprovski	Napastnik	1996-05-19	190	49266758
1344	Ted	Nahay	Pomocnik	1982-10-30	177	\N
1345	Nate	Arden	Bramkarz	1980-12-07	199	82978725
1346	Camilla	Orcutt	Bramkarz	1992-09-12	179	14514318
1347	Rik	Massingill	Napastnik	1999-12-29	189	\N
1348	Al	Nithman	Pomocnik	2013-01-15	198	78883280
1349	Gabrielle	Koch	Bramkarz	1988-12-22	179	97522198
1350	Marieke	Ward\t	Pomocnik	2014-07-19	160	41561333
1351	Louise	Pyland	Pomocnik	2013-06-27	160	6784104
1352	Pauline	Waddell	Bramkarz	1990-03-13	172	\N
1353	Nate	Tudisco	Pomocnik	2009-06-02	170	99616480
1354	Bo	Bitmacs	Napastnik	1979-11-30	173	49672669
1355	Daniel	Moore	Bramkarz	2012-12-05	161	88584735
1356	Frederik	Watson	Pomocnik	1999-05-25	165	9460148
1357	Lisa	Guethlein	Bramkarz	1992-01-21	196	\N
1358	Fons	Imhoff	Bramkarz	2014-03-31	174	11663305
1359	Nico	Wood	Bramkarz	2019-09-18	198	44887139
1360	Kay	Toreau	Pomocnik	1982-01-14	164	8047550
1361	Joseph	Mitchell	Napastnik	1990-01-25	198	\N
1362	Daan	Lejarette	Bramkarz	2012-02-26	182	77669074
1363	Benjamin	Guethlein	Obrońca	2018-01-25	172	\N
1364	Marie	Matthew	Napastnik	2010-02-27	188	35502301
1365	Lotte	Nobles	Pomocnik	1989-11-21	194	74851974
1366	Trevor	Patricelli	Obrońca	1989-09-25	163	45232638
1367	Ross	Pearlman	Pomocnik	2016-08-03	196	42028583
1368	Dirk	Suszantor	Bramkarz	2019-08-17	199	47343280
1369	Teddy	Francis	Pomocnik	1993-11-02	167	56338561
1370	Tobias	Sakurai	Bramkarz	1992-07-02	170	38865322
1371	Mathilde	Pearlman	Pomocnik	1983-02-25	165	\N
1372	Sammy	Bertelson	Obrońca	1999-11-22	164	96495203
1373	Anna	Wilson	Napastnik	2017-03-14	190	\N
1374	Thelma	Stannard	Pomocnik	2011-07-05	200	35934894
1375	Samantha	Cragin	Obrońca	1979-08-01	197	33702733
1376	Lena	Bloom	Bramkarz	2007-05-17	163	90954106
1377	Will	Noteboom	Pomocnik	1987-02-11	170	78184894
1378	Tyler	Anderson	Napastnik	2002-11-02	196	\N
1379	Godfrey	Herrin	Bramkarz	1994-05-04	185	43986121
1380	Elizabeth	Mitchell	Napastnik	2012-08-13	172	24736628
1381	Femke	Bernstein	Napastnik	2015-06-08	191	\N
1382	Agnieszka	Bogdanovich	Pomocnik	1987-08-04	172	29999241
1383	Bob	King	Bramkarz	1996-02-10	162	38305796
1384	Madison	Nahay	Pomocnik	1977-12-01	190	24301052
1385	Giel	Moreau	Napastnik	2003-02-15	178	97155671
1386	Amber	Wood	Pomocnik	2002-05-07	191	77086712
1387	Jolanda	Uitergeest	Bramkarz	1993-04-17	193	60607250
1388	Paula	Muench	Napastnik	2014-04-04	167	53873084
1389	Pieter	Hummel	Obrońca	2008-11-01	189	\N
1390	Joey	Clark	Pomocnik	2002-11-16	196	31370924
1391	Annie	Turk	Bramkarz	2000-04-18	177	\N
1392	Gerrit	Braconi	Bramkarz	2017-07-03	200	10164815
1393	Lewis	Long	Pomocnik	1993-10-29	168	35608720
1394	Sjon	Cooper	Napastnik	1980-02-06	178	56642552
1395	Ulla	Mariojnisk	Napastnik	1975-10-28	173	\N
1396	Malgorzata	Gonzalez	Napastnik	1977-02-26	173	42218413
1397	Pawel	Mitchell	Bramkarz	2020-01-14	179	\N
1398	Katarzyna	Mairy	Obrońca	2013-03-20	165	44863079
1399	Jace	Bruno	Obrońca	2018-01-26	196	59082159
1400	Florian	Climent	Pomocnik	2001-05-18	168	\N
1401	Marie	Reyes	Pomocnik	1996-03-31	181	65422664
1402	Ellie	Miller	Pomocnik	2010-10-03	181	33266484
1403	Bram	Mulders	Napastnik	1980-08-23	192	37466804
1404	Katharina	Wood	Pomocnik	1982-07-26	164	571667
1405	Ricky	van Goes	Obrońca	2014-06-05	196	37133849
1406	Jamie	Koss	Bramkarz	2012-09-15	187	1068441
1407	David	Koch	Bramkarz	2006-07-10	183	\N
1408	Marie	Gaskins	Bramkarz	2001-05-29	164	18215460
1409	Amy	Bergdahl	Obrońca	1992-12-15	169	65006142
1410	Luka	Nelson	Obrońca	1989-09-09	176	17374544
1411	Ester	Daniel	Pomocnik	1988-08-29	182	81968057
1412	Rob	Moon	Pomocnik	1996-02-15	166	6491503
1413	Kim	Hopper	Napastnik	1990-06-06	195	92759129
1414	Gabbie	Nahay	Pomocnik	1978-10-15	188	74183568
1415	Ana	Thompson	Pomocnik	1989-03-16	169	22747838
1416	Zofia	Meterson	Pomocnik	2014-11-17	179	74929414
1417	Sally	Bugno	Bramkarz	1993-08-16	181	\N
1418	Tyler	Stevens	Bramkarz	1997-12-03	176	23298743
1419	Lucille	Stevenson	Pomocnik	2005-12-02	174	53699445
1420	Giel	Archer	Napastnik	2007-06-14	194	22202434
1421	Leah	Hopper	Pomocnik	1975-09-06	175	21926989
1422	Peter	Kellock	Bramkarz	1996-08-15	188	69113555
1423	Ashley	Ionescu	Bramkarz	1975-12-12	172	66126411
1424	Benjy	Wilson	Napastnik	2014-04-13	189	23286354
1425	Jozef	Emerson	Bramkarz	1982-06-13	191	86572152
1426	Sean	Green	Obrońca	1989-05-26	183	94585502
1427	Simon	Moon	Obrońca	1983-10-18	178	46410025
1428	Marie	Nadalin	Obrońca	1986-05-04	172	\N
1429	Cian	Green	Obrońca	2005-09-24	194	45082578
1430	Samuel	Hummel	Pomocnik	2014-03-27	195	69383993
1431	Stephanie	Guethlein	Pomocnik	1979-12-05	188	61370472
1432	Sergio	Ijukop	Obrońca	2005-12-17	165	627760
1433	Julie	Millikin	Pomocnik	1985-05-19	160	\N
1434	Ida	Wargula	Napastnik	2019-09-30	183	\N
1435	Hugo	Thaler	Pomocnik	2007-05-05	186	79229977
1436	Ben	Bogdanovich	Bramkarz	2019-06-27	190	43843473
1437	Hanna	Beckbau	Pomocnik	1975-08-11	196	98382012
1438	Lucy	Harness	Bramkarz	1992-09-25	189	\N
1439	Willy	Clark	Pomocnik	2000-04-11	184	77269270
1440	Lotte	Hoyt	Bramkarz	2007-12-31	193	\N
1441	Erik	Daughtery	Napastnik	1984-05-20	192	10666110
1442	Peter	Hancock	Bramkarz	2001-09-09	167	88522418
1443	Liam	Chapman	Napastnik	1982-07-03	193	8880497
1444	Martien	Chwatal	Pomocnik	2010-01-24	185	61512469
1445	Elin	Browne	Bramkarz	2013-02-23	160	55435825
1446	Rogier	Schmidt	Bramkarz	2002-04-02	194	94010696
1447	Ellie	Liddle	Bramkarz	2000-07-08	186	24153041
1448	Daan	McCrary	Napastnik	1987-01-29	183	32647386
1449	Ton	Brown	Obrońca	1995-10-23	179	14019864
1450	Cristian	Durso	Obrońca	2011-12-12	176	44133508
1451	Katharina	Matthew	Obrońca	2001-07-16	175	30668831
1452	Jace	Lawton	Napastnik	1994-11-18	197	91753287
1453	Charles	Mayberry	Pomocnik	1983-12-31	167	88961213
1454	John	Foreman	Obrońca	2002-09-30	168	84064654
1455	Netty	Queen	Obrońca	1989-12-03	174	78730202
1456	Tommy	Daughtery	Napastnik	2009-12-26	178	30795064
1457	Dirk	van Goes	Bramkarz	2007-05-03	166	36352952
1458	Ton	Mcnally	Pomocnik	1996-05-15	172	\N
1459	Alejandro	Poplock	Napastnik	1991-12-16	169	29498909
1460	Sammy	Hancock	Pomocnik	2003-04-20	173	48638217
1461	Krzysztof	Barbee	Bramkarz	1998-02-22	160	13638310
1462	Lucia	Swaine	Obrońca	1975-12-14	200	20048451
1463	Alice	Plantz	Pomocnik	1997-01-13	184	76638913
1464	Ike	Naff	Bramkarz	2001-09-23	183	60973848
1465	Jack	van Goes	Pomocnik	2005-06-24	193	31028882
1466	Gill	Morgan	Obrońca	1978-03-05	185	\N
1467	Joost	Makelaar	Obrońca	2009-09-06	173	23467745
1468	Michel	Rauch	Pomocnik	2015-04-21	177	61105731
1469	Albert	Storrs	Napastnik	2005-03-26	179	46277284
1470	Drew	Nefos	Napastnik	1987-10-28	189	69864010
1471	Camille	Mejia	Obrońca	1981-07-26	200	\N
1472	Ada	Linton	Pomocnik	1977-09-03	184	82725229
1473	Jeffery	Wicks	Napastnik	1987-02-08	165	\N
1474	Rik	Nobles	Bramkarz	1980-08-25	174	18179927
1475	Lucia	Overton	Napastnik	2002-01-20	166	84695702
1476	Hiram	Schmidt	Pomocnik	1998-05-09	164	54841289
1477	Jonas	Ahlgren	Bramkarz	2006-09-08	200	67205548
1478	Chris	Braconi	Bramkarz	2017-01-16	172	47653104
1479	Peggy	Weinstein	Obrońca	2005-10-25	199	59433997
1480	Pedro	Huston	Pomocnik	2013-09-12	183	42805542
1481	Dick	Knopp	Bramkarz	2001-12-31	184	78626498
1482	Wilma	Zapetis	Napastnik	2009-10-26	176	30655385
1483	Marco	Kellock	Obrońca	2004-09-15	182	13255786
1484	Bob	Pierce	Obrońca	1994-12-18	188	24444965
1485	Jean	Jenssen	Napastnik	2010-12-25	164	85190976
1486	Duncan	Morton	Obrońca	2012-07-14	178	82148063
1487	Saskia	Scheffold	Pomocnik	2015-10-02	184	\N
1488	Kim	Sanders	Pomocnik	1976-07-12	176	94154336
1489	Pete	Poole	Obrońca	1981-06-11	198	\N
1490	Kim	Mcgrew	Napastnik	2019-05-10	188	97896931
1491	Femke	Paul	Bramkarz	1987-03-03	200	\N
1492	Luca	Petterson	Bramkarz	1992-06-17	193	11388625
1493	Sjef	Stockton	Napastnik	1980-12-31	193	37432992
1494	Truus	Huston	Obrońca	1997-09-27	167	\N
1495	Elizabeth	Chapman	Obrońca	1979-09-16	170	\N
1496	Gillian	Dulisse	Obrońca	1988-10-23	186	49970135
1497	Laura	Hoogbandt	Bramkarz	1998-09-19	183	7457492
1498	Manuel	Walker	Obrońca	2007-09-19	193	99884786
1499	Kimmy	Freeman	Obrońca	1996-10-01	165	49484377
1500	Olivia	Brisco	Obrońca	1979-07-08	187	16716478
1501	Lucas	Poole	Bramkarz	2015-11-20	162	\N
1502	Jeffery	Boyer	Bramkarz	1996-05-22	161	31823968
1503	Jules	Brylle	Napastnik	2001-11-12	175	57857652
1504	Jace	Lee	Obrońca	2017-11-23	174	84982105
1505	Gert	Blacher	Obrońca	2004-07-23	186	59099722
1506	Niklas	Trainor	Obrońca	2001-04-21	161	35090197
1507	Sjon	Paul	Napastnik	1986-10-03	196	67380377
1508	Jesse	Linhart	Napastnik	2017-12-14	188	82088018
1509	Dorothy	Knight	Napastnik	1979-11-01	184	81856474
1510	Sue	Makelaar	Obrońca	1975-08-24	195	28805917
1511	David	Korkovski	Napastnik	1988-10-11	162	4874201
1512	Isabel	Harder	Napastnik	1996-08-14	192	\N
1513	Steven	McCrary	Obrońca	2005-11-28	194	28372752
1514	Leontien	Daniel	Bramkarz	2010-12-07	170	\N
1515	Lu	Bryant	Bramkarz	2009-05-09	187	11414354
1516	Siska	Van Dinter	Obrońca	2004-07-30	174	77917728
1517	Bess	Royal	Napastnik	1998-05-13	175	\N
1518	Robert	Archer	Pomocnik	1986-10-18	163	\N
1519	Ryan	King	Bramkarz	1985-11-14	163	\N
1520	Simon	Raines	Obrońca	2017-10-24	171	\N
1521	Hanna	Nefos	Bramkarz	1977-03-31	167	16066987
1522	Maja	Wooten	Napastnik	2000-07-30	177	46774814
1523	Lars	Caouette	Napastnik	1995-04-25	192	27864403
1524	Peter	Nobles	Napastnik	2003-06-23	187	54979535
1525	Vincent	Brylle	Bramkarz	1977-12-06	193	\N
1526	Jordy	Riegel	Napastnik	1978-09-28	199	50585596
1527	Ida	Knight	Pomocnik	2019-06-04	189	47979952
1528	Michel	Stockton	Napastnik	2010-03-03	175	93288766
1529	Camille	Heyn	Obrońca	2016-09-12	169	3831742
1530	Lea	Otto	Pomocnik	1986-12-31	186	\N
1531	Leon	Frega	Pomocnik	1985-05-05	196	5649432
1532	Cees	Sterrett	Obrońca	1980-12-20	196	\N
1533	Lizzy	Guethlein	Napastnik	2008-07-04	165	\N
1534	Pauline	Hulshof	Napastnik	2012-02-20	166	49528760
1535	Pablo	Laudanski	Bramkarz	2002-01-01	170	67081744
1536	Jace	Arcadi	Pomocnik	2005-02-13	194	69787682
1537	Luis	Sharp	Bramkarz	1992-05-27	183	57523562
1538	Shermie	Bugno	Napastnik	1987-06-27	181	\N
1539	Philip	Donatelli	Obrońca	1999-04-19	185	21990417
1540	Mick	Nelson	Obrońca	2011-12-03	164	89025942
1541	Anton	Guyer	Bramkarz	1992-08-05	166	54294293
1542	Taylor	Mejia	Obrońca	1995-01-08	170	15473854
1543	Edwin	Jones	Bramkarz	1991-07-29	191	\N
1544	Jessica	King	Bramkarz	1979-02-07	199	52275610
1545	Dorothy	Sharp	Pomocnik	2016-02-05	186	33048308
1546	Maaike	Toler	Napastnik	2019-07-16	168	23940867
1547	Sam	Ijukop	Bramkarz	2001-02-14	187	\N
1548	Sally	Zurich	Pomocnik	1992-02-01	196	\N
1549	Babet	Novratni	Obrońca	1998-12-17	161	64524709
1550	Jim	Chwatal	Bramkarz	1998-09-17	199	22317345
1551	Mikkel	Chapman	Napastnik	2015-02-11	185	82613344
1552	Dave	Hamilton	Bramkarz	2017-11-19	186	3781555
1553	Betty	Hardoon	Pomocnik	1992-08-25	169	28771679
1554	Chris	Schlee	Obrońca	2018-04-04	174	65557480
1555	Tonnie	Vostreys	Pomocnik	2010-04-30	171	95131750
1556	Christopher	Wood	Napastnik	2014-06-28	199	54719737
1557	Hanna	Willis	Obrońca	1986-04-16	195	\N
1558	Michael	Ostanik	Obrońca	2015-12-06	162	38055729
1559	Bill	Lawton	Obrońca	2005-10-15	171	\N
1560	Mary	Stevenson	Pomocnik	1996-11-01	160	\N
1561	Dirk	Nahay	Pomocnik	1986-05-28	200	7801391
1562	Ciara	Nithman	Bramkarz	2014-02-19	176	12856919
1563	Joost	Gunter	Obrońca	1996-10-25	192	23959654
1564	Mathias	Menovosa	Bramkarz	2016-07-12	180	17395662
1565	Isabelle	Kellock	Napastnik	1994-07-03	194	12052322
1566	Rich	Markovi	Napastnik	1993-12-19	184	13470431
1567	Jeffery	Waddell	Bramkarz	2015-01-28	170	17174770
1568	Jill	Helfrich	Pomocnik	2017-05-30	192	2888658
1569	Hanna	Helfrich	Pomocnik	1987-09-28	168	\N
1570	Marty	Lawton	Napastnik	1980-01-23	169	15002067
1571	Mary	Waldo	Pomocnik	2012-08-25	178	47764238
1572	Alice	Bernstein	Pomocnik	2003-12-20	168	64379005
1573	Jessica	Anderson	Napastnik	2007-12-18	162	10893014
1574	Mart	Petrzelka	Pomocnik	1992-11-08	187	\N
1575	Victor	Richter	Obrońca	2001-09-14	160	21758174
1576	Ellie	Friedman	Napastnik	2011-09-15	164	87180325
1577	Edward	Freed	Napastnik	1982-01-01	187	91462789
1578	Peg	Daughtery	Pomocnik	1997-05-25	189	\N
1579	Leah	DeBerg	Pomocnik	1989-06-25	163	5249034
1580	Rick	Thompson	Bramkarz	1988-07-11	167	89729695
1581	Barbara	Gunter	Bramkarz	2018-11-08	167	17419403
1582	Jace	Clarke	Napastnik	2010-02-02	160	96243641
1583	Peggy	Freed	Pomocnik	1976-04-14	163	\N
1584	Freja	Slemp	Napastnik	1985-12-08	197	24913800
1585	Florian	Lawton	Napastnik	1978-11-27	163	48392839
1586	Hiram	Chapman	Napastnik	1976-08-04	178	4214516
1587	Edwyn	Gonzalez	Obrońca	1998-09-15	179	\N
1588	Pablo	Gerschkow	Napastnik	1977-03-12	169	4645009
1589	Camille	Orcutt	Pomocnik	1981-12-07	179	21550844
1590	Matthew	Wood	Bramkarz	2012-12-28	170	65273480
1591	Emily	Arnold	Napastnik	1985-04-10	199	\N
1592	Bill	Archer	Pomocnik	1993-02-28	185	24674721
1593	Joey	Symms	Pomocnik	2019-10-22	176	\N
1594	Babet	Nefos	Napastnik	2011-04-25	183	\N
1595	Rasmus	Press	Napastnik	2007-09-04	196	34881731
1596	Katarzyna	van der Laar	Obrońca	2015-05-17	174	31369228
1597	Elizabeth	Malone	Obrońca	1992-07-02	177	23719598
1598	Sem	Williams	Napastnik	2009-03-28	165	66984830
1599	Toon	Slemp	Pomocnik	2002-03-13	170	28337016
1600	Georgina	Brennan	Pomocnik	2007-09-09	167	\N
1601	Sarah	Ratliff	Obrońca	1988-05-04	175	87044353
1602	Luca	Kuehn	Bramkarz	2003-04-12	181	32185548
1603	Joshua	Davis	Bramkarz	1977-05-22	182	31643839
1604	Lucas	Bergdahl	Bramkarz	1999-08-31	177	7056348
1605	Jill	Hendrix	Pomocnik	1989-02-09	199	94063309
1606	Jane	Carlos	Bramkarz	2010-05-14	168	27947293
1607	Alexis	Uitergeest	Obrońca	2003-02-18	160	55245006
1608	Rachael	Lawton	Obrońca	1995-09-15	189	921424
1609	Viktor	Foreman	Bramkarz	2005-03-02	182	28063739
1610	Cameron	Trainor	Bramkarz	1991-02-07	168	33362128
1611	Bram	Lawton	Pomocnik	1989-11-03	173	36717637
1612	Nicky	van Goes	Obrońca	2012-08-25	166	98897288
1613	Gillian	Zimmerman	Bramkarz	1982-04-13	173	10426888
1614	Helma	Daughtery	Napastnik	1980-05-03	163	32370342
1615	Caroline	Hollman	Obrońca	1990-11-25	196	82588750
1616	Ainhoa	Davis	Napastnik	2019-05-11	182	81223443
1617	Ryan	Polti	Napastnik	1987-01-06	161	30937752
1618	Herman	Newman	Pomocnik	1985-10-26	165	39087423
1619	Karin	Hoyt	Obrońca	2009-01-05	163	36877753
1620	Ed	Spensley	Napastnik	2000-11-09	160	26201209
1621	Nick	Brendjens	Napastnik	2008-02-16	165	14625002
1622	Camilla	Zimmerman	Napastnik	1997-06-27	169	77197166
1623	Marcin	Nelson	Obrońca	2018-07-05	173	\N
1624	Henk	Gibson	Napastnik	2011-03-05	185	65626172
1625	Kayleigh	Novratni	Bramkarz	1975-06-23	193	78141035
1626	Ross	Gerschkow	Pomocnik	1985-07-18	178	8665653
1627	Klaas	Francis	Napastnik	2000-09-12	193	11706443
1628	Lu	Lezniak	Bramkarz	2018-06-17	177	77269509
1629	Martina	Emerson	Obrońca	1983-06-27	187	40182772
1630	Sjanie	Green	Napastnik	1990-08-18	169	72367138
1631	Ida	DelRosso	Napastnik	1983-08-16	195	63163952
1632	Sue	Clarke	Bramkarz	1977-03-17	191	5576429
1633	Lena	Uitergeest	Napastnik	2018-03-31	166	96574129
1634	Kaylee	van Doorn	Obrońca	1996-06-10	181	7284582
1635	Ana	Wood	Bramkarz	2004-06-27	162	18816379
1636	Steph	Bryant	Pomocnik	2008-11-24	190	71507748
1637	Frederik	Brennan	Bramkarz	1979-08-29	181	19001080
1638	Juana	Weaver	Bramkarz	1997-03-16	175	\N
1639	Alexis	Jiminez	Napastnik	1993-09-26	182	87278705
1640	Sjon	Oyler	Pomocnik	1999-03-13	194	22835239
1641	Cathy	Dittrich	Napastnik	2007-12-29	166	64355781
1642	Tomasz	Lamere	Obrońca	1984-08-08	168	41158574
1643	Claudia	Pekagnan	Obrońca	2007-01-08	188	\N
1644	Bob	Wood	Pomocnik	1985-05-11	172	14694893
1645	Julian	Jiminez	Napastnik	1986-11-20	177	82731692
1646	Linnea	Mitchell	Bramkarz	1996-11-28	193	\N
1647	Lisa	Shapiro	Pomocnik	1980-12-15	197	1776113
1648	Catharine	Mitchell	Napastnik	2001-04-02	160	\N
1649	Harry	Uitergeest	Obrońca	2006-03-27	196	\N
1650	Hannah	Jessen	Bramkarz	2012-04-24	171	36565720
1651	Ricky	DeBerg	Bramkarz	2009-07-12	178	\N
1713	Ollie	Lamere	Pomocnik	1999-10-10	196	26644724
1714	Manuel	Hollman	Pomocnik	1995-05-28	193	\N
1715	Vanessa	Overton	Pomocnik	1992-03-21	195	\N
1716	Philippa	Sterrett	Bramkarz	1981-01-16	173	\N
1717	Charlie	Mcnally	Pomocnik	2009-09-13	199	89831230
1718	Carla	Poissant	Bramkarz	2004-08-28	188	69708459
1719	Thelma	Thompson	Pomocnik	2001-11-03	198	\N
1720	Jim	Troher	Obrońca	1979-12-03	160	\N
1721	Sjef	Nahay	Pomocnik	1998-05-02	161	32978208
1722	Harry	Polti	Napastnik	1976-02-07	163	67885615
1723	Victor	Stevenson	Obrońca	1983-04-20	164	5124545
1724	Lisa	Botsik	Bramkarz	1995-02-10	189	\N
1725	Jurre	Gieske	Napastnik	1979-05-08	173	31606660
1726	Rachel	Matthew	Obrońca	2002-03-29	167	23855940
1727	Ana	King	Napastnik	2006-03-30	191	70625015
1728	Chuck	Clarke	Bramkarz	2009-08-09	176	18786157
1729	Babette	Williamson	Napastnik	2007-09-03	186	56955519
1730	Toon	Pekaban	Bramkarz	1989-04-09	176	\N
1731	Lizzy	Wong	Bramkarz	1993-07-31	199	84905810
1732	Jack	Bugno	Pomocnik	2012-05-23	186	\N
1733	Co	Igolavski	Obrońca	2012-01-11	177	42028449
1734	Diego	van Goes	Napastnik	2017-09-01	187	5260923
1735	Karen	Hankins	Pomocnik	1981-07-24	163	93942538
1736	Peg	Thompson	Napastnik	2017-09-10	169	18128063
1737	Sherm	Deleo	Pomocnik	1975-07-14	162	20921601
1738	Pawel	Naley	Obrońca	1997-04-15	180	44354580
1739	Oscar	Whitehurst	Obrońca	1985-01-26	185	\N
1740	Pauline	Perilloux	Obrońca	2003-10-13	197	17256542
1741	Louise	Hulshof	Napastnik	1989-04-17	171	43763351
1742	Kim	Weinstein	Obrońca	1985-12-10	163	5739114
1743	Scott	Miller	Napastnik	1984-08-20	182	\N
1744	Zofia	Aldritch	Napastnik	2014-06-24	170	83267114
1745	Kees	Rivers	Pomocnik	2012-04-01	190	\N
1746	Marta	Nadalin	Bramkarz	1996-12-30	191	7338664
1747	Joanne	Hankins	Pomocnik	1992-06-21	177	21876439
1748	Ana	Crocetti	Pomocnik	1989-12-21	193	94053284
1749	Martin	Cohen	Napastnik	1990-12-09	173	87988553
1750	Andrea	Millis	Obrońca	1980-12-25	167	12391740
1751	Ron	Leonarda	Bramkarz	1999-07-29	186	80596895
1752	Sjon	Lawton	Bramkarz	2000-01-23	163	\N
1753	Cristina	Hancock	Napastnik	1987-06-10	192	62064119
1754	Olivia	DeBuck	Bramkarz	1992-12-07	189	4091863
1755	Erin	Moore	Obrońca	2004-08-20	177	25250477
1756	Margarita	Cross	Obrońca	1984-07-01	164	71082566
1757	Jan	Huston	Obrońca	2010-01-20	163	7060783
1758	Sean	Pearlman	Bramkarz	1997-05-07	197	26031934
1759	Tomas	Poplock	Pomocnik	2014-07-02	177	38522785
1760	Janet	Martin	Pomocnik	2019-08-13	195	922105
1761	Trevor	Crocetti	Bramkarz	2006-07-18	178	29148932
1762	Siem	Massingill	Bramkarz	1981-09-10	188	78765780
1763	Nate	Daley	Napastnik	2005-08-25	174	29015112
1764	Stephen	Walker	Napastnik	1998-10-20	165	87012831
1765	Conor	Wolpert	Bramkarz	2003-10-09	171	42313505
1766	Joanne	McDaniel	Napastnik	1992-10-28	199	20732742
1767	Martien	Stockton	Bramkarz	1993-12-20	188	13217890
1768	Theodore	Thaler	Napastnik	1992-08-11	168	59136703
1769	Alejandro	Rauch	Obrońca	1990-06-12	199	\N
1770	Iris	Braconi	Pomocnik	1977-12-16	182	46875843
1771	Cristina	Rauch	Pomocnik	1996-06-11	178	54508524
1772	Betty	Crocetti	Pomocnik	2015-09-04	166	63519767
1773	Camilla	Herring	Napastnik	2017-04-13	168	\N
1774	Teun	Durso	Obrońca	1984-09-18	187	28883319
1775	Ashley	Wilson	Napastnik	1982-01-22	174	63941203
1776	Koos	Browne	Obrońca	2002-05-29	181	\N
1777	Zofia	Deleo	Pomocnik	1988-07-23	169	\N
1778	Edwina	Millikin	Obrońca	2007-10-23	162	60796453
1779	Pedro	Spensley	Obrońca	2011-08-19	178	80583954
1780	Anna	Green	Bramkarz	1994-10-12	180	23944272
1781	Tobias	DeBerg	Obrońca	1976-12-07	194	41003129
1782	Jace	Nahay	Obrońca	1995-11-28	190	65921835
1783	Alejandro	Wood	Pomocnik	1975-09-01	165	84623068
1784	Nate	van Dijk	Obrońca	1987-10-09	179	37286490
1785	Ainhoa	Fox	Pomocnik	1991-04-28	187	\N
1786	Willy	Orcutt	Napastnik	1988-10-07	185	\N
1787	Scott	Aldritch	Pomocnik	1980-10-31	162	58916798
1788	Ciara	Huston	Bramkarz	2014-12-04	199	35701703
1789	Al	Francis	Obrońca	1976-03-18	190	81584527
1790	Ester	Harder	Pomocnik	1995-04-01	192	\N
1791	Trevor	Morton	Obrońca	1976-11-13	187	\N
1792	Conor	Freed	Bramkarz	1984-02-23	196	3853717
1793	Sherm	Massingill	Pomocnik	2010-10-11	198	41955060
1794	Megan	Waddell	Napastnik	2015-06-04	171	67797562
1795	Claudia	Slemp	Pomocnik	2007-10-04	166	40749796
1796	Steve	Van Toorenbeek	Pomocnik	1987-10-10	186	359130
1797	Sjon	Alspaugh	Bramkarz	1990-02-01	184	86815071
1798	Sjef	Trainor	Bramkarz	2003-03-26	163	93129095
1799	Aoife	Langham	Obrońca	1980-04-04	175	57523280
1800	Gabbie	Koss	Pomocnik	2014-01-29	187	51594625
1801	Stephen	Guethlein	Bramkarz	2015-08-09	194	\N
1802	Linnea	Polti	Obrońca	1991-07-15	165	\N
1803	Dick	Ostanik	Bramkarz	1992-01-10	172	83560562
1804	Mike	Ward\t	Bramkarz	2012-06-28	191	31666998
1805	Herman	Boyer	Pomocnik	1981-06-01	170	83418146
1806	Elzbieta	Daley	Pomocnik	1994-12-12	187	94667606
1807	Iris	Wood	Obrońca	1984-12-14	186	51255734
1808	Lucy	Igolavski	Napastnik	1993-08-05	186	20599911
1809	Megan	Heyn	Pomocnik	1990-12-26	196	93889947
1810	Margaret	Ionescu	Napastnik	2004-06-27	175	89607091
1811	Co	Williamson	Napastnik	2007-04-22	192	29662759
1812	Linnea	Pekagnan	Obrońca	1999-05-17	170	34754121
1813	Maggie	Anderson	Pomocnik	2000-03-28	181	14637356
1814	Giel	DeBuck	Pomocnik	1991-03-06	186	\N
1815	Joanne	Plantz	Napastnik	2016-08-27	178	25721575
1816	Dylan	Trainor	Bramkarz	1994-04-07	185	44456214
1817	Agnieszka	Mitchell	Obrońca	1997-07-30	171	9130403
1818	Peg	Millis	Napastnik	2003-05-29	200	40433734
1819	Tara	Imhoff	Pomocnik	1979-04-04	182	88071416
1820	Teddy	Arcadi	Pomocnik	1994-05-27	187	74673935
1821	Cristina	Visentini	Pomocnik	2009-12-19	177	64129934
1822	Babette	Pengilly	Pomocnik	1990-12-08	198	79216969
1823	Mathilde	Allison	Pomocnik	2003-08-09	179	\N
1824	Jo	DeWald	Bramkarz	1988-03-19	184	7924872
1825	Jo	Laudanski	Obrońca	1981-02-08	197	66609369
1826	Katarzyna	Wolpert	Bramkarz	1986-02-01	168	77717376
1827	Stephen	Whitehurst	Bramkarz	2004-04-27	191	21342351
1828	Tom	Muench	Napastnik	1991-04-19	192	59072834
1829	Rachel	Byrnes	Napastnik	2015-10-02	194	9050196
1830	Daan	Weinstein	Pomocnik	2010-12-25	175	85938329
1831	Shermie	Tudisco	Obrońca	1986-07-11	183	63779894
1832	Nicolas	Wood	Obrońca	1993-07-29	190	15320666
1833	Cecilie	Nobles	Bramkarz	2006-08-17	173	16688203
1834	Kees	Helfrich	Napastnik	1984-04-27	196	23876188
1835	Emil	Deans	Napastnik	1998-09-20	194	93011399
1836	Tommy	Wicks	Bramkarz	2000-01-19	174	12889850
1837	Andy	Goodnight	Obrońca	2000-12-01	182	\N
1838	Benjamin	Frega	Bramkarz	1977-01-26	180	\N
1839	Jaclyn	Robertson	Napastnik	1987-09-03	170	15481564
1840	Erik	Hollman	Bramkarz	2017-12-03	192	8897866
1841	Camille	Helbush	Napastnik	2019-12-14	175	98020737
1842	Chuck	Comeau	Pomocnik	1996-04-24	171	4868791
1843	Adrian	Vanderoever	Napastnik	1994-05-10	170	13018470
1844	Chloe	Hulshof	Pomocnik	1997-04-24	175	\N
1845	Sammy	Barbee	Pomocnik	1985-12-12	177	\N
1846	Pawel	Thompson	Napastnik	1987-05-27	197	6183253
1847	Stephen	Huffsmitt	Obrońca	1980-01-03	199	\N
1848	Sanne	Bernstein	Bramkarz	1975-02-20	186	9818423
1849	Thomas	Framus	Bramkarz	2018-05-24	161	\N
1850	Catherine	Long	Bramkarz	1999-07-20	192	\N
1851	Rik	DeBuck	Pomocnik	2005-07-21	190	15794052
1852	Mario	Morton	Bramkarz	1990-03-03	166	\N
1853	Peter	Williams	Pomocnik	1988-08-17	181	9108580
1854	Samantha	Otto	Obrońca	1976-05-18	173	38644046
1855	Lotte	Aldritch	Obrońca	1978-01-04	193	34018230
1856	Janet	Chwatal	Pomocnik	1979-02-18	178	92927288
1857	Siska	Reames	Napastnik	2005-11-13	178	50854395
1858	Isabel	Gieske	Napastnik	2011-02-09	184	41833431
1859	Sue	Watson	Napastnik	2016-12-06	182	\N
1860	Katharina	Goodnight	Napastnik	2018-05-23	173	65086029
1861	Ben	Comeau	Bramkarz	2014-11-30	193	36110512
1862	Jules	Morton	Bramkarz	2014-03-13	179	55723018
1863	Helma	Stewart	Napastnik	1992-03-15	161	32037304
1864	Hank	Toler	Obrońca	2006-02-04	176	17400453
1865	Jessica	Turk	Obrońca	1992-08-04	174	46416218
1866	Martien	Zia	Obrońca	2016-02-09	160	16491998
1867	Ike	Blount	Bramkarz	2019-03-13	172	74809727
1868	Frederik	Seibel	Pomocnik	2005-10-10	162	\N
1869	Lea	Jones	Obrońca	1980-10-03	165	41774818
1870	Sergio	Chwatal	Pomocnik	1981-09-05	196	\N
1871	Erik	Weinstein	Pomocnik	2013-05-06	160	14687726
1872	Christopher	Little	Pomocnik	1998-07-08	165	7184738
1873	Willy	Millikin	Bramkarz	2001-03-31	180	54500191
1874	Pip	Lee	Napastnik	1981-03-27	177	61939016
1875	Caroline	Allison	Bramkarz	2015-09-23	194	54087969
1876	Victor	Wesolowski	Obrońca	2006-10-14	177	42937004
1877	Hugo	Wargula	Bramkarz	1991-08-10	160	73104427
1878	Godfrey	Nahay	Obrońca	2015-09-28	185	60663409
1879	Mario	Arcadi	Pomocnik	2014-10-08	163	41421628
1880	Hiram	Raines	Pomocnik	1986-08-18	174	34898174
1881	Margarita	Gibson	Napastnik	1994-11-14	163	60661722
1882	John	Seibel	Pomocnik	2017-04-22	189	\N
1883	Petra	Herring	Napastnik	2002-06-25	163	93502428
1884	Maggie	Vostreys	Obrońca	1999-01-11	198	\N
1885	Jose	Pearlman	Obrońca	1975-01-11	199	84923034
1886	Richard	Clarke	Obrońca	1984-03-11	182	64399546
1887	Dylan	Mulders	Obrońca	2009-10-30	185	48854462
1888	Tony	Patricelli	Napastnik	2017-11-17	185	\N
1889	Nicky	LeGrand	Obrońca	2009-02-25	187	36656645
1890	Camille	Watson	Napastnik	2011-05-08	169	40645605
1891	Nate	Mairy	Obrońca	2018-11-22	180	96881823
1892	Teddy	Uitergeest	Bramkarz	1990-04-09	173	39529737
1893	Gert	Moore	Pomocnik	2005-07-16	189	55061829
1894	Fons	Angarano	Napastnik	1993-04-15	184	90311378
1895	Joseph	Bruno	Napastnik	1987-08-03	190	59187177
1896	Rachel	Cragin	Obrońca	1988-03-16	193	75080557
1897	Klara	Boyer	Napastnik	1986-10-08	178	99906472
1898	Jorge	Buchholz	Obrońca	1998-07-08	192	6430855
1899	Tommy	Van Toorenbeek	Pomocnik	2004-07-26	190	\N
1900	Pawel	Kuehn	Pomocnik	1987-05-31	164	97079664
1901	Tommy	Goodnight	Napastnik	1999-02-16	188	87446417
1902	Maximilian	McDaniel	Napastnik	1975-03-24	179	93938780
1903	Kayleigh	Cramer	Obrońca	1994-12-10	168	\N
1904	Lea	Anthony	Napastnik	1975-06-06	170	\N
1905	Georgina	Helfrich	Obrońca	2009-12-07	192	85896331
1906	Patricia	Cantere	Bramkarz	1976-08-16	189	5461217
1907	Hugo	Trainor	Pomocnik	1994-05-12	191	\N
1908	Paula	Manson	Pomocnik	2000-09-03	187	97606011
1909	Martin	Grote	Pomocnik	2011-12-11	183	\N
1910	Chuck	Stockton	Napastnik	2003-06-01	182	52520349
1911	Malgorzata	Barbee	Pomocnik	1977-05-22	198	49332006
1912	Ryan	Williamson	Napastnik	1976-04-22	164	53060010
1913	Joey	Deleo	Pomocnik	1992-04-01	184	76157946
1914	Al	Lee	Bramkarz	2006-08-17	164	72390510
1915	Ted	Friedman	Bramkarz	2009-01-01	191	\N
1916	Max	Deans	Bramkarz	1984-09-28	166	42114873
1917	Christa	Ostanik	Pomocnik	2005-03-20	176	46672035
1918	Christopher	Comeau	Obrońca	1990-02-11	193	81554036
1919	Liza	Cramer	Pomocnik	1983-01-19	173	87613886
1920	Leon	White	Obrońca	1976-04-09	166	22462711
1921	Nicky	Braconi	Bramkarz	1975-03-29	173	85765809
1922	Maggie	Katsekes	Pomocnik	1989-01-12	198	\N
1923	Zofia	Spensley	Napastnik	1981-09-12	195	\N
1924	Chuck	Thompson	Obrońca	2003-02-21	173	78102993
1925	Bram	Millikin	Bramkarz	2009-03-05	167	19256505
1926	Ryan	Petterson	Napastnik	1994-02-17	166	51740114
1927	Maaike	Cain	Napastnik	2005-08-18	174	\N
1928	Ben	Mayberry	Pomocnik	1983-09-19	174	\N
1929	Paula	Paddock	Napastnik	1987-02-06	161	63851164
1930	Laura	Sakurai	Obrońca	1997-02-16	198	60150447
1931	Pauline	Fox	Obrońca	2013-08-06	194	\N
1932	Nienke	Keller	Obrońca	1981-07-25	187	95077002
1933	Joseph	Bloom	Napastnik	1975-05-17	198	81546915
1934	Richard	Brylle	Bramkarz	1975-05-10	172	36339221
1935	Trevor	Bernstein	Bramkarz	2000-03-20	170	33801407
1936	Patty	Pierce	Napastnik	1995-11-28	182	73289181
1937	Tommy	Franklin	Napastnik	1978-09-23	171	56629197
1938	Alexander	Toler	Pomocnik	1994-09-04	189	29883115
1939	Rasmus	Mairy	Napastnik	1982-07-14	193	92356528
1940	Ike	Suszantor	Bramkarz	2008-06-01	187	29293593
1941	Nathan	Trainor	Pomocnik	2015-07-27	181	10423066
1942	Leo	Miller	Pomocnik	1996-04-22	160	9355243
1943	Sherm	Cain	Bramkarz	1998-12-05	179	64451811
1944	Ike	Uitergeest	Napastnik	2019-01-23	194	43928683
1945	Callum	Wilson	Pomocnik	2000-09-12	199	\N
1946	Julie	Byrnes	Bramkarz	2018-09-28	163	10570738
1947	Marcin	van Dijk	Obrońca	2014-12-11	176	29993856
1948	Ben	Willis	Bramkarz	1985-01-02	196	71092386
1949	Ester	Hulshof	Napastnik	2015-02-21	185	20239893
1950	Rosa	Plantz	Pomocnik	1983-06-15	168	39719997
1951	Harry	Warner	Pomocnik	1988-07-30	196	\N
1952	Steven	Jones	Obrońca	2013-12-15	182	13905395
1953	Talita	Davis	Napastnik	1977-01-09	194	36899688
1954	Ada	Cooper	Obrońca	2019-04-20	184	77431805
1955	Jane	Helbush	Pomocnik	2012-11-06	185	97376336
1956	Cees	Brisco	Pomocnik	2001-11-20	176	9820513
1957	Tim	White	Bramkarz	2012-04-02	168	56779637
1958	Madison	Buchholz	Obrońca	1985-06-14	177	54552718
1959	James	Turk	Bramkarz	1990-09-05	179	678929
1960	Sue	Bugno	Obrońca	1991-07-29	173	88649277
1961	Margaret	Lannigham	Bramkarz	1976-09-05	197	43421487
1962	Juana	Griffioen	Napastnik	1984-08-26	200	48119880
1963	Isaac	Sakurai	Pomocnik	1993-11-04	199	96462731
1964	Cathy	Sharp	Pomocnik	2000-09-17	187	69899859
1965	Thelma	Lannigham	Pomocnik	2004-07-09	166	39254273
1966	Isabelle	van der Laar	Pomocnik	2003-08-10	179	97960480
1967	George	Morton	Obrońca	1975-09-15	193	51242512
1968	Georgina	Matthew	Bramkarz	1983-10-30	194	90779104
1969	Bo	Kuehn	Napastnik	1997-06-12	163	10259963
1970	Gill	Caffray	Pomocnik	1983-09-14	181	\N
1971	Sophie	Chwatal	Napastnik	2010-10-04	192	37092153
1972	Nerea	Martin	Pomocnik	1991-12-17	178	12800433
1973	Sam	Schmidt	Obrońca	2001-09-27	173	\N
1974	Gerrit	Bertelson	Obrońca	2007-07-02	192	89672745
1975	Agnieszka	Kepler	Napastnik	2006-05-16	176	39524636
1976	Izzy	Wesolowski	Pomocnik	2012-07-11	179	28177879
1977	Eleanor	Crocetti	Pomocnik	1998-08-10	178	96974443
1978	GertJan	Naff	Pomocnik	1978-10-15	187	\N
1979	Jules	Noteboom	Pomocnik	1994-03-05	196	27036026
1980	Theo	Freeman	Pomocnik	2019-10-05	164	4909626
1981	Izzy	Durso	Pomocnik	1976-07-01	199	40640054
1982	Daniel	Forsberg	Obrońca	1977-10-03	170	\N
1983	Rik	Kellock	Bramkarz	2003-12-24	174	68482791
1984	Peter	Wood	Obrońca	1978-07-22	187	41150272
1985	Jan	Bryant	Pomocnik	2017-04-05	184	86703700
1986	John	Slemp	Pomocnik	1981-10-06	192	\N
1987	Mary	Comeau	Bramkarz	1992-05-28	200	78031789
1988	Al	Archer	Napastnik	1976-01-11	166	92191685
1989	Jonas	Seibel	Obrońca	1995-01-07	187	89402809
1990	Stanislaw	Storrs	Obrońca	2008-11-16	165	20971609
1991	Pablo	DeBerg	Napastnik	2013-06-04	197	69956037
1992	Trevor	Pickering	Bramkarz	1975-12-14	192	49310123
1993	Janet	Poissant	Napastnik	2008-10-22	196	3019017
1994	Francisco	Baltec	Bramkarz	2008-10-20	164	42641096
1995	Erik	Sakurai	Napastnik	2005-01-09	171	10486690
1996	Willy	Conley	Obrońca	1989-03-29	172	11966899
1997	Pieter	Huffsmitt	Pomocnik	2010-05-06	199	8283462
1998	Vincent	Haynes	Napastnik	2008-07-28	191	\N
1999	Edwyn	Mairy	Obrońca	1995-11-02	181	\N
2000	Jody	Naley	Napastnik	2008-04-25	185	67667064
2001	Herb	Richter	Obrońca	1992-09-20	183	94900424
2002	Georgina	Lawton	Obrońca	1984-07-05	194	6034778
2003	Georgina	Cain	Bramkarz	2020-01-14	197	76484120
2004	Emily	Bright	Bramkarz	1989-07-30	190	21056545
2005	Maaike	Wargula	Napastnik	2002-03-04	184	\N
2006	Fons	Love	Obrońca	2010-11-07	194	17137444
2007	Paul	Roche	Napastnik	2008-02-15	180	91995779
2008	Klara	Framus	Obrońca	1986-03-10	200	\N
2009	Claudia	Slater	Pomocnik	1988-10-21	182	\N
2010	Tobias	Korkovski	Bramkarz	2000-09-06	186	\N
2011	Peter	Lezniak	Napastnik	1984-07-21	163	90057567
2012	Vanessa	Makelaar	Bramkarz	1995-01-20	171	\N
2013	Jace	Ayers	Pomocnik	2005-01-24	173	\N
2014	Kimberly	Wood	Bramkarz	2008-06-03	187	26414354
2015	Peggy	Pearlman	Bramkarz	2014-11-01	174	14578897
2016	Theo	Climent	Bramkarz	2002-02-20	168	\N
2017	Talitha	Visentini	Obrońca	1984-08-26	188	87294196
2018	Tim	Malone	Obrońca	1990-05-14	195	17513682
2019	Javier	DeBuck	Bramkarz	2007-10-06	181	\N
2020	Talita	Dulisse	Pomocnik	2011-02-03	178	84246230
2021	Lara	Poissant	Obrońca	2014-03-03	192	21948546
2022	Gabrielle	Shapiro	Obrońca	1997-12-03	181	35692429
2023	Sue	Daley	Bramkarz	1984-08-27	176	5797277
2024	John	Jones	Pomocnik	2014-05-20	199	66637698
2025	Alexander	Stockton	Bramkarz	1985-03-17	184	8872105
2026	Babet	Zia	Obrońca	1996-11-17	168	85847119
2027	Oscar	Wong	Napastnik	1999-12-18	181	89514517
2028	Robert	Stockton	Bramkarz	1992-05-27	198	7874924
2029	Steven	Praeger	Obrońca	1995-07-13	161	89259218
2030	Ann	King	Pomocnik	1977-05-29	191	92867570
2031	Jace	Schmidt	Bramkarz	1997-07-06	190	43926078
2032	Cristina	Krutkov	Bramkarz	1985-10-01	177	83730828
2033	Rosa	Cantere	Obrońca	1980-12-18	190	18963120
2034	Mary	Manson	Napastnik	2019-04-25	171	\N
2035	Andrea	Gildersleeve	Obrońca	1981-01-30	178	23265104
2036	Godfrey	Arden	Obrońca	1990-11-24	164	\N
2037	Hugo	Sterrett	Bramkarz	1977-04-24	200	\N
2038	Lea	Climent	Bramkarz	1991-03-28	165	42444713
2039	Tom	Brisco	Napastnik	1983-04-15	163	1218021
2040	Jody	Baltec	Napastnik	2006-01-09	161	57037517
2041	Will	Williams	Napastnik	1976-09-13	181	73130809
2042	Siem	Griffith	Napastnik	1990-07-12	162	\N
2043	Katie	Johnson	Pomocnik	1982-11-09	197	89613484
2044	Sherman	Pensec	Napastnik	1976-05-12	170	\N
2045	Joe	Stevenson	Obrońca	1988-08-25	177	80389072
2046	Carolina	Moore	Napastnik	1979-03-06	196	\N
2047	Olivia	Imhoff	Napastnik	1980-11-03	188	34315443
2048	Pete	Guethlein	Obrońca	2003-08-16	198	1198980
2049	Leon	Millis	Pomocnik	2007-12-08	192	65038443
2050	Ewa	Brisco	Bramkarz	2019-09-11	199	29981598
2051	Caroline	Huffsmitt	Pomocnik	2016-04-22	169	72511477
2052	Tim	Miller	Napastnik	2017-06-13	191	\N
2053	Rob	Mayberry	Bramkarz	1988-02-20	173	11503074
2054	Paul	Jones	Napastnik	2002-09-29	193	\N
2055	Krystyna	Crocetti	Napastnik	2012-07-27	168	72135541
2056	Liam	Spensley	Obrońca	1990-05-09	183	52145745
2057	Piet	Langham\t	Obrońca	2005-04-20	192	89224646
2058	John	Reyes	Pomocnik	2015-11-22	180	15613126
2059	Martina	Toreau	Napastnik	1986-07-20	165	63594514
2060	Joe	Markovi	Obrońca	1989-07-01	187	89603676
2061	Joop	Roche	Napastnik	2016-09-03	176	14034362
2062	Joey	Chapman	Pomocnik	2012-02-29	167	21465607
2063	Joe	Ahlgren	Pomocnik	1989-10-05	160	53353347
2064	Albert	Lannigham	Bramkarz	2000-11-12	190	\N
2065	Lucas	DeWilde	Napastnik	2002-02-13	182	20155062
2066	Thelma	van Goes	Napastnik	1998-11-18	183	\N
2067	Luka	Sirabella	Napastnik	1975-03-03	168	82766236
2068	Jeanette	Markovi	Pomocnik	1977-03-08	188	91438925
2069	Mathilde	Brennan	Bramkarz	1996-12-15	191	\N
2070	Nico	Roche	Obrońca	1977-05-17	185	25085790
2071	Jacob	Wood	Napastnik	1998-02-21	171	\N
2072	Scottie	Malone	Napastnik	1989-04-24	185	\N
2073	Andrew	Cain	Bramkarz	2019-03-30	187	84950837
2074	Kees	Liddle	Bramkarz	1999-08-21	164	97837891
2075	Luke	Robertson	Obrońca	1985-07-15	183	\N
2076	Daan	Brennan	Napastnik	2013-06-06	200	61661149
2077	Anna	Stannard	Bramkarz	1999-04-14	189	7214797
2078	Andrea	Chwatal	Pomocnik	1976-09-19	165	\N
2079	Adam	Franklin	Napastnik	1980-12-30	189	70980996
2080	Babet	Miller	Obrońca	2008-07-29	160	23123456
2081	Jaap	Carlos	Obrońca	1991-04-25	176	17471396
2082	William	Freed	Pomocnik	1982-08-15	196	64992662
2083	Michel	Cantere	Pomocnik	1990-10-04	170	88809383
2084	Alice	Franklin	Napastnik	1999-11-20	162	77701392
2085	Carla	Daniel	Bramkarz	2005-03-02	199	22026894
2086	Katarzyna	Voigt	Napastnik	1987-09-25	163	\N
2087	Piet	Gua Lima	Obrońca	1977-07-13	160	12841237
2088	Toon	Bertelson	Obrońca	2005-08-18	192	65880232
2089	Tom	Seibel	Bramkarz	2013-04-07	172	26880246
2090	Pete	Toreau	Bramkarz	1991-09-16	188	9325245
2091	Conor	Kellock	Bramkarz	1987-08-03	160	38175908
2092	Gerrit	Reyes	Bramkarz	2004-01-18	192	\N
2093	Kay	Durso	Bramkarz	2009-10-01	184	91648451
2094	Jane	Little	Bramkarz	1993-11-04	191	55446617
2095	Hugo	Queen	Napastnik	2006-07-01	176	\N
2096	Marek	Zimmerman	Obrońca	2012-05-01	199	\N
2097	Ross	Zapetis	Napastnik	2011-03-17	185	\N
2098	Matthijs	Symms	Bramkarz	1983-12-16	167	51255798
2099	Camilla	Guyer	Napastnik	1995-01-27	167	67589750
2100	Lucy	Cramer	Obrońca	2015-11-17	191	53433246
2101	Piet	Brisco	Obrońca	1993-07-08	165	7803216
2102	Elena	Whitehurst	Napastnik	1996-06-13	172	54127876
2103	Rogier	Brown	Bramkarz	1982-08-20	186	56980132
2104	Tyler	Hopper	Napastnik	1994-03-16	169	96679601
2105	Cloe	Bloom	Pomocnik	2004-08-31	175	6386106
2106	Isabelle	Fernandez	Pomocnik	1984-05-23	167	1885729
2107	Godfrey	Perilloux	Napastnik	2003-02-10	196	73097988
2108	Fons	Anderson	Napastnik	2011-06-27	193	91844303
2109	Tomas	Fernandez	Napastnik	1975-11-21	185	\N
2110	Vanessa	Waldo	Pomocnik	1979-01-15	180	48731117
2111	Pete	Brumley	Obrońca	1995-12-03	164	54896312
2112	Nate	Spensley	Pomocnik	1991-11-03	179	37047958
2113	Amber	Hummel	Bramkarz	2000-08-20	169	8467979
2114	Milan	Moore	Napastnik	2009-12-20	168	\N
2115	Charlie	Nobles	Bramkarz	1997-11-26	186	\N
2116	Nerea	Hendrix	Napastnik	1999-02-27	192	78591531
2117	Andrew	Jenssen	Napastnik	1988-12-20	191	17027281
2118	Rolla	Liddle	Napastnik	1976-03-13	182	79759689
2119	Marcin	DelRosso	Pomocnik	1990-10-23	193	56317212
2120	Benjamin	Morgan	Napastnik	2016-12-10	167	12422174
2121	Julia	Brown	Pomocnik	1983-01-24	198	40806555
2122	Helen	Meterson	Pomocnik	2016-12-26	170	\N
2123	Andy	Gonzalez	Bramkarz	1979-11-28	181	\N
2124	Kees	Pyland	Bramkarz	1986-12-15	169	50569994
2125	Sue	Rivers	Bramkarz	2008-04-04	187	78447797
2126	Anton	Lawton	Pomocnik	1978-04-13	167	95977355
2127	Koos	Pierce	Obrońca	1976-07-22	173	\N
2128	Niek	Gildersleeve	Bramkarz	1997-11-26	180	89900982
2129	Scott	Cramer	Bramkarz	1999-12-10	169	13231607
2130	Trevor	Riegel	Obrońca	1998-01-12	184	81748061
2131	Niklas	Williamson	Obrońca	1999-09-05	162	64009731
2132	Jaap	King	Bramkarz	1994-03-08	174	96259952
2133	Jozef	Storrs	Bramkarz	2003-03-21	165	34924251
2134	Kayleigh	Haynes	Pomocnik	1988-04-11	182	\N
2135	Babet	Miller	Pomocnik	1990-04-13	170	\N
2136	Bess	Waddell	Bramkarz	1998-09-11	178	11967592
2137	Vincent	Praeger	Napastnik	1995-06-20	189	19571086
2138	Kimmy	Malone	Napastnik	1988-05-19	197	50337272
2139	Dylan	Williams	Pomocnik	1990-09-19	182	63948205
2395	Magnus	Muench	Obrońca	1992-06-26	175	19423265
2396	Patty	Simonent	Obrońca	1979-09-11	191	53052286
2397	Daniel	Mcgrew	Pomocnik	1998-12-22	181	34166577
2398	Bas	Simonent	Napastnik	2007-05-06	172	63356830
2399	Benjy	Dittrich	Bramkarz	1987-05-21	180	49841391
2400	Godfrey	Markovi	Bramkarz	1996-05-16	181	75790584
2401	Cath	Freeman	Pomocnik	1999-01-05	181	74657497
2402	Patricia	Herring	Bramkarz	2008-03-25	181	\N
2403	Rachel	Blacher	Napastnik	1994-05-17	184	34375561
2404	Jody	Leonarda	Obrońca	1977-12-10	199	49612418
2405	Ross	Moore	Napastnik	2000-10-19	194	22460769
2406	Miriam	Bloom	Obrońca	1976-04-13	177	18136631
2407	Iris	Bloom	Napastnik	1998-01-29	192	67804892
2408	Magnus	McCormick	Obrońca	2010-03-12	183	56742260
2409	Bess	Bright	Pomocnik	1977-05-24	183	85471699
2410	Lewis	White	Obrońca	2003-04-20	192	65049120
2411	Ruth	Sanders	Bramkarz	2011-10-14	164	90461281
2412	Kimmy	Zia	Pomocnik	1986-12-30	167	89914547
2413	Willy	Framus	Bramkarz	2008-09-06	199	92243791
2414	Sigrid	Bogdanovich	Napastnik	1984-11-28	176	21779566
2415	Martien	Morton	Bramkarz	1978-01-22	175	60757959
2416	Andrea	White	Napastnik	1999-04-03	177	62486911
2417	Richard	Noteboom	Obrońca	1995-09-16	172	61055087
2418	Cristian	Bruno	Bramkarz	2009-01-31	193	19701339
2419	Nigel	Muench	Pomocnik	1976-10-05	186	86254233
2420	Sophie	Guethlein	Pomocnik	2015-09-07	190	51739046
2421	Janet	Bertelson	Obrońca	1976-11-06	160	67451447
2422	Lizzy	Ecchevarri	Pomocnik	1977-12-09	182	91662799
2423	Rasmus	Marra	Pomocnik	1994-07-12	190	16932711
2424	Alba	Jessen	Obrońca	2009-03-08	162	61610150
2425	Siska	Francis	Napastnik	2005-11-17	191	20214313
2426	Krzysztof	Lawton	Pomocnik	2004-06-11	179	15081268
2427	Erin	Ayers	Napastnik	2018-07-16	186	38913065
2428	Megan	Royal	Obrońca	1981-07-14	183	74408039
2429	Joey	Depew	Pomocnik	2018-04-03	162	76769677
2430	Nicholas	Ward\t	Napastnik	1992-10-25	178	3044643
2431	Catherine	Prior	Bramkarz	1999-04-10	182	5949187
2432	Alexis	Plantz	Pomocnik	2013-11-14	197	43749326
2433	Talita	Ditmanen	Pomocnik	2001-09-14	197	96560140
2434	Catharine	Heyn	Pomocnik	1999-06-09	192	11954977
2435	Christian	Arcadi	Obrońca	2003-11-06	192	61406615
2436	Maggie	Robbins	Napastnik	1985-12-31	161	4940022
2437	Bess	Bogdanovich	Obrońca	1987-07-06	172	48851933
2438	Saskia	Brown	Bramkarz	2009-09-06	193	\N
2140	Janet	Pickering	Obrońca	2012-09-14	185	96201279
2141	Patricia	Grote	Obrońca	2003-11-01	171	96957491
2142	Lewis	Waldo	Bramkarz	2007-12-26	168	74505118
2143	Steven	Cappello	Pomocnik	1994-06-23	175	29220485
2144	John	Nobles	Napastnik	1998-09-15	171	24935630
2145	William	Wood	Bramkarz	1978-09-14	164	\N
2146	Syd	Hollman	Obrońca	2012-05-03	174	50036098
2147	Fons	Kuehn	Obrońca	2002-05-01	197	56452962
2148	Trevor	Laudanski	Obrońca	2017-04-04	163	50586136
2149	Sandra	Sharp	Napastnik	1977-03-22	175	9085231
2150	Pip	Swaine	Bramkarz	1992-05-26	168	9897000
2151	Katie	Toreau	Bramkarz	1978-02-18	174	\N
2152	Catherine	Arden	Obrońca	1978-10-05	164	62406134
2153	Talitha	Lee	Pomocnik	2002-12-12	189	1928931
2154	Sherman	Goodman	Obrońca	2008-01-16	178	45466538
2155	Leon	Royal	Obrońca	2016-10-08	199	57387088
2156	Sally	Overton	Obrońca	2011-10-02	173	63590203
2157	Katarzyna	Moreau	Obrońca	2015-11-12	160	10895218
2158	Betty	Vostreys	Napastnik	1984-12-19	183	98331661
2159	Catherine	Raines	Pomocnik	1991-08-29	200	\N
2160	Helen	Gieske	Pomocnik	2007-09-22	162	55620621
2161	Anton	Nahay	Bramkarz	1984-07-18	194	8716824
2162	Jody	Petrzelka	Pomocnik	2004-04-01	198	60801334
2163	Pauline	Wargula	Obrońca	2007-01-21	175	46734502
2164	Sandra	Wilson	Bramkarz	1982-12-12	171	80391035
2165	Shermie	Symbouras	Pomocnik	1988-10-26	164	\N
2166	Georgina	Gunter	Pomocnik	2011-06-16	187	10873483
2167	Sigrid	Crocetti	Pomocnik	1998-04-03	160	46758260
2168	Aoife	Love	Pomocnik	2009-11-10	186	48300269
2169	Ada	Gonzalez	Napastnik	1996-07-17	187	5957532
2170	Ashley	Gibson	Napastnik	1975-04-30	165	27348607
2171	Klara	Durso	Napastnik	1977-01-04	188	\N
2172	Trevor	Praeger	Bramkarz	2002-09-05	162	2383075
2173	Pawel	Blacher	Napastnik	1988-02-19	194	33388737
2174	Alba	Nithman	Pomocnik	1999-03-17	180	35353541
2175	Caroline	van der Laar	Obrońca	2014-04-02	164	95326099
2176	David	Buchholz	Pomocnik	2018-12-24	176	58209895
2177	Shermie	Morton	Napastnik	1993-01-15	198	31768887
2178	Gerrit	Ecchevarri	Napastnik	2014-04-21	183	42735033
2179	Isabel	Naff	Napastnik	1993-11-20	196	\N
2180	Maggie	Evans	Obrońca	1989-08-18	196	32093453
2181	Pieter	Hankins	Napastnik	1996-05-07	186	\N
2182	Mary	Davis	Pomocnik	1987-09-19	172	52225540
2183	Tomas	Comeau	Pomocnik	1995-09-14	180	41617133
2184	Rasmus	Mayberry	Obrońca	2017-07-10	178	24784575
2185	Susan	Davis	Obrońca	1978-05-03	161	90085126
2186	Peggy	Harder	Obrońca	2016-08-17	191	\N
2187	Babette	Troher	Obrońca	1975-09-12	161	36582756
2188	Nate	Matthew	Pomocnik	1978-08-06	165	86660843
2189	Gert	Massingill	Pomocnik	2003-11-22	176	\N
2190	Willy	Wood	Obrońca	1980-08-06	198	47789412
2191	Nicholas	Laudanski	Pomocnik	1979-10-24	171	\N
2192	Herbert	Matthew	Obrońca	1975-03-22	178	21660050
2193	Camille	Hedgecock	Napastnik	1993-06-10	169	8979668
2194	Christopher	Keller	Napastnik	1989-05-29	166	\N
2195	Joshua	Cantere	Pomocnik	1983-06-14	180	65616756
2196	Jane	Millis	Napastnik	2007-02-14	181	59413020
2197	Daniel	Raines	Bramkarz	1987-05-13	177	20694970
2198	Mads	Phelps	Bramkarz	1985-09-25	163	86152236
2199	Saskia	Plantz	Obrońca	2014-08-12	169	91935152
2200	Nicoline	Willis	Napastnik	2006-06-15	186	95419381
2201	Paul	Fox	Napastnik	1983-07-04	194	8260711
2202	Chris	Wilson	Obrońca	2008-04-26	173	\N
2203	Philippa	Shapiro	Obrońca	1998-03-18	188	11610795
2204	Catharine	Paddock	Obrońca	2019-05-23	192	\N
2205	Adrian	Hendrix	Napastnik	2012-06-09	179	13793470
2206	Sjaak	Angarano	Obrońca	1992-12-01	184	9402237
2207	Klaas	Little	Pomocnik	1978-06-28	180	26705234
2208	Elzbieta	Ijukop	Obrońca	1998-11-27	186	30156906
2209	Scottie	Plantz	Obrońca	1977-08-31	176	\N
2210	Petra	Phelps	Obrońca	2007-02-25	161	59553350
2211	Roger	Heyn	Napastnik	2003-04-13	189	86544543
2212	Georgina	Cain	Napastnik	1999-08-19	200	23707161
2213	Simon	Visentini	Napastnik	2010-01-06	190	29602444
2214	Samuel	Crocetti	Napastnik	2009-06-06	167	92635927
2215	Adrian	Geoppo	Bramkarz	1981-01-08	176	12447655
2216	Nicky	Moore	Napastnik	1982-08-16	193	82784857
2217	Ivan	Framus	Obrońca	1981-08-03	183	\N
2218	Juana	Martin	Pomocnik	2005-10-06	193	11609671
2219	Matthew	Uprovski	Pomocnik	1999-08-09	182	28974976
2220	Rachel	Daniel	Napastnik	2005-05-31	199	57770941
2221	Luke	Chwatal	Napastnik	2012-09-06	185	25683242
2222	Lincoln	Byrnes	Bramkarz	1979-08-20	192	\N
2223	Siska	Ward\t	Bramkarz	2006-04-25	200	99751757
2224	Ricky	Wesolowski	Napastnik	1994-12-19	162	\N
2225	Dirk	Ionescu	Napastnik	1989-08-27	183	5164673
2226	Peggy	Ecchevarri	Pomocnik	2001-07-17	199	65826588
2227	Camille	Igolavski	Bramkarz	2008-12-25	166	78323943
2228	Alice	Cragin	Pomocnik	1984-01-18	160	34710987
2229	Marek	Visentini	Bramkarz	1993-09-20	176	55790959
2230	Ryan	Sakurai	Obrońca	1981-08-25	192	93876562
2231	Babette	Arcadi	Bramkarz	2016-05-12	176	87755042
2232	Duncan	Knopp	Pomocnik	1993-10-23	200	42512997
2233	Filip	Koss	Obrońca	2004-12-03	178	76850849
2234	Julian	Shapiro	Obrońca	1995-03-26	194	59355068
2235	Fabian	Hamilton	Obrońca	2015-11-10	184	98962158
2236	JanCees	Toreau	Bramkarz	1987-03-14	175	49030587
2237	Lewis	Haynes	Bramkarz	1987-02-19	182	96012233
2238	Rachel	Ahlgren	Obrońca	1992-10-19	192	\N
2239	Ivan	Julieze	Bramkarz	2011-06-20	165	87849509
2240	Daniela	Sanders	Napastnik	1984-08-29	187	72690649
2241	Matt	Davis	Obrońca	1989-05-30	164	66756252
2242	Mathias	van der Laar	Bramkarz	1999-09-03	181	\N
2243	Marco	Pyland	Napastnik	1994-07-05	169	61160030
2244	Theo	Rivers	Bramkarz	2000-11-06	162	79125992
2245	Matt	Long	Obrońca	1996-01-09	173	34729332
2246	Helma	Helfrich	Bramkarz	2007-03-08	192	12551069
2247	John	Stevens	Obrońca	1977-08-06	160	84097152
2248	Ellie	Wilson	Pomocnik	1999-12-02	162	70434696
2249	Catherine	Morton	Napastnik	1976-10-30	185	\N
2250	Chloe	Cain	Obrońca	1999-01-08	176	28303075
2251	Sigrid	DelRosso	Pomocnik	1984-05-30	169	84507182
2252	Martien	Manson	Obrońca	2006-05-31	178	\N
2253	Kayleigh	Korkovski	Pomocnik	2017-03-11	198	60723045
2254	Kim	Anthony	Obrońca	2007-10-28	194	\N
2255	Christian	Reyes	Napastnik	2019-08-09	199	230348
2256	Lucia	Bright	Bramkarz	2007-12-30	195	53135013
2257	Sjaak	Maribarski	Obrońca	1975-02-26	189	\N
2258	Bess	Clarke	Bramkarz	2000-10-20	167	36413577
2259	Jacob	Thaler	Pomocnik	1993-01-26	177	72238811
2260	Jolanda	Matthew	Bramkarz	1991-12-30	199	82123129
2261	Gabrielle	Lawton	Pomocnik	2012-12-21	166	\N
2262	Lu	Phelps	Pomocnik	1994-10-03	200	80256141
2263	Christian	Pickering	Napastnik	2004-02-29	198	13077044
2264	Ed	Carlos	Napastnik	2000-11-08	180	99410496
2265	Gillian	Van Dinter	Bramkarz	2019-07-11	180	66767805
2266	Bo	Clark	Napastnik	1987-09-28	169	84890376
2267	Annie	Lawton	Bramkarz	1976-05-18	187	46015882
2268	Talitha	Scheffold	Obrońca	1999-06-26	196	9537221
2269	Tomas	Lee	Pomocnik	1993-08-16	192	80730763
2270	Will	Manson	Bramkarz	1977-08-04	182	2776340
2271	Sophie	Anderson	Bramkarz	2015-01-03	183	86877111
2272	Toon	Liddle	Obrońca	2015-03-19	171	33677940
2273	Jaap	Ecchevarri	Pomocnik	2005-07-22	164	86737700
2274	Karin	DeWald	Obrońca	1988-04-10	160	38167439
2275	Annie	Stockton	Napastnik	2019-11-21	182	90786370
2276	Gillian	Kingslan	Bramkarz	2000-09-07	169	21853807
2277	Roger	Robinson	Obrońca	2006-01-03	177	\N
2278	Patty	Cragin	Obrońca	1992-08-16	168	\N
2279	Joey	Raines	Obrońca	2004-04-25	183	81438760
2280	Mick	Pyland	Pomocnik	2009-11-11	169	45284829
2281	Tim	Anderson	Pomocnik	1995-02-15	193	57468825
2282	Krzysztof	Prior	Bramkarz	1991-07-24	197	\N
2283	Rik	Wood	Bramkarz	1995-09-20	188	3073763
2284	Alexis	Dittrich	Obrońca	1991-04-04	191	41236968
2285	James	Walker	Bramkarz	1977-06-06	183	22433791
2286	Herb	Robinson	Obrońca	1976-12-05	198	85522783
2287	Daan	Robbins	Pomocnik	1994-10-31	160	\N
2288	Tyler	Gibson	Bramkarz	2003-11-22	193	70602202
2289	Scottie	Chwatal	Bramkarz	2019-05-07	193	80179515
2290	Lea	Wolpert	Pomocnik	1984-12-07	182	\N
2291	Rob	Young	Napastnik	1976-02-23	160	90222649
2292	Pieter	Jessen	Pomocnik	1979-03-27	184	96067598
2293	Cathy	Robertson	Napastnik	1998-06-16	181	85214823
2294	Tony	Turk	Pomocnik	2018-01-16	163	64265536
2295	Luke	Bernstein	Bramkarz	2005-08-12	188	18903094
2296	Rich	Morton	Napastnik	2018-03-31	165	93947341
2297	Elin	Bertelson	Napastnik	1987-11-02	171	34510488
2298	Marty	Goodnight	Pomocnik	2016-06-20	195	\N
2299	Sam	Millikin	Obrońca	2016-04-30	165	22701288
2300	Bas	Freed	Bramkarz	1975-03-06	167	\N
2301	Andy	Herring	Napastnik	2009-09-30	169	97279003
2302	Juan	Anderson	Bramkarz	2000-05-13	198	68169373
2303	Camille	Brisco	Napastnik	1995-04-24	171	83635208
2304	Rasmus	Stannard	Pomocnik	1991-08-25	186	44139467
2305	Lincoln	Climent	Bramkarz	1978-12-27	160	\N
2306	Luke	Kellock	Napastnik	1978-12-30	190	19628750
2307	Jean	Igolavski	Pomocnik	2011-03-18	173	40205748
2308	Martina	Robertson	Bramkarz	1999-07-08	178	\N
2309	Joshua	Knopp	Napastnik	2004-02-01	164	79331917
2310	Lucy	Stannard	Pomocnik	2006-04-01	184	68762403
2311	Teddy	Jackson	Pomocnik	2004-05-05	181	30141643
2312	Caitlin	Freed	Bramkarz	1985-02-23	169	79730564
2313	Catherine	Cantere	Pomocnik	1983-01-02	183	29704799
2314	Anthony	Wooten	Obrońca	2009-08-14	174	33213870
2315	Tomasz	Mayberry	Obrońca	2018-06-25	177	\N
2316	Lotte	Nahay	Napastnik	1987-10-23	181	59127488
2317	Theodore	Manson	Bramkarz	2006-02-20	179	98311370
2318	Duncan	Linhart	Obrońca	1991-12-31	193	\N
2319	Joseph	Walker	Bramkarz	2004-04-05	160	2488836
2320	Luke	Mcgrew	Pomocnik	2008-11-22	170	35339961
2321	Camille	Brown	Bramkarz	2019-10-07	167	78148072
2322	Chris	Hardoon	Obrońca	1983-02-23	198	94265492
2323	Nicolas	Plantz	Bramkarz	1980-10-20	179	5691313
2324	Sjon	Mariojnisk	Pomocnik	1983-09-14	193	16075377
2325	Jim	Allison	Obrońca	1999-10-18	167	\N
2326	Marty	Gunter	Pomocnik	1987-03-31	165	\N
2327	Johnny	Chwatal	Bramkarz	1980-12-09	191	\N
2328	Eleanor	Kingslan	Pomocnik	1991-10-26	196	1135954
2329	Carla	Herzog	Pomocnik	2003-08-24	186	86611176
2330	Jace	Troher	Bramkarz	2015-08-07	200	41133439
2331	Steve	Caffray	Bramkarz	2001-03-27	173	\N
2332	Maggie	Williamson	Obrońca	2014-12-05	200	91134894
2333	Betty	Uitergeest	Napastnik	1991-09-12	165	58399939
2334	Oscar	Alspaugh	Obrońca	1984-11-27	190	\N
2335	Patty	Maribarski	Pomocnik	2013-09-11	192	28246956
2336	Peter	Moore	Obrońca	1986-12-14	190	2132638
2337	Talita	DeBerg	Pomocnik	2011-11-26	178	47827552
2338	Alejandro	Boyer	Obrońca	1987-10-19	168	\N
2339	Leah	Robertson	Bramkarz	2017-11-09	180	10665154
2340	Alice	Herrin	Obrońca	2018-11-06	194	37581173
2341	Toon	Pekaban	Obrońca	1998-01-22	172	86376158
2342	Jonas	Ratliff	Napastnik	1990-01-02	173	62782326
2343	Edward	Kellock	Napastnik	1979-01-03	191	\N
2344	Catharine	Oyler	Bramkarz	1986-06-30	192	91462058
2345	PieterJan	Pekagnan	Pomocnik	1989-11-27	180	\N
2346	Koos	Helfrich	Obrońca	1984-06-14	174	63125289
2347	Maja	Mitchell	Pomocnik	1977-12-29	173	27945832
2348	Jeanne	Katsekes	Pomocnik	2011-10-22	168	99649316
2349	Sally	Bright	Bramkarz	2003-12-30	174	21254882
2439	Maria	Walker	Obrońca	1986-07-30	175	\N
2350	Herbert	Dulisse	Obrońca	1992-07-01	198	5908947
2351	Julian	King	Obrońca	1994-08-23	176	\N
2352	Suzanne	Poole	Bramkarz	2013-07-02	190	\N
2353	Saskia	Koss	Obrońca	2016-12-19	170	\N
2354	Harry	Slemp	Pomocnik	2015-12-28	181	\N
2355	Godfrey	Wargula	Napastnik	1988-03-10	172	47528380
2356	Charlotte	Helbush	Napastnik	2009-12-20	197	\N
2357	Taylor	Lawton	Pomocnik	1985-05-13	197	36996667
2358	Steven	Orcutt	Napastnik	1995-01-19	185	\N
2359	Pieter	Crocetti	Pomocnik	1985-01-21	198	69418151
2360	Scottie	Hendrix	Bramkarz	2012-12-23	168	\N
2361	Bert	Heyn	Pomocnik	2001-07-20	171	42088199
2362	Sem	van Dijk	Napastnik	2004-01-24	188	\N
2363	Al	Laudanski	Obrońca	2019-08-07	191	81344397
2364	Javier	Riegel	Obrońca	1976-01-28	170	\N
2365	David	Troher	Napastnik	2011-02-18	189	77840393
2366	Pete	Dittrich	Bramkarz	2005-12-28	190	21797157
2367	Chloe	Herrin	Napastnik	2001-10-13	174	71765970
2368	Zoe	Spensley	Obrońca	1984-06-04	163	87601280
2369	Jill	Bruno	Napastnik	2014-02-01	198	57963234
2370	Madison	Duvall	Bramkarz	1979-10-05	196	83939903
2371	Philippa	Roche	Napastnik	1977-04-07	200	\N
2372	Agnieszka	Nithman	Obrońca	1999-02-21	188	\N
2373	Taylor	Bertelson	Pomocnik	2008-09-06	180	8999375
2374	Coby	Daughtery	Bramkarz	1995-11-10	175	41330906
2375	Ricardo	Kingslan	Obrońca	1996-12-09	185	66741523
2376	Babette	LeGrand	Obrońca	1977-09-17	166	\N
2377	Chris	Naff	Bramkarz	2007-01-29	185	67899228
2378	Maaike	Robinson	Obrońca	2010-05-08	176	\N
2379	Mary	Bryant	Bramkarz	1987-11-25	194	19764393
2380	Eleanor	Watson	Pomocnik	1990-10-23	173	66446483
2381	Christa	Emerson	Obrońca	2011-12-26	174	36828199
2382	Rolla	Lee	Pomocnik	1994-05-11	180	92859110
2383	Cath	Korkovski	Obrońca	2016-09-13	173	68935648
2384	Claudia	Depew	Napastnik	1995-12-31	185	91928747
2385	Bo	Blount	Pomocnik	1987-04-18	199	5272326
2386	Tobias	Petrzelka	Obrońca	2005-08-30	197	33996898
2387	Tom	Chwatal	Napastnik	1998-06-09	189	75214860
2388	Jim	Deleo	Pomocnik	2014-10-13	176	38849733
2389	Ida	Anthony	Pomocnik	2012-06-19	171	34395228
2390	Ricky	Davis	Napastnik	1998-02-02	182	38956475
1652	Emily	Crocetti	Napastnik	2016-10-06	185	38444672
1653	Marta	Goodnight	Bramkarz	2006-02-23	200	21847002
1654	Margaret	Green	Napastnik	1989-10-23	163	\N
1655	Javier	Raines	Bramkarz	2011-09-24	161	58357326
1656	Tobias	Williamson	Pomocnik	2017-08-02	171	23614721
1657	Rosa	Cross	Pomocnik	1990-01-05	174	60702454
1658	Joe	Seibel	Obrońca	2004-05-26	181	98840650
1659	Rik	Mulders	Napastnik	1976-03-14	186	92015223
1660	Maggie	Visentini	Bramkarz	1994-12-04	185	79869016
1661	Sylvia	Francis	Napastnik	1994-04-26	189	32113570
1662	Babet	Vanderoever	Bramkarz	1976-12-16	179	\N
1663	Sydney	Naley	Bramkarz	1981-08-08	174	30330392
1664	Alexander	Hollman	Bramkarz	1975-06-16	193	71601102
1665	Patricia	Waddell	Pomocnik	1979-11-15	190	56110023
1666	Theo	Brown	Pomocnik	2000-02-28	190	48294145
1667	Joe	Emerson	Napastnik	1979-05-16	199	49587502
1668	Nicolas	Hardoon	Obrońca	2014-01-20	165	4373585
1669	Ross	Matthew	Bramkarz	2007-01-08	180	17032752
1670	Philippa	Pekagnan	Napastnik	2013-09-22	166	79821218
1671	Liam	Griffioen	Napastnik	2012-01-22	165	33923931
1672	Luis	Slemp	Obrońca	1996-08-23	182	58301484
1673	Esther	Nadalin	Pomocnik	1998-11-18	161	26063300
1674	Sandra	Conley	Obrońca	1980-01-21	188	11259679
1675	Piotr	Chapman	Obrońca	1989-11-25	178	\N
1676	George	Martin	Bramkarz	1999-07-21	200	566542
1677	Catherine	Wesolowski	Obrońca	1987-06-05	183	7433694
1678	Oliver	Lamere	Pomocnik	2001-05-05	187	\N
1679	Lizzy	Keller	Napastnik	1990-05-26	194	97869519
1680	Sherm	Sakurai	Napastnik	2001-02-13	166	78664910
1681	Martien	DelRosso	Obrońca	1983-05-18	191	50450893
1682	Camille	Jackson	Pomocnik	1980-04-06	180	60137666
1683	Michael	Bitmacs	Bramkarz	1984-09-30	162	86448874
1684	Diego	Hummel	Bramkarz	1999-02-19	165	25241952
1685	Pablo	Naff	Pomocnik	2018-10-26	160	\N
1686	James	Davis	Obrońca	1983-04-03	192	51920787
1687	Patty	Waldo	Napastnik	1993-05-09	171	99869203
1688	Sophia	Harness	Pomocnik	1991-11-07	193	2239039
1689	Sue	Imhoff	Pomocnik	2019-04-19	160	\N
1690	Dylan	Dulisse	Bramkarz	1991-02-18	182	26387902
1691	Will	Wood	Napastnik	1977-09-13	175	97070092
1692	Elizabeth	Jackson	Napastnik	1977-07-03	175	4549227
1693	Steve	Van Dinter	Obrońca	1983-03-09	194	45471071
1694	Alexis	Moreau	Bramkarz	1980-09-19	165	\N
1695	Luis	Vostreys	Pomocnik	2003-09-15	196	\N
1696	Benjy	van Goes	Bramkarz	1989-07-19	168	5002482
1697	William	Helbush	Pomocnik	1998-01-09	175	35594302
1698	Malgorzata	Chapman	Bramkarz	2000-03-04	164	21454427
1699	Dick	King	Bramkarz	2003-02-01	162	\N
1700	Anna	Imhoff	Napastnik	2011-03-13	168	\N
1701	Joost	Storrs	Napastnik	1996-10-08	195	26039298
1702	Will	Davis	Obrońca	2013-11-11	170	68585107
1703	Alfons	Forsberg	Obrońca	1994-07-30	182	1546532
1704	Ellie	Chwatal	Obrońca	2009-03-14	190	45093950
1705	Edward	Blount	Obrońca	2014-11-24	179	51526055
1706	Sophia	Schubert	Obrońca	1983-05-10	171	39490873
1707	Sammy	Jenssen	Napastnik	1988-12-26	193	70990868
1708	Lara	Turk	Pomocnik	1988-09-14	180	\N
1709	Sydney	Patricelli	Bramkarz	2006-06-28	185	33891437
1710	Laura	Watson	Bramkarz	2012-02-03	196	\N
1711	Andrea	Depew	Pomocnik	1997-10-19	191	9709142
1712	Camila	Newman	Napastnik	1997-11-29	188	\N
2391	Cloe	Perilloux	Bramkarz	1986-02-13	200	65311584
2392	Mary	Knopp	Napastnik	1991-12-02	194	32061687
2393	Lea	Symms	Obrońca	1993-09-14	168	15281379
2394	Luka	Keller	Napastnik	2011-02-24	180	\N
2440	Gillian	Stevenson	Bramkarz	1980-08-20	166	59769529
2441	Tyler	Ratliff	Napastnik	2019-05-26	179	\N
2442	Lucy	van Doorn	Napastnik	2001-11-04	174	\N
2443	Emily	Massingill	Pomocnik	1975-08-08	171	\N
2444	Truus	Reames	Pomocnik	1978-08-12	173	76489967
2445	Kimmy	Spensley	Pomocnik	1997-01-23	192	70592478
2446	Ester	Nelson	Bramkarz	2005-10-26	175	\N
2447	Ada	Wicks	Obrońca	2017-02-09	197	13606573
2448	Jeanette	Ditmanen	Napastnik	2004-02-28	180	99767273
2449	Joseph	Ayers	Napastnik	1984-07-23	167	16967908
2450	Betty	Warner	Pomocnik	1997-08-11	167	36619820
2451	Luis	Keller	Pomocnik	1977-12-23	184	53467541
2452	Co	Caffray	Bramkarz	2011-08-20	165	99614049
2453	Sammy	Chwatal	Bramkarz	1977-01-11	173	86540255
2454	Ruth	Kidd	Pomocnik	1979-06-14	178	40621494
2455	Bill	Thompson	Obrońca	1996-11-07	165	4125364
2456	Jessica	Gieske	Napastnik	1989-11-26	163	74159357
2457	Herb	Prior	Obrońca	1992-11-08	178	62169003
2458	Kimberly	Howe	Bramkarz	1984-10-13	195	22048381
2459	Thelma	Anderson	Obrońca	2016-12-01	174	13757526
2460	Jill	Julieze	Napastnik	2004-05-05	169	51150463
2461	PieterJan	Cappello	Pomocnik	2000-03-18	161	\N
2462	Geoff	Evans	Pomocnik	1984-06-24	160	\N
2463	Elena	Helbush	Napastnik	2020-01-11	177	8486417
2464	Nicholas	van het Hof	Obrońca	1994-01-16	170	96652521
2465	Richard	Lawton	Pomocnik	1998-02-20	189	10582442
2466	Daan	Deans	Napastnik	1985-08-25	165	43910959
2467	Jeanette	Cross	Obrońca	1993-08-14	195	39988255
2468	Max	Deleo	Obrońca	2010-12-28	189	37727327
2469	Annie	van Dijk	Napastnik	1984-12-23	174	95333385
2470	Ronald	Ijukop	Obrońca	2002-06-20	175	24296776
2471	Herbert	Gibson	Bramkarz	1978-08-31	162	67484142
2472	Bill	Pengilly	Napastnik	1991-09-24	200	41274245
2473	Sean	Weaver	Obrońca	2018-05-17	191	20500847
2474	Lucy	Naff	Napastnik	1992-01-06	191	23694133
2475	Kimmy	Botsik	Obrońca	1980-09-25	199	\N
2476	Nathan	Mariojnisk	Napastnik	1988-05-02	199	22657009
2477	Marieke	Durso	Obrońca	1978-08-09	197	34669657
2478	Jordy	Gua Lima	Napastnik	1975-06-09	187	\N
2479	Elzbieta	Miller	Obrońca	2002-07-16	192	53977690
2480	Carolina	Newman	Napastnik	2010-02-07	172	32316350
2481	Charles	Cantere	Obrońca	1983-08-25	165	\N
2482	Isaac	Markovi	Bramkarz	2013-05-30	172	23714575
2483	Tyler	Williams	Napastnik	1996-06-17	192	89669003
2484	Cath	Wesolowski	Obrońca	1999-10-17	162	47437781
2485	Piet	Watson	Pomocnik	1981-07-18	172	46979118
2486	Ross	Wakefield	Pomocnik	1985-05-25	189	4404685
2487	Vincent	Ray	Obrońca	2015-05-31	184	18340540
2488	Ann	Hoyt	Pomocnik	1976-04-19	184	58176636
2489	Lizzy	Huffsmitt	Pomocnik	2016-01-17	197	43648762
2490	Ivan	Imhoff	Bramkarz	1975-02-21	196	1592440
2491	Harold	Nahay	Napastnik	2015-01-31	184	12652063
2492	Alba	Jenssen	Obrońca	2017-10-17	164	\N
2493	Marieke	Roche	Obrońca	1982-01-20	181	92837394
2494	Ciara	Kepler	Napastnik	2012-09-26	194	\N
2495	Tony	Cramer	Pomocnik	1986-06-03	192	59692678
2496	Lena	Bruno	Napastnik	1998-08-06	163	80361923
2497	Leo	Uprovski	Obrońca	2019-03-20	193	93903379
2498	Christopher	Julieze	Bramkarz	1989-09-05	181	36911672
2499	Sean	Cappello	Napastnik	1989-10-14	160	\N
2500	Joseph	Weaver	Obrońca	2009-01-11	184	61076944
2501	Phil	Lee	Pomocnik	1985-07-02	187	\N
2502	Jan	Duvall	Napastnik	2011-01-09	200	42431450
2503	Katharina	Orcutt	Bramkarz	1996-11-03	188	\N
2504	Alexis	Kidd	Bramkarz	2002-11-20	162	51710798
2505	Magnus	Comeau	Obrońca	2005-01-02	196	14028254
2506	Tony	Van Dinter	Obrońca	1992-05-07	161	77638372
2507	Scotty	McDaniel	Obrońca	1980-11-04	198	\N
2508	Peggy	Deans	Napastnik	2004-10-24	191	75608249
2509	Drew	Pearlman	Obrońca	2000-05-08	161	\N
2510	Wilma	Stannard	Pomocnik	2003-01-18	187	53324595
2511	Gert	Uprovski	Napastnik	1987-04-29	178	23758273
2512	Johnny	Sirabella	Obrońca	1975-08-31	183	26423712
2513	Nathan	Lejarette	Obrońca	2004-07-07	198	13029265
2514	Linnea	Mitchell	Obrońca	2010-09-05	163	91311699
2515	Elena	Hollman	Obrońca	2016-12-03	160	92532790
2516	Lauren	Toler	Napastnik	2009-12-28	176	3572385
2517	Herbert	Yinger	Pomocnik	1992-10-24	184	70439742
2518	Kimmy	Pierce	Pomocnik	2000-01-28	173	29984711
2519	Stephen	Dulisse	Napastnik	1982-03-22	162	57288839
2520	Scottie	Leonarda	Pomocnik	1990-02-07	180	\N
2521	Sid	Hopper	Pomocnik	1978-02-10	161	97236675
2522	Jeanne	Whitehurst	Obrońca	1982-02-23	193	\N
2523	Matt	Nefos	Obrońca	1977-05-13	188	19550830
2524	JanCees	Lamere	Pomocnik	1987-10-15	180	9283332
2525	Marco	Robertson	Napastnik	1987-08-23	189	\N
2526	Julian	Wilson	Napastnik	2017-04-06	184	\N
2527	Sammy	Novratni	Obrońca	2011-12-24	168	20591363
2528	Marta	Frega	Obrońca	2012-07-22	164	\N
2529	Taylor	Laudanski	Bramkarz	2016-08-11	188	49636999
2530	Edwin	Reames	Obrońca	2015-08-01	163	34616451
2531	Ida	Gibson	Obrońca	1992-09-11	199	30100301
2533	Martina	Lannigham	Obrońca	1984-05-06	180	70738619
2534	Sean	Spensley	Napastnik	2011-06-01	193	\N
2535	Manuel	Aldritch	Bramkarz	1993-12-02	188	27195433
2536	Pauline	Jenssen	Bramkarz	1985-02-23	167	979470
2537	Christian	Foreman	Bramkarz	2004-01-31	176	\N
2538	Paul	Cappello	Pomocnik	1992-02-15	164	21968069
2539	Godfrey	Voigt	Bramkarz	2015-03-10	170	60694989
2540	John	Little	Pomocnik	2002-07-02	163	\N
2541	Liza	Robbins	Napastnik	1979-04-29	189	17666299
2542	Pip	Mitchell	Obrońca	2001-12-29	160	50175530
2543	Drew	Harder	Bramkarz	1999-10-03	200	52229059
2544	Andrzej	Pekagnan	Bramkarz	1988-07-07	184	13011198
2545	Alvaro	Cohen	Obrońca	1978-05-24	168	69779833
2546	Katarzyna	Uprovski	Bramkarz	2016-12-25	197	20301293
2547	Anne	Duvall	Pomocnik	2004-01-09	190	65738259
2548	Bess	Harder	Pomocnik	1976-01-27	175	\N
2549	Luka	Yinger	Pomocnik	1994-01-28	170	36184648
2550	Jamie	Daley	Obrońca	2002-05-02	182	90425556
2551	Isaac	Scheffold	Bramkarz	1991-05-17	182	\N
2552	Mick	Blount	Obrońca	2005-08-28	173	\N
2553	Marieke	DeWilde	Napastnik	2008-02-02	197	33964072
2554	Fabian	Botsik	Bramkarz	2017-09-06	162	14665810
2555	Michel	Symbouras	Pomocnik	2003-02-02	163	\N
2556	Sem	Anderson	Bramkarz	1996-12-26	175	523584
2557	Pieter	Cantere	Obrońca	1995-02-11	171	20215483
2558	Edwina	Millikin	Bramkarz	2014-06-14	161	\N
2559	Ana	Morton	Napastnik	1986-09-15	169	40347929
2560	Luka	Martin	Obrońca	1984-01-20	180	35512486
2561	Fabian	Gonzalez	Pomocnik	2009-05-31	167	84081104
2562	Herman	Mayberry	Bramkarz	1977-10-30	175	41718057
2563	Ivan	Polti	Obrońca	2000-03-22	180	82096689
2564	Ben	Cooper	Napastnik	1976-05-02	193	27927384
2565	Elin	Mitchell	Napastnik	1998-06-12	176	30114756
2566	Marco	Hankins	Pomocnik	2001-11-16	173	96281782
2567	Rick	Rivers	Obrońca	2019-10-07	199	45416984
2568	Milan	Ratliff	Napastnik	2017-03-07	170	6025597
2569	Kees	Harder	Obrońca	1989-10-28	166	49241448
2570	Rob	Jones	Obrońca	2002-11-23	191	14333135
2571	Charlotte	Harder	Napastnik	2004-08-22	166	48953540
2572	Steph	Lamere	Bramkarz	2002-09-26	197	\N
2573	Steve	Noteboom	Bramkarz	1992-05-17	170	78677017
2574	Jaclyn	Ahlgren	Pomocnik	1993-03-03	160	55217261
2575	Sally	Waddell	Pomocnik	2011-04-27	184	91583046
2576	Ben	Queen	Napastnik	1985-05-15	167	18668124
2577	Eleanor	Jones	Pomocnik	1977-10-23	174	71644003
2578	Paul	Hardoon	Pomocnik	1988-04-22	197	54205586
2579	Mart	Glanswol	Pomocnik	1999-09-15	189	\N
2580	Malgorzata	Blount	Obrońca	1982-02-27	181	33869082
2581	Giel	Voigt	Napastnik	1997-08-12	186	\N
2582	Carla	Visentini	Obrońca	1987-09-10	167	\N
2583	Steven	Moore	Bramkarz	2001-03-16	172	\N
2584	Kim	McCormick	Obrońca	2007-05-09	196	85281130
2585	Vanessa	Gerschkow	Napastnik	2011-01-30	173	69845794
2586	Vincent	Ostanik	Pomocnik	2006-08-17	185	98321642
2587	Nicoline	Sakurai	Pomocnik	1985-07-22	195	\N
2588	Tyler	Millikin	Napastnik	2013-05-16	192	85182909
2589	Madison	Waddell	Napastnik	2010-11-16	175	5172636
2590	Kimberly	McCrary	Obrońca	1975-02-25	176	27056469
2591	Hank	Langham\t	Bramkarz	2011-07-17	174	53427477
2592	Sergio	Comeau	Napastnik	1975-10-26	160	841992
2593	Javier	Slemp	Pomocnik	1986-12-09	193	90361151
2594	Camila	Stevens	Obrońca	1977-09-14	198	82287558
2595	Martin	Anthony	Napastnik	2003-03-07	194	15623088
2596	Pieter	Koss	Bramkarz	1994-10-22	179	55942928
2597	Tony	Climent	Pomocnik	1985-12-19	172	\N
2598	Scott	Weaver	Bramkarz	1992-11-22	177	\N
2599	Peggy	Weaver	Bramkarz	2000-01-18	192	13471774
2600	Bob	McDaniel	Pomocnik	1997-01-09	194	96427607
2601	Claudia	Paul	Napastnik	1993-04-21	172	35534777
2602	Steve	Petrzelka	Pomocnik	1996-04-03	200	55695627
2603	Coby	Moon	Bramkarz	2007-05-13	180	25914683
2604	Gerrit	Rauch	Pomocnik	2005-02-01	181	\N
2605	Ashley	Jones	Napastnik	1998-06-25	179	64031234
2606	Coby	Koss	Pomocnik	1985-02-03	169	\N
2607	Izzy	Prior	Bramkarz	2016-10-13	171	16459426
2608	Sophie	Kidd	Pomocnik	1990-04-06	186	85462108
2609	Albert	Dulisse	Pomocnik	1975-05-31	190	59865114
2610	Pauline	Bryant	Bramkarz	1993-02-12	199	\N
2611	Liam	Helfrich	Pomocnik	2007-07-14	176	54238663
2612	Louise	Pierce	Obrońca	1977-09-05	172	\N
2613	Marek	Ionescu	Pomocnik	2011-02-06	193	12098012
2614	Maximilian	Boyer	Pomocnik	2013-09-25	182	87058190
2615	Joseph	Ditmanen	Pomocnik	2006-01-10	195	\N
2616	Jim	Plantz	Napastnik	2003-09-30	193	40598227
2617	Sophia	Noteboom	Bramkarz	1989-11-25	195	\N
2618	Petra	Knopp	Napastnik	1981-11-07	182	\N
2619	Oliver	McCormick	Napastnik	1989-01-09	196	54377376
2620	Ainhoa	Deleo	Obrońca	1980-02-25	164	\N
2621	Kees	Ray	Napastnik	1985-05-08	172	2898958
2622	Maggie	Hopper	Napastnik	1998-04-03	182	88017528
2623	Gert	Royal	Pomocnik	1979-11-07	182	37565464
2624	Henk	Aldritch	Napastnik	2018-06-06	164	1729190
2625	Kay	Mulders	Pomocnik	1988-10-23	163	87670901
2626	Syd	Wong	Obrońca	1992-08-27	189	97352439
2627	Cristian	Phelps	Bramkarz	2009-02-25	183	90084901
2628	Camille	Lawton	Obrońca	2008-01-24	199	44163518
2629	Steph	Igolavski	Napastnik	1994-04-10	177	\N
2630	Stanislaw	Morgan	Obrońca	1996-05-23	191	38545790
2631	Lucy	Uprovski	Obrońca	1983-07-08	185	\N
2632	Sarah	Queen	Obrońca	1988-02-18	177	14632246
2633	Alex	Daley	Pomocnik	1999-07-10	164	28135291
2634	Phil	Barnett	Obrońca	2012-12-18	172	79542224
2635	Robert	Bogdanovich	Bramkarz	1985-10-23	189	30393157
2636	Florian	LeGrand	Obrońca	2019-08-31	186	\N
2637	Max	Linhart	Napastnik	2002-02-02	174	73007537
2638	Liza	Tudisco	Napastnik	1987-07-31	180	\N
2639	Michel	Symbouras	Bramkarz	1998-01-31	180	18376394
2640	Mathilde	Millis	Pomocnik	2014-12-07	192	81039929
2641	Edwin	Waddell	Napastnik	2017-10-05	196	29634252
2642	Klara	Linton	Pomocnik	1991-02-09	179	\N
2643	Patty	Beckbau	Bramkarz	2003-08-18	168	83404073
2644	Florian	Bogdanovich	Pomocnik	2001-12-15	200	12252197
2645	Jorge	Pickering	Napastnik	2015-04-18	168	20762328
2646	Wilma	Fernandez	Obrońca	2005-05-08	183	\N
2647	Edwyn	Phelps	Obrońca	1998-10-07	190	14576381
2648	Hiram	Haynes	Bramkarz	1979-11-23	181	84555958
2649	Toon	Van Dinter	Pomocnik	2018-01-17	184	\N
2650	Rob	Depew	Bramkarz	2019-08-23	190	27530756
2651	Paul	Liddle	Bramkarz	2003-06-14	179	44188685
2652	Trevor	Beckbau	Bramkarz	1990-03-20	174	71884074
2653	Rik	Moore	Napastnik	1993-05-21	191	39400922
2654	Gabrielle	Julieze	Bramkarz	1986-03-07	163	99908257
2655	Sammy	Dittrich	Obrońca	2003-11-10	166	64128544
2656	Gill	Chwatal	Obrońca	2002-04-21	167	7898063
2657	Paula	Praeger	Obrońca	1989-10-30	170	14919562
2658	Viktor	Vanderoever	Bramkarz	2007-07-16	191	90427922
2659	Teun	Nithman	Pomocnik	1997-08-16	182	69759605
2660	Lucia	Fernandez	Pomocnik	1976-04-27	180	34409044
2661	Mathias	Beckbau	Pomocnik	1992-03-22	196	\N
2662	Femke	Knopp	Pomocnik	2018-04-19	187	87541368
2663	Shermie	Lejarette	Bramkarz	2015-10-05	165	56689183
2664	Vincent	Stevens	Obrońca	2016-07-26	161	\N
2665	Sergio	Wargula	Pomocnik	1983-03-03	192	26748772
2666	Lauren	Bugno	Bramkarz	2013-07-03	197	4434641
2667	Rob	Zia	Pomocnik	2014-07-29	180	68877567
2668	Gerrit	Daniel	Bramkarz	2002-12-09	181	66251746
2669	Nathan	Wood	Obrońca	1999-01-19	185	\N
2670	Ted	Bernstein	Bramkarz	1975-01-24	196	\N
2671	Mariska	Gonzalez	Bramkarz	1977-07-26	178	16937474
2672	Jacob	Overton	Napastnik	1987-12-18	161	1402476
2673	Scottie	Depew	Pomocnik	1988-11-28	168	99710562
2674	Andy	Francis	Napastnik	1990-05-01	199	15310190
2675	Robert	Roche	Obrońca	2012-11-30	181	83849618
2676	Lauren	Shapiro	Obrońca	2006-12-25	175	\N
2677	Nick	Braconi	Pomocnik	1976-09-28	166	\N
2678	Mariska	DelRosso	Pomocnik	2007-11-11	193	42368215
2679	Lukas	Phillips	Napastnik	2014-05-31	161	41907783
2680	Giel	Vostreys	Pomocnik	2019-11-27	186	\N
2681	Adrian	Ayers	Obrońca	1996-10-09	167	7296208
2682	Rachel	Makelaar	Obrońca	1997-05-20	165	33170481
2683	Sam	Brady	Pomocnik	1991-08-26	184	\N
2684	Andrea	Mcgrew	Bramkarz	2012-06-12	182	\N
2685	Sydney	Chwatal	Pomocnik	1979-04-02	161	47807213
2686	Lukas	Anderson	Obrońca	2019-08-01	160	78126840
2687	Jean	Ionescu	Obrońca	1988-07-10	198	26166295
2688	Cees	Swaine	Pomocnik	2011-11-07	160	65757964
2689	Babette	Arnold	Pomocnik	1997-03-17	162	9036810
2690	Sherman	Cramer	Bramkarz	2008-09-29	193	5897255
2691	Conor	van Goes	Napastnik	1991-02-23	187	55237341
2692	Sherman	Gonzalez	Pomocnik	1995-06-06	197	18617581
2693	Lucia	Katsekes	Bramkarz	1998-04-25	197	47657508
2694	Niklas	Maribarski	Napastnik	1997-09-01	179	22684836
2695	Adam	Grote	Obrońca	2008-12-08	179	84911035
2696	Rachel	Kingslan	Obrońca	2009-02-23	192	96138479
2697	Bert	Phelps	Pomocnik	2010-06-15	168	66976183
2698	JanCees	Watson	Bramkarz	1975-09-07	200	\N
2699	Anton	Johnson	Bramkarz	1978-02-22	179	31648071
2700	Megan	Climent	Pomocnik	1995-09-12	174	\N
2701	Luke	Ecchevarri	Obrońca	1997-04-21	197	21351392
2702	Joop	Phillips	Napastnik	2003-11-16	169	60322421
2703	Lukas	Moon	Napastnik	1990-05-11	179	32409540
2704	Alvaro	Phillips	Bramkarz	2012-08-18	199	\N
2705	Jozef	Anderson	Pomocnik	1976-06-13	189	50235966
2706	Scotty	Bryant	Napastnik	1996-04-17	165	51650229
2707	Raul	Sanders	Napastnik	1992-04-03	196	86521801
2708	Piotr	Goodnight	Napastnik	1995-07-11	184	40783158
2709	Samantha	Johnson	Obrońca	2016-11-30	195	97862120
2710	Sjanie	Brisco	Pomocnik	2002-10-07	183	52962366
2711	Victor	Caffray	Pomocnik	1986-05-25	174	56594068
2712	Julie	Gerschkow	Pomocnik	2014-03-18	163	61402184
2713	Olivia	Makelaar	Obrońca	2008-01-20	185	\N
2714	Carolina	Clark	Obrońca	2017-07-21	168	34906389
2715	Pedro	Grote	Bramkarz	2015-06-13	200	\N
2716	Miriam	Ray	Bramkarz	2007-06-05	182	77814226
2717	Emil	Crocetti	Pomocnik	2020-01-08	175	1606105
2718	Helen	Paul	Obrońca	1976-12-20	174	\N
2719	Ester	Linton	Bramkarz	2012-12-02	177	19696472
2720	Tomasz	Pyland	Pomocnik	2014-09-08	165	15888554
2721	Erik	Wakefield	Napastnik	1996-10-04	176	75271009
2722	Martin	Hollman	Bramkarz	2019-06-08	167	65570235
2723	Sergio	Heyn	Napastnik	1988-10-17	164	65092233
2724	Alba	Malone	Obrońca	2009-10-03	169	84429641
2725	Lena	Gildersleeve	Obrońca	2002-05-29	186	\N
2726	Joey	Gibson	Pomocnik	1999-02-19	195	\N
2727	Stanislaw	Anderson	Napastnik	1990-01-11	181	72548454
2728	Lia	Hedgecock	Pomocnik	1981-02-21	187	19074163
2729	Anna	Sirabella	Obrońca	1980-02-24	183	\N
2730	Katarzyna	Waldo	Pomocnik	1996-11-18	161	73368769
2731	Cathy	Anderson	Napastnik	1990-10-13	180	\N
2732	Sammy	Kepler	Napastnik	2014-04-13	161	59543045
2733	Pip	Ionescu	Napastnik	1993-08-16	167	94599632
2734	Julie	Langham\t	Obrońca	1998-05-15	181	14125764
2735	Lisa	Bitmacs	Pomocnik	1977-01-27	198	15499769
2736	Henry	Hoogbandt	Pomocnik	1980-04-28	168	14041842
2737	Lucia	Vostreys	Obrońca	1997-04-22	184	10082125
2738	Sherm	Leonarda	Bramkarz	2018-10-11	163	91998980
2739	Geoffery	Bryant	Pomocnik	1994-11-04	166	99818351
2740	Herbert	Arcadi	Obrońca	2003-02-09	163	46122612
2741	Jim	Arnold	Bramkarz	2008-04-12	194	\N
2742	Nathan	Zapetis	Obrońca	2012-10-05	165	\N
2743	Ollie	Depew	Obrońca	1977-04-14	172	\N
2744	Kim	Griffith	Napastnik	1978-01-19	180	4649427
2745	Klaas	Sterrett	Obrońca	2004-09-18	166	30181431
2746	Peggy	Gaskins	Obrońca	2011-01-23	190	11047667
2747	Alexander	McCrary	Pomocnik	1994-07-26	198	86763936
2748	Sydney	Raines	Pomocnik	1979-09-17	184	61075157
2749	Alba	Baltec	Pomocnik	2008-11-17	176	6677832
2750	Klaas	Symms	Napastnik	2004-10-15	197	11550173
2751	Sharon	Fox	Napastnik	2005-09-23	197	79808965
2752	Karen	Patricelli	Obrońca	1999-09-27	198	33450823
2753	Lena	Noteboom	Obrońca	2017-12-11	195	21575407
2754	Scott	DeBerg	Pomocnik	2009-04-25	181	51109782
2755	Rogier	Green	Napastnik	1985-11-18	196	99663659
2756	Rolla	Vanderoever	Obrońca	1991-03-19	184	87614516
2757	Hannah	Zurich	Napastnik	1985-12-06	171	54354277
2758	Jo	McCormick	Pomocnik	1993-06-19	196	43205666
2759	Maximilian	Gunter	Obrońca	2012-05-29	199	53900428
2760	Ewa	Van Dinter	Bramkarz	1982-03-20	182	2634018
2761	Andrzej	Sakurai	Pomocnik	1977-07-20	168	\N
2762	Daniel	Mitchell	Napastnik	1988-02-04	179	44697046
2763	Peggy	Wolpert	Bramkarz	1993-04-27	163	61936982
2764	Geoff	Royal	Obrońca	2000-11-25	172	98314580
2765	Nico	Morton	Obrońca	1996-09-23	161	\N
2766	Leonie	Martin	Bramkarz	2014-01-21	184	52206478
2767	Patty	Imhoff	Obrońca	2020-01-02	185	6550998
2768	Theo	Uitergeest	Napastnik	1994-06-05	177	64587337
2769	Ed	Ecchevarri	Bramkarz	1982-01-07	194	\N
2770	Lincoln	Spensley	Obrońca	1987-05-20	190	29918195
2771	Anton	Daughtery	Pomocnik	1980-06-22	193	\N
2772	Daniel	Knopp	Obrońca	1989-02-16	175	28704935
2773	Mario	Stockton	Pomocnik	2008-04-22	169	41071270
2774	Linnea	White	Bramkarz	2005-04-02	167	91820482
2775	Helma	Paddock	Pomocnik	1994-06-19	163	35341903
2776	Liam	Pekaban	Bramkarz	2002-03-09	169	17583102
2777	Lucy	Lamere	Pomocnik	1980-10-04	167	6333661
2778	Sergio	Linton	Obrońca	2018-07-18	172	8050643
2779	Syd	Matthew	Pomocnik	2006-08-30	172	67886148
2780	Bess	Krutkov	Obrońca	1982-07-06	160	78937756
2781	Kim	Anderson	Bramkarz	2012-11-03	180	26781163
2782	Camille	Jiminez	Bramkarz	2005-04-15	199	87827981
2783	Rik	Slocum	Bramkarz	1988-02-17	196	\N
2784	Adam	Wood	Napastnik	2009-09-13	179	\N
2785	Sofia	Glanswol	Napastnik	1987-04-12	163	88349975
2786	Mario	Matthew	Obrońca	1998-08-09	190	44260707
2787	Dave	Phelps	Bramkarz	2007-03-03	184	\N
2788	Jill	Francis	Bramkarz	2001-08-27	178	90395503
2789	Dave	Depew	Napastnik	1981-12-23	175	6212257
2790	Ron	Simonent	Napastnik	1983-08-22	175	\N
2791	Edwin	Linton	Bramkarz	1976-05-09	176	6204566
2792	Paul	Korkovski	Pomocnik	2001-10-30	169	57909437
2793	Jean	Jenssen	Pomocnik	2002-09-02	188	\N
2794	George	Poole	Napastnik	1980-04-04	179	12607854
2795	Rogier	Cain	Obrońca	2019-03-17	174	1396898
2796	Ike	Roger	Obrońca	1987-10-06	199	84544465
2797	Herbert	Watson	Bramkarz	1977-08-25	168	13323516
2798	Kimberly	Sharp	Napastnik	2011-06-25	173	72612523
2799	Hannah	Love	Pomocnik	1975-08-31	180	49084572
2800	Ada	van Dijk	Obrońca	2000-05-17	183	9408205
2801	GertJan	Naley	Bramkarz	1992-06-04	186	26330238
2802	Annie	Millikin	Pomocnik	1988-02-26	185	25410762
2803	Michael	King	Napastnik	1976-04-17	168	47335043
2804	Elzbieta	Symbouras	Napastnik	2012-06-19	178	\N
2805	Rick	Pekagnan	Napastnik	2012-02-06	164	77103382
2806	Leah	Sirabella	Obrońca	1997-09-29	169	62927775
2807	Isabel	Wolpert	Bramkarz	2015-10-19	174	\N
2808	David	van Goes	Bramkarz	1995-08-04	176	35655039
2809	JanCees	Alspaugh	Bramkarz	1988-04-15	165	\N
2810	Krzysztof	Anderson	Pomocnik	2014-05-13	194	35514276
2811	Marta	Anderson	Obrońca	2011-07-21	179	1097203
2812	Ike	Zurich	Napastnik	1992-07-19	171	76763194
2813	Leah	Brylle	Napastnik	2019-06-08	190	30723246
2814	Linnea	Hoogbandt	Pomocnik	2002-05-16	200	4756922
2815	Jules	Kidd	Bramkarz	1996-05-28	178	17234887
2816	Leo	Patricelli	Pomocnik	2001-06-03	193	\N
2817	Mathias	Imhoff	Pomocnik	1995-04-22	165	57884673
2818	Cristian	Arnold	Napastnik	1979-07-14	197	92924587
2819	Harold	Wicks	Napastnik	2018-04-24	197	\N
2820	Fons	Gua Lima	Napastnik	2017-10-16	183	31691498
2821	Alice	Roger	Pomocnik	1976-03-10	200	\N
2822	Sherman	Morton	Bramkarz	1984-02-09	177	38143698
2823	Mariska	DeBuck	Bramkarz	1992-06-22	162	70797246
2824	Sophie	Watson	Pomocnik	2003-12-20	181	\N
2825	Suzanne	Reames	Napastnik	2003-09-14	177	\N
2826	Bram	Wargula	Napastnik	2004-07-01	175	\N
2827	Rachel	Dulisse	Pomocnik	2018-04-19	173	93084717
2828	Piet	Dean	Pomocnik	1992-05-28	198	69468011
2829	Jolanda	Ijukop	Bramkarz	1984-05-25	194	10669398
2830	Jeanette	Herzog	Bramkarz	1993-11-09	163	\N
2831	Laura	Wood	Napastnik	2011-09-28	194	71872257
2832	Pablo	Brylle	Napastnik	1986-06-08	163	37063767
2833	Mick	Ijukop	Pomocnik	1994-12-30	171	21747934
2834	Femke	Kidd	Pomocnik	1993-11-01	163	42004764
2835	Barbara	Symms	Napastnik	2004-11-05	191	\N
2836	Joe	Nefos	Pomocnik	1975-06-30	195	\N
2837	Godfrey	Herring	Bramkarz	1993-10-30	166	45629066
2838	Trevor	DeWald	Obrońca	1977-09-19	181	92920144
2839	Isabelle	van Doorn	Bramkarz	1994-10-03	194	49739745
2840	Julian	Nadalin	Napastnik	2016-08-27	196	70048547
2841	Mariska	Sharp	Napastnik	2015-05-23	161	\N
2842	Ester	Linhart	Bramkarz	2008-09-19	188	79967988
2843	Tim	Lee	Obrońca	1975-01-25	198	18167000
2844	Magnus	Brown	Napastnik	1992-02-19	193	77643372
2845	Madison	Richter	Bramkarz	1992-06-26	200	29563147
2846	Ron	Fernandez	Obrońca	2005-12-20	200	13179619
2847	Mike	Foreman	Pomocnik	2020-01-04	174	29526231
2848	Guus	Seibel	Napastnik	1989-08-28	179	\N
2849	Suzanne	Brylle	Bramkarz	1984-10-12	165	13759024
2850	Peg	Arnold	Obrońca	1982-07-17	181	51760765
2851	Betty	Wesolowski	Pomocnik	2001-09-11	200	13675467
2852	Katie	Mulders	Pomocnik	2005-07-11	185	14209239
2853	Manuel	Koss	Bramkarz	1981-08-16	183	\N
2854	Isak	Paul	Obrońca	1992-06-12	197	94231940
2855	Giel	Wong	Bramkarz	1977-08-29	166	12381123
2856	Philip	Nahay	Pomocnik	1985-10-19	171	71760102
2857	Erin	Ayers	Napastnik	1999-03-09	177	87384384
2858	Sofia	Troher	Obrońca	1990-06-21	189	\N
2859	Paul	Hollman	Pomocnik	1977-11-12	170	\N
2860	Alba	Dittrich	Napastnik	2014-11-06	162	40685933
2861	Coby	Botsik	Obrońca	1978-11-14	162	64101644
2862	Marty	Wakefield	Pomocnik	1978-05-03	164	24842093
2863	Caroline	Linhart	Bramkarz	2000-12-28	191	80645034
2864	Alex	Pearlman	Pomocnik	1977-03-01	198	416266
2865	Catharine	Stockton	Pomocnik	2000-12-13	200	68782163
2866	Hanna	Oyler	Napastnik	2009-06-04	174	\N
2867	Edwina	Botsik	Bramkarz	2013-12-26	197	16277081
2868	Jill	Spensley	Pomocnik	1988-06-19	172	77155454
2869	Ciska	Wargula	Pomocnik	1981-02-27	179	88028090
2870	Niek	van Dijk	Bramkarz	1997-10-10	179	14267900
2871	Babet	Dulisse	Obrońca	2018-08-24	199	85915920
2872	Steve	Nithman	Bramkarz	1978-06-23	168	80424712
2873	Esther	Brennan	Pomocnik	1978-11-19	182	\N
2874	Peter	Griffioen	Obrońca	1995-02-04	171	7332267
2875	Hanna	Malone	Pomocnik	1983-11-10	173	402062
2876	Mick	Guyer	Napastnik	1991-03-05	183	28625859
2877	Jacob	White	Bramkarz	2005-12-11	199	73757733
2878	Gillian	Manson	Napastnik	1983-01-29	175	18901234
2879	Ron	Bitmacs	Pomocnik	2015-07-24	164	28431772
2880	Tom	Cappello	Pomocnik	2008-10-16	166	56734731
2881	Sophia	Reyes	Bramkarz	2004-10-21	160	98216187
2882	Gerrit	Naff	Bramkarz	1984-02-06	186	73436568
2883	Agnieszka	Jones	Pomocnik	1986-08-11	179	41160668
2884	Ivan	Ionescu	Obrońca	1978-12-03	185	95407457
2885	Max	Griffith	Bramkarz	1996-04-03	188	54810939
2886	Karen	Blount	Pomocnik	1988-05-23	169	80084617
2887	Tomasz	Conley	Obrońca	1994-12-28	173	\N
2888	Jeffery	Helbush	Bramkarz	2004-01-06	183	25852913
2889	Catherine	Moon	Pomocnik	1982-07-22	175	4083120
2890	Maaike	Cooper	Napastnik	1993-08-12	194	\N
2891	Pete	Newman	Bramkarz	2018-06-26	195	96776074
2892	Edwin	Krutkov	Bramkarz	2017-04-06	195	26380212
2893	Leo	Stockton	Pomocnik	1978-12-31	178	72750410
2894	Jesse	Polti	Pomocnik	2019-02-19	180	73795274
2895	Bill	Ray	Pomocnik	1995-06-10	173	74000323
2896	Elzbieta	Hendrix	Pomocnik	2019-03-02	164	\N
2897	Charles	Gua Lima	Bramkarz	2005-01-11	160	58380259
2898	Nienke	DeBuck	Bramkarz	1976-07-10	189	62325803
2899	Gert	Rivers	Pomocnik	1987-09-05	165	\N
2900	Victor	Pengilly	Bramkarz	1983-01-08	173	83293609
2901	Camilla	Glanswol	Obrońca	2004-04-29	162	\N
2902	Kim	Reyes	Bramkarz	1986-03-27	172	74219398
2903	Luka	Muench	Napastnik	1984-06-10	173	57202243
2904	Ivan	Anderson	Napastnik	1996-12-22	167	\N
2905	Marie	Martin	Bramkarz	2007-08-25	161	51939177
2906	Erik	Carlos	Bramkarz	2015-12-30	163	52507456
2907	Gert	Aldritch	Pomocnik	2014-01-27	183	95338924
2908	Kayleigh	Lawton	Napastnik	2002-11-03	179	77080092
2909	Fons	Jones	Bramkarz	1975-07-19	161	\N
2910	Oscar	Freed	Bramkarz	1986-06-01	175	34217064
2911	Sandra	van Goes	Pomocnik	1983-12-07	181	66014456
2912	Nick	Knopp	Bramkarz	2008-12-11	182	\N
2913	Helen	Wooten	Napastnik	1986-04-11	182	83771712
2914	Christopher	Helbush	Obrońca	1976-08-20	179	66624431
2915	Nick	Pickering	Bramkarz	1985-02-23	180	8165471
2916	Ida	Anderson	Napastnik	2004-12-03	186	\N
2917	Jim	Gaskins	Pomocnik	1995-11-18	174	34260724
2918	Piotr	Ionescu	Pomocnik	2002-06-02	188	32762237
2919	Gabbie	Wood	Napastnik	1976-01-12	162	47435158
2920	Andrew	Orcutt	Napastnik	2000-05-19	183	\N
2921	Dorothy	Lawton	Bramkarz	1990-10-24	168	52542016
2922	Leon	Knight	Pomocnik	2003-08-09	172	44581789
2923	Esther	Langham\t	Pomocnik	2016-12-27	186	56102058
2924	Rich	Yinger	Pomocnik	1998-05-26	163	84093168
2925	Mart	Duvall	Bramkarz	1989-12-26	183	\N
2926	Stephen	Comeau	Pomocnik	2004-09-30	161	87837047
2927	Trevor	Prior	Obrońca	1991-12-06	187	47109620
2928	Syd	Griffith	Pomocnik	1999-12-08	177	74005397
2929	Marty	Donatelli	Pomocnik	1999-12-05	184	\N
2930	Jo	Hardoon	Bramkarz	2014-06-10	173	\N
2931	Jeanette	Daniel	Obrońca	2002-02-13	198	77584777
2932	Tyler	Davis	Bramkarz	2018-06-16	160	94971461
2933	Ruth	Pierce	Napastnik	1994-11-23	182	44130921
2934	Stanislaw	Chwatal	Napastnik	2016-11-16	166	93202732
2935	Sarah	Trainor	Napastnik	1982-07-29	195	\N
2936	Barbara	Hulshof	Napastnik	2012-03-11	180	\N
2937	Pauline	Sakurai	Bramkarz	2017-03-03	182	\N
2938	Margo	Pekaban	Bramkarz	1983-11-07	197	2279933
2939	Patty	Angarano	Obrońca	2013-04-30	164	30007494
2940	Raul	Polti	Pomocnik	2000-12-04	170	65956841
2941	Joop	Herzog	Pomocnik	1983-01-14	174	74831026
2942	Ruth	Turk	Napastnik	2006-03-22	168	81675342
2943	Karen	Seibel	Pomocnik	1979-03-19	194	42000959
2944	Piotr	Igolavski	Napastnik	2003-10-10	189	31095436
2945	Katharina	Jones	Bramkarz	1995-02-03	182	89282346
2946	Andrea	Gonzalez	Pomocnik	1982-12-22	186	701336
2947	Rasmus	Stockton	Bramkarz	2016-08-01	179	\N
2948	Florian	Poole	Napastnik	1989-08-09	165	81002945
2949	Johnny	Hoogbandt	Bramkarz	2010-01-09	191	25951773
2950	Ester	Bright	Bramkarz	1993-04-10	162	69100034
2951	Sherman	Makelaar	Obrońca	1976-07-11	199	90206274
2952	Ricardo	Storrs	Bramkarz	2007-07-22	175	65889940
2953	Ana	Praeger	Pomocnik	2017-05-22	197	97411863
2954	Dirk	Gerschkow	Bramkarz	2017-07-10	195	67030836
2955	Zofia	Ray	Pomocnik	2001-10-11	182	64158484
2956	Jesse	Poissant	Obrońca	1996-11-01	191	95476929
2957	Pip	Poole	Obrońca	1984-09-12	191	63946820
2958	Viktor	Waldo	Bramkarz	1990-02-21	173	23410663
2959	Lars	Brendjens	Bramkarz	2009-11-03	180	4479581
2960	Marie	Johnson	Bramkarz	2001-07-22	175	24876637
2961	Mario	Massingill	Obrońca	1997-10-19	180	56334494
2962	Ada	Roche	Napastnik	1995-12-04	197	\N
2963	Coby	Moore	Pomocnik	2004-06-04	177	\N
2964	Liza	Brown	Bramkarz	1982-03-07	185	\N
2965	Coby	Langham\t	Obrońca	2011-11-05	198	24054991
2966	Sophie	Uitergeest	Pomocnik	1987-09-05	188	98082904
2967	Rik	Ray	Napastnik	1999-09-15	166	18627315
2968	William	Olson	Obrońca	2007-11-05	177	95792525
2969	Peg	Love	Pomocnik	2011-07-11	179	1756648
2970	Theodore	Poissant	Napastnik	2012-08-15	179	75740187
2971	Izzy	Poole	Bramkarz	1986-05-03	164	78163474
2972	Cath	Richter	Bramkarz	1991-03-27	164	43160209
2973	Marty	Morton	Obrońca	1995-05-09	182	79852894
2974	Taylor	Moon	Bramkarz	2003-04-02	182	\N
2975	Pete	Cramer	Obrońca	2004-05-13	166	91170969
2976	Jan	Jones	Bramkarz	1980-06-12	176	91991512
2977	Isabel	Pyland	Napastnik	1981-09-06	170	39613411
2978	Victor	Polti	Bramkarz	2015-12-13	178	8786576
2979	Herb	Freed	Napastnik	1987-09-14	166	68526678
2980	Ivan	Zurich	Pomocnik	1988-11-07	193	70130842
2981	Chris	Lee	Obrońca	1997-06-18	166	73935417
2982	Erin	Bruno	Napastnik	2013-01-18	160	89584522
2983	Hannah	Helfrich	Bramkarz	2001-05-15	171	\N
2984	Sanne	King	Pomocnik	1998-08-25	191	68596147
2985	Julie	Nithman	Obrońca	1999-03-07	165	83919774
2986	Maaike	Thompson	Pomocnik	1989-03-06	187	46929635
2987	Matthew	Guyer	Napastnik	2010-01-09	176	72938274
2988	Edward	Harness	Obrońca	1986-08-07	161	\N
2989	Mart	Mayberry	Pomocnik	2013-03-18	160	90026874
2990	Tommy	Chwatal	Obrońca	1996-07-11	190	11210995
2991	Chuck	Morton	Pomocnik	2003-11-25	197	41895769
2992	Alvaro	Hollman	Bramkarz	1980-11-11	161	30162887
2993	Pablo	Slocum	Napastnik	1994-06-13	180	79843167
2994	Tim	Lamere	Obrońca	2004-05-03	185	33915615
2995	Herb	Hankins	Obrońca	2013-12-10	179	1249258
2996	Siska	Schubert	Obrońca	1975-09-04	161	24789245
2997	Cath	Blacher	Bramkarz	2000-10-05	196	88757023
2998	Jolanda	Vostreys	Obrońca	1982-04-09	198	6319179
2999	Eleanor	Willis	Napastnik	2013-06-25	192	\N
3000	Milan	Igolavski	Napastnik	2018-04-29	164	20603149
3001	Dave	Lejarette	Napastnik	1998-06-02	194	13508085
3002	Dirk	Willis	Pomocnik	2009-02-28	164	21494278
3003	Lu	Wakefield	Bramkarz	1978-08-31	170	9527623
3004	Teddy	Watson	Napastnik	2004-09-21	189	\N
3005	Kayleigh	Blount	Bramkarz	2012-06-01	167	89968926
3006	Alba	Wesolowski	Napastnik	1988-12-16	162	52829156
3007	Kay	Ditmanen	Obrońca	2011-07-13	191	13835258
3008	Mathilde	King	Pomocnik	2005-12-10	192	67825799
3009	Leonie	Symms	Obrońca	1995-07-28	181	69142752
3010	Tomas	Cantere	Obrońca	1986-04-18	185	69401706
3011	Viktor	Linhart	Bramkarz	2000-08-16	189	83067920
3012	Miriam	Wilson	Napastnik	1996-11-09	185	\N
3013	Izzy	Gunter	Bramkarz	2003-10-10	173	84595455
3014	Susan	Waldo	Pomocnik	1989-03-01	188	\N
3015	Camila	Grote	Pomocnik	1991-11-26	192	35913044
3016	Jaclyn	Zia	Napastnik	1992-06-22	170	69137452
3017	Andrzej	Langham\t	Napastnik	2015-12-07	177	74646292
3018	Marty	Franklin	Obrońca	2009-01-06	194	\N
3019	Joop	Knight	Pomocnik	2019-02-01	188	89727529
3020	Lucia	Zurich	Bramkarz	2006-05-06	160	89918291
3021	Andrzej	Sirabella	Obrońca	2014-12-22	174	69502840
3022	Rick	Schmidt	Bramkarz	2018-01-16	187	\N
3023	Lincoln	Linhart	Obrońca	1996-04-24	191	34346181
3024	Toon	Moore	Bramkarz	2011-05-28	197	69817967
3025	Henk	Ecchevarri	Bramkarz	1997-08-08	177	23077703
3026	Henry	Wesolowski	Pomocnik	1991-02-28	173	10470384
3027	Joop	Bruno	Obrońca	1985-03-09	162	80914322
3028	Dylan	DelRosso	Bramkarz	2005-11-05	187	46361276
3029	Jesse	Byrnes	Obrońca	1991-11-15	177	49183685
3030	Liam	Howe	Napastnik	2003-04-03	189	53030208
3031	Ana	Herring	Napastnik	1977-09-21	163	72201436
3032	Andy	Van Toorenbeek	Obrońca	2012-02-02	174	16213206
3033	Lena	Lamere	Napastnik	2012-06-04	188	13096634
3034	Ana	Wesolowski	Napastnik	1995-07-05	169	77965575
3035	Pedro	Goodnight	Napastnik	1991-08-28	191	77947224
3036	Jacob	Yinger	Pomocnik	2000-09-19	180	9502727
3037	Javier	Daley	Napastnik	2012-05-30	177	6851393
3038	Aoife	Herzog	Bramkarz	1980-11-22	195	74560376
3039	Sue	Heyn	Napastnik	2008-01-28	173	51569093
3040	Megan	Poissant	Napastnik	2014-09-13	167	86031475
3041	Nicoline	Millis	Napastnik	1975-04-02	185	46756037
3042	Henk	Brennan	Obrońca	2013-10-06	170	46704313
3043	Dirk	Zimmerman	Napastnik	2011-12-07	171	97917811
3044	Vanessa	Duvall	Bramkarz	1991-05-14	181	81491563
3045	Pete	Bright	Bramkarz	2012-07-12	161	15871646
3046	PieterJan	Walker	Napastnik	2002-04-13	184	\N
3047	Mick	Franklin	Bramkarz	1982-05-21	195	77841854
3048	Ivan	Goodnight	Pomocnik	2016-03-15	187	2185165
3049	Rachel	Frega	Pomocnik	1976-04-21	180	86367467
3050	Rick	Krutkov	Napastnik	2008-09-08	189	77035940
3051	Hank	Weinstein	Pomocnik	2012-11-11	170	\N
3052	Alvaro	Anderson	Napastnik	2003-07-19	187	7903181
3053	Scotty	Dittrich	Pomocnik	1977-10-11	193	\N
3054	Ana	DeBerg	Obrońca	1980-09-23	171	\N
3055	GertJan	Jessen	Pomocnik	2004-04-19	161	\N
3056	Daniel	Pekaban	Pomocnik	1993-11-28	197	17961121
3057	Scotty	Cramer	Bramkarz	2012-05-27	173	14485882
3058	Gabbie	Korkovski	Obrońca	2015-11-14	173	\N
3059	Harry	Pengilly	Pomocnik	1980-10-14	198	11843340
3060	Matthijs	Makelaar	Bramkarz	2006-04-06	169	68965086
3061	Maaike	Patricelli	Pomocnik	2012-08-17	168	\N
3062	Ida	Gieske	Pomocnik	1991-08-16	199	69420947
3063	Will	Haynes	Napastnik	2008-12-26	186	92312848
3064	Herbert	Deans	Napastnik	1983-08-05	192	86652043
3065	Emil	DeBuck	Bramkarz	1999-11-15	182	51669882
3066	Thomas	Ionescu	Napastnik	2009-10-08	180	40871109
3067	Ted	Otto	Bramkarz	2008-10-21	172	62828760
3068	Julian	Mitchell	Obrońca	1999-06-05	195	44910671
3069	Sara	Hollman	Pomocnik	1981-07-29	182	52723631
3070	Lucy	Antonucci	Pomocnik	2009-08-06	192	17776695
3071	Philip	Schmidt	Obrońca	1993-12-10	191	\N
3072	Paula	Phelps	Obrońca	1978-03-03	179	15530501
3073	Ewa	Cain	Obrońca	1979-08-16	197	\N
3074	Jolanda	Nelson	Napastnik	1986-06-17	182	75906139
3075	Juan	Anderson	Pomocnik	1998-02-20	168	37386993
3076	Lucy	Morgan	Napastnik	1987-07-16	163	85221019
3077	Nick	Knight	Bramkarz	1981-01-09	181	68914548
3078	Liam	Otto	Bramkarz	1975-06-21	185	\N
3079	Zoe	Clarke	Obrońca	2012-11-22	179	28090694
3080	Matthijs	Stannard	Obrońca	2013-03-14	200	91143674
3081	Luis	Wood	Napastnik	1991-11-15	180	\N
3082	Cath	Wong	Pomocnik	2016-04-04	162	\N
3083	Talita	Bright	Pomocnik	2004-08-28	164	84411228
3084	Caroline	Kingslan	Napastnik	2019-01-15	200	36393504
3085	Petra	Friedman	Obrońca	1984-03-23	188	68304394
3086	Erik	Cross	Obrońca	1980-11-09	167	8288152
3087	Oliver	Linhart	Pomocnik	2008-10-02	169	\N
3088	Sherm	Heyn	Obrońca	2019-07-13	168	80248271
3089	Kees	Royal	Pomocnik	2013-04-12	177	\N
3090	Isabel	Weinstein	Napastnik	2010-11-20	190	45146659
3091	Piet	Nahay	Obrońca	1980-09-01	169	73999028
3092	Nienke	Arcadi	Napastnik	2020-01-12	165	93009480
3093	Caroline	McCrary	Bramkarz	1987-12-21	167	66306513
3094	Nicolas	Schlee	Pomocnik	1989-12-23	173	82707675
3095	Kaylee	Novratni	Bramkarz	2004-10-12	188	63913437
3096	Lucia	Pierce	Obrońca	1995-03-21	193	18238419
3097	Teun	Wesolowski	Pomocnik	1990-07-07	171	45722817
3098	Lucas	Blacher	Pomocnik	2006-01-16	191	29963964
3099	GertJan	Clarke	Napastnik	1999-04-18	193	10756906
3100	Babet	Stannard	Bramkarz	1981-09-01	190	75302438
3101	Roger	Wood	Obrońca	2012-07-21	195	6897700
3102	Sophie	Davis	Napastnik	1979-03-07	194	73639098
3103	Co	Martin	Obrońca	1993-07-06	200	\N
3104	Alva	Mariojnisk	Obrońca	1980-02-25	192	\N
3105	Sharon	Fox	Bramkarz	1993-05-22	166	38056794
3106	Helma	Blount	Bramkarz	2009-01-20	183	98943502
3107	Rasmus	King	Napastnik	1988-07-30	170	53977863
3108	Patricia	Sterrett	Napastnik	1996-05-15	195	\N
3109	Raul	Weinstein	Obrońca	1991-01-27	178	\N
3110	Anthony	Plantz	Obrońca	1989-12-15	192	51542600
3111	John	Bruno	Bramkarz	2012-08-23	197	\N
3112	Margo	Helfrich	Pomocnik	1991-08-01	180	47865640
3113	Elena	Freed	Bramkarz	1990-02-05	189	17376922
3114	Steven	Hulshof	Bramkarz	1999-12-21	191	\N
3115	Julie	Mitchell	Pomocnik	1998-05-25	192	12192978
3116	Lucas	Ahlgren	Napastnik	1990-04-06	195	94978097
3117	Cecilie	Petterson	Napastnik	2007-07-31	186	9846370
3118	Emily	Richter	Bramkarz	1979-08-20	168	13255025
3119	Tyler	Cantere	Napastnik	2008-12-06	171	95623114
3120	Geoff	Alspaugh	Obrońca	2001-12-20	196	12596953
3121	Bram	Durso	Obrońca	1994-06-18	194	95032109
3122	Kayleigh	Foreman	Bramkarz	2009-03-12	194	96002937
3123	Ada	Guyer	Bramkarz	2000-04-01	165	54340631
3124	Truus	Brumley	Pomocnik	1993-01-31	193	\N
3125	Agnieszka	Gua Lima	Pomocnik	2015-10-23	196	78268094
3126	Cristina	Pearlman	Bramkarz	1994-12-28	188	68076644
3127	Ashley	Slemp	Napastnik	1981-10-22	176	44291736
3128	Matt	McDaniel	Napastnik	2017-10-16	165	5109762
3129	Ed	Dulisse	Bramkarz	1979-05-15	169	27826182
3130	Katie	Spensley	Pomocnik	1999-02-24	196	84187936
3131	Pawel	Helfrich	Obrońca	1986-09-02	189	7812651
3132	Jose	Seibel	Napastnik	1992-09-25	186	38574904
3133	Alexander	Cohen	Pomocnik	1976-07-01	186	53686294
3134	Cian	Meterson	Pomocnik	1995-09-28	182	37469022
3135	Luca	van Doorn	Bramkarz	2003-02-11	199	64239700
3136	Lucille	Young	Obrońca	1999-05-20	178	30907570
3137	Samuel	van Doorn	Napastnik	1999-05-28	192	11500047
3138	Joanne	Kuehn	Pomocnik	1994-04-29	194	56453678
3139	Toon	Forsberg	Bramkarz	2019-12-23	160	43709722
3140	Gillian	Goodman	Bramkarz	1979-04-21	177	84553412
3141	Samantha	Vanderoever	Bramkarz	2017-04-06	189	91251576
3142	Ted	Newman	Obrońca	1998-06-02	193	88602771
3143	Jozef	Cramer	Pomocnik	2010-08-31	161	23284838
3144	Thelma	Moore	Bramkarz	1981-02-03	198	66846129
3145	Nate	Goodnight	Obrońca	1993-02-28	172	\N
3146	Callum	Gonzalez	Obrońca	2003-11-28	160	10992692
3147	Rolla	Brendjens	Napastnik	1977-10-29	180	\N
3148	Matthijs	Hummel	Napastnik	1985-05-27	186	\N
3149	Mary	Dean	Pomocnik	1988-10-04	169	72644211
3150	Christa	Forsberg	Napastnik	1979-02-12	197	\N
3151	Niklas	Mejia	Bramkarz	1999-05-15	165	11914931
\.


--
-- TOC entry 3331 (class 0 OID 203525)
-- Dependencies: 239
-- Data for Name: Zawodnik_klubu; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league."Zawodnik_klubu" (id_zawodnika, id_klubu) FROM stdin;
2258	5
2963	20
2246	11
366	2
1526	16
2231	13
1680	7
112	4
1786	20
1409	1
2105	16
1042	5
389	14
2908	8
95	14
2784	12
2508	13
1054	14
544	9
405	10
1749	2
1377	19
753	12
418	11
2202	12
1826	17
938	7
1720	17
924	15
1934	2
2196	6
1469	20
2861	3
904	2
888	17
1895	9
2218	6
2654	8
473	1
59	4
2248	13
777	14
1780	9
2537	9
1494	10
456	7
1703	17
2048	15
461	6
2307	6
2230	8
829	5
955	14
2380	20
500	12
1986	5
2826	9
249	5
1318	5
189	9
86	11
363	5
633	15
140	17
1401	4
28	4
2467	14
1682	18
2402	15
987	1
2057	18
1368	13
793	17
197	20
1429	8
960	6
1900	9
2554	17
423	4
1870	14
2658	12
1548	13
2145	15
536	15
2034	9
2862	2
2860	15
2737	4
1891	13
902	9
2319	14
2843	4
1284	3
1271	18
1532	17
9	1
2194	12
2174	13
2969	16
297	19
\.


--
-- TOC entry 3349 (class 0 OID 203634)
-- Dependencies: 257
-- Data for Name: rodzaje_wydarzen; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league.rodzaje_wydarzen (id_wydarzenia, nazwa_wydarzenia) FROM stdin;
1	Puszczona bramka
2	Bramka
3	Asysta
4	Żółta kartka
5	Faul
6	Czerwona kartka
\.


--
-- TOC entry 3348 (class 0 OID 203629)
-- Dependencies: 256
-- Data for Name: sklad_gosci; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league.sklad_gosci (id_gospodarza, id_goscia, id_zawodnika, id_meczu, rezerwa) FROM stdin;
\.


--
-- TOC entry 3347 (class 0 OID 203624)
-- Dependencies: 255
-- Data for Name: sklad_gosp; Type: TABLE DATA; Schema: premier_league; Owner: 2019_gebica_rafal
--

COPY premier_league.sklad_gosp (id_gospodarza, id_goscia, id_zawodnika, id_meczu, rezerwa) FROM stdin;
\.


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 240
-- Name: Klub_id_klubu_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Klub_id_klubu_seq"', 1, false);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 253
-- Name: Komentarze_id_komentarza_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Komentarze_id_komentarza_seq"', 1, false);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 245
-- Name: Mecz_id_meczu_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Mecz_id_meczu_seq"', 1, false);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 247
-- Name: Sedziowie_id_sedziego_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Sedziowie_id_sedziego_seq"', 1, false);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 249
-- Name: Stadion_id_stadionu_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Stadion_id_stadionu_seq"', 1, false);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 242
-- Name: Trener_id_trenera_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Trener_id_trenera_seq"', 3, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 251
-- Name: Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Wykluczeni_zawodnicy_id_wyklucznych_zawodnikow_seq"', 1, false);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 259
-- Name: Zawodnik1_id_zawodnika_seq; Type: SEQUENCE SET; Schema: premier_league; Owner: 2019_gebica_rafal
--

SELECT pg_catalog.setval('premier_league."Zawodnik1_id_zawodnika_seq"', 1, false);


--
-- TOC entry 3167 (class 2606 OID 203584)
-- Name: Mecz Key1; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Key1" UNIQUE (id_meczu);


--
-- TOC entry 3169 (class 2606 OID 203586)
-- Name: Mecz Key2; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Key2" UNIQUE (sedzia_id_sedziego, nr_kolejki);


--
-- TOC entry 3152 (class 2606 OID 203546)
-- Name: Klub PK_Klub; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Klub"
    ADD CONSTRAINT "PK_Klub" PRIMARY KEY (id_klubu);


--
-- TOC entry 3180 (class 2606 OID 203623)
-- Name: Komentarze PK_Komentarze; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Komentarze"
    ADD CONSTRAINT "PK_Komentarze" PRIMARY KEY (id_komentarza);


--
-- TOC entry 3171 (class 2606 OID 203582)
-- Name: Mecz PK_Mecz; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "PK_Mecz" PRIMARY KEY (id_gospodarza, id_goscia, id_meczu);


--
-- TOC entry 3173 (class 2606 OID 203594)
-- Name: Sedziowie PK_Sedziowie; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Sedziowie"
    ADD CONSTRAINT "PK_Sedziowie" PRIMARY KEY (id_sedziego);


--
-- TOC entry 3175 (class 2606 OID 203603)
-- Name: Stadion PK_Stadion; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Stadion"
    ADD CONSTRAINT "PK_Stadion" PRIMARY KEY (id_stadionu);


--
-- TOC entry 3155 (class 2606 OID 203556)
-- Name: Trener PK_Trener; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Trener"
    ADD CONSTRAINT "PK_Trener" PRIMARY KEY (id_trenera);


--
-- TOC entry 3160 (class 2606 OID 203565)
-- Name: Wydarzenia_meczowe_gosci PK_Wydarzenia_meczowe_gosci; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wydarzenia_meczowe_gosci"
    ADD CONSTRAINT "PK_Wydarzenia_meczowe_gosci" PRIMARY KEY (id_wydarzen_meczowych, id_zawodnika, id_gospodarza, id_goscia, id_meczu);


--
-- TOC entry 3189 (class 2606 OID 203648)
-- Name: Wydarzenia_meczowe_gospodarzy PK_Wydarzenia_meczowe_gospodarzy; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wydarzenia_meczowe_gospodarzy"
    ADD CONSTRAINT "PK_Wydarzenia_meczowe_gospodarzy" PRIMARY KEY (id_wydarzen_meczowych, id_zawodnika, id_gospodarza, id_goscia, id_meczu);


--
-- TOC entry 3177 (class 2606 OID 203614)
-- Name: Wykluczeni_zawodnicy PK_Wykluczeni_zawodnicy; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wykluczeni_zawodnicy"
    ADD CONSTRAINT "PK_Wykluczeni_zawodnicy" PRIMARY KEY (id_wyklucznych_zawodnikow, id_zawodnika, id_klubu);


--
-- TOC entry 3191 (class 2606 OID 203658)
-- Name: Zawodnik1 PK_Zawodnik1; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Zawodnik1"
    ADD CONSTRAINT "PK_Zawodnik1" PRIMARY KEY (id_zawodnika);


--
-- TOC entry 3150 (class 2606 OID 203530)
-- Name: Zawodnik_klubu PK_Zawodnik_klubu; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Zawodnik_klubu"
    ADD CONSTRAINT "PK_Zawodnik_klubu" PRIMARY KEY (id_zawodnika, id_klubu);


--
-- TOC entry 3186 (class 2606 OID 203641)
-- Name: rodzaje_wydarzen PK_rodzaje_wydarzen; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.rodzaje_wydarzen
    ADD CONSTRAINT "PK_rodzaje_wydarzen" PRIMARY KEY (id_wydarzenia);


--
-- TOC entry 3184 (class 2606 OID 203633)
-- Name: sklad_gosci PK_sklad_gosci; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.sklad_gosci
    ADD CONSTRAINT "PK_sklad_gosci" PRIMARY KEY (id_gospodarza, id_goscia, id_zawodnika, id_meczu);


--
-- TOC entry 3182 (class 2606 OID 203628)
-- Name: sklad_gosp PK_sklad_gosp; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.sklad_gosp
    ADD CONSTRAINT "PK_sklad_gosp" PRIMARY KEY (id_gospodarza, id_goscia, id_zawodnika, id_meczu);


--
-- TOC entry 3157 (class 2606 OID 203558)
-- Name: Trener id_trenera; Type: CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Trener"
    ADD CONSTRAINT id_trenera UNIQUE (id_trenera);


--
-- TOC entry 3187 (class 1259 OID 203646)
-- Name: IX_Relationship2; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Relationship2" ON premier_league."Wydarzenia_meczowe_gospodarzy" USING btree (id_wydarzenia);


--
-- TOC entry 3158 (class 1259 OID 203563)
-- Name: IX_Relationship21; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Relationship21" ON premier_league."Wydarzenia_meczowe_gosci" USING btree (id_wydarzenia);


--
-- TOC entry 3178 (class 1259 OID 203621)
-- Name: IX_Relationship31; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Relationship31" ON premier_league."Komentarze" USING btree (id_meczu);


--
-- TOC entry 3161 (class 1259 OID 203578)
-- Name: IX_Relationship37; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Relationship37" ON premier_league."Mecz" USING btree (sedzia_liniowy1);


--
-- TOC entry 3162 (class 1259 OID 203579)
-- Name: IX_Relationship50; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Relationship50" ON premier_league."Mecz" USING btree (sedzia_glowny);


--
-- TOC entry 3163 (class 1259 OID 203580)
-- Name: IX_Relationship52; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Relationship52" ON premier_league."Mecz" USING btree (sedzia_liniowy2);


--
-- TOC entry 3164 (class 1259 OID 203577)
-- Name: IX_Sedziowie; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Sedziowie" ON premier_league."Mecz" USING btree (sedzia_id_sedziego);


--
-- TOC entry 3165 (class 1259 OID 203576)
-- Name: IX_Stadion; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Stadion" ON premier_league."Mecz" USING btree (stadion_id_stadionu);


--
-- TOC entry 3153 (class 1259 OID 203554)
-- Name: IX_Trenuje; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE INDEX "IX_Trenuje" ON premier_league."Trener" USING btree (id_klubu);


--
-- TOC entry 3148 (class 1259 OID 203528)
-- Name: Index1; Type: INDEX; Schema: premier_league; Owner: 2019_gebica_rafal
--

CREATE UNIQUE INDEX "Index1" ON premier_league."Zawodnik_klubu" USING btree (id_zawodnika);


--
-- TOC entry 3193 (class 2606 OID 203659)
-- Name: Zawodnik_klubu Gra; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Zawodnik_klubu"
    ADD CONSTRAINT "Gra" FOREIGN KEY (id_klubu) REFERENCES premier_league."Klub"(id_klubu);


--
-- TOC entry 3205 (class 2606 OID 203684)
-- Name: Komentarze Komentarze; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Komentarze"
    ADD CONSTRAINT "Komentarze" FOREIGN KEY (id_meczu) REFERENCES premier_league."Mecz"(id_meczu);


--
-- TOC entry 3195 (class 2606 OID 203739)
-- Name: Wydarzenia_meczowe_gosci Relationship2; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wydarzenia_meczowe_gosci"
    ADD CONSTRAINT "Relationship2" FOREIGN KEY (id_wydarzenia) REFERENCES premier_league.rodzaje_wydarzen(id_wydarzenia);


--
-- TOC entry 3211 (class 2606 OID 203744)
-- Name: Wydarzenia_meczowe_gospodarzy Relationship3; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wydarzenia_meczowe_gospodarzy"
    ADD CONSTRAINT "Relationship3" FOREIGN KEY (id_gospodarza, id_goscia, id_zawodnika, id_meczu) REFERENCES premier_league.sklad_gosp(id_gospodarza, id_goscia, id_zawodnika, id_meczu);


--
-- TOC entry 3210 (class 2606 OID 203749)
-- Name: Wydarzenia_meczowe_gospodarzy Relationship4; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wydarzenia_meczowe_gospodarzy"
    ADD CONSTRAINT "Relationship4" FOREIGN KEY (id_wydarzenia) REFERENCES premier_league.rodzaje_wydarzen(id_wydarzenia);


--
-- TOC entry 3202 (class 2606 OID 203729)
-- Name: Mecz Sedzia_glowny; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Sedzia_glowny" FOREIGN KEY (sedzia_glowny) REFERENCES premier_league."Sedziowie"(id_sedziego);


--
-- TOC entry 3201 (class 2606 OID 203709)
-- Name: Mecz Sedzia_liniowy_1; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Sedzia_liniowy_1" FOREIGN KEY (sedzia_liniowy1) REFERENCES premier_league."Sedziowie"(id_sedziego);


--
-- TOC entry 3203 (class 2606 OID 203734)
-- Name: Mecz Sedzia_liniowy_2; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Sedzia_liniowy_2" FOREIGN KEY (sedzia_liniowy2) REFERENCES premier_league."Sedziowie"(id_sedziego);


--
-- TOC entry 3198 (class 2606 OID 203674)
-- Name: Mecz Sedziowie; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Sedziowie" FOREIGN KEY (sedzia_id_sedziego) REFERENCES premier_league."Sedziowie"(id_sedziego);


--
-- TOC entry 3197 (class 2606 OID 203669)
-- Name: Mecz Stadion; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT "Stadion" FOREIGN KEY (stadion_id_stadionu) REFERENCES premier_league."Stadion"(id_stadionu);


--
-- TOC entry 3194 (class 2606 OID 203664)
-- Name: Trener Trenuje; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Trener"
    ADD CONSTRAINT "Trenuje" FOREIGN KEY (id_klubu) REFERENCES premier_league."Klub"(id_klubu);


--
-- TOC entry 3196 (class 2606 OID 203724)
-- Name: Wydarzenia_meczowe_gosci Wydarzenia_goscie; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wydarzenia_meczowe_gosci"
    ADD CONSTRAINT "Wydarzenia_goscie" FOREIGN KEY (id_gospodarza, id_goscia, id_zawodnika, id_meczu) REFERENCES premier_league.sklad_gosci(id_gospodarza, id_goscia, id_zawodnika, id_meczu);


--
-- TOC entry 3204 (class 2606 OID 203679)
-- Name: Wykluczeni_zawodnicy Wykluczeni_zawodnicy; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Wykluczeni_zawodnicy"
    ADD CONSTRAINT "Wykluczeni_zawodnicy" FOREIGN KEY (id_zawodnika, id_klubu) REFERENCES premier_league."Zawodnik_klubu"(id_zawodnika, id_klubu);


--
-- TOC entry 3207 (class 2606 OID 203699)
-- Name: sklad_gosp goscie; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.sklad_gosp
    ADD CONSTRAINT goscie FOREIGN KEY (id_gospodarza, id_goscia, id_meczu) REFERENCES premier_league."Mecz"(id_gospodarza, id_goscia, id_meczu);


--
-- TOC entry 3209 (class 2606 OID 203714)
-- Name: sklad_gosci gospodarze; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.sklad_gosci
    ADD CONSTRAINT gospodarze FOREIGN KEY (id_gospodarza, id_goscia, id_meczu) REFERENCES premier_league."Mecz"(id_gospodarza, id_goscia, id_meczu);


--
-- TOC entry 3200 (class 2606 OID 203694)
-- Name: Mecz klub_gosci; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT klub_gosci FOREIGN KEY (id_goscia) REFERENCES premier_league."Klub"(id_klubu);


--
-- TOC entry 3199 (class 2606 OID 203689)
-- Name: Mecz klub_gosp; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Mecz"
    ADD CONSTRAINT klub_gosp FOREIGN KEY (id_gospodarza) REFERENCES premier_league."Klub"(id_klubu);


--
-- TOC entry 3192 (class 2606 OID 203754)
-- Name: Zawodnik_klubu przynalezy; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league."Zawodnik_klubu"
    ADD CONSTRAINT przynalezy FOREIGN KEY (id_zawodnika) REFERENCES premier_league."Zawodnik1"(id_zawodnika);


--
-- TOC entry 3208 (class 2606 OID 203719)
-- Name: sklad_gosci zawodnicy_gosci; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.sklad_gosci
    ADD CONSTRAINT zawodnicy_gosci FOREIGN KEY (id_zawodnika, id_goscia) REFERENCES premier_league."Zawodnik_klubu"(id_zawodnika, id_klubu);


--
-- TOC entry 3206 (class 2606 OID 203704)
-- Name: sklad_gosp zawodnicy_gospodarzy; Type: FK CONSTRAINT; Schema: premier_league; Owner: 2019_gebica_rafal
--

ALTER TABLE ONLY premier_league.sklad_gosp
    ADD CONSTRAINT zawodnicy_gospodarzy FOREIGN KEY (id_zawodnika, id_gospodarza) REFERENCES premier_league."Zawodnik_klubu"(id_zawodnika, id_klubu);


1. Zapytanie zwracające imie, nazwisko należacych do danego klubu  (nazwa_klubu)

CREATE VIEW zawodnik_klubu AS
select imie, nazwisko, nazwa_klubu from premier_league."Klub" 
inner join "Zawodnik_klubu" Zk on "Klub".id_klubu = Zk.id_klubu 
inner join "Zawodnik1" Z on Zk.id_zawodnika = Z.id_zawodnika 
order by nazwa_klubu

--------------------------------------------------------------------------------------------

2. Zapytanie zwracające imie, nazwisko trenera oraz prowadzony przez niego zespół

CREATE VIEW trener_klub AS
select imie, nazwisko, nazwa_klubu from premier_league."Trener" 
inner join "Klub" K on "Trener".id_klubu = K.id_klubu

--------------------------------------------------------------------------------------------

3. Zapytanie zwracające imie i nazwisko trenera którego zespół ma najwięcej zwycięstwo

CREATE VIEW najwiecej_zwyciestw AS
select imie, nazwisko, nazwa_klubu, liczba_zwycięstw from premier_league."Trener" 
inner join "Klub" K on "Trener".id_klubu = K.id_klubu order by liczba_zwycięstw desc

--------------------------------------------------------------------------------------------

4. Zapytanie zwracające imie i nazwisko zawodnika wykluczonego wraz z powodem oraz długością

CREATE VIEW zawodnik_klubu AS
select imie, nazwisko, rodzaj_wykluczenia, dlugosc_wykluczenia from premier_league."Zawodnik1" 
inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika 
inner join "Wykluczeni_zawodnicy" Wz on Zk.id_zawodnika = Wz.id_zawodnika and Zk.id_klubu = Wz.id_klubu

--------------------------------------------------------------------------------------------

5. Wyświetelnie tabeli ligowej

CREATE VIEW tabela AS
select * from premier_league."Klub" as "Tabela ligowa" order by liczba_punktow, liczba_zwycięstw, bilans_bramek

--------------------------------------------------------------------------------------------

6. Zapytanie zwracające trenerów których pensja jest większa niż średnia pensja wszystkich trenerów

CREATE VIEW srednia_1 AS
select imie, nazwisko, pensja from premier_league."Trener" where (select avg(pensja) from premier_league."Trener") < pensja

CREATE VIEW srednia_2 AS
WITH srednia_pensja AS (select imie, nazwisko, pensja from premier_league."Trener" where (select avg(pensja) from premier_league."Trener") < pensja)
select imie, nazwisko, pensja from srednia_pensja

--------------------------------------------------------------------------------------------

7. Zapytanie zwracjace ilość bramek strzelonych przez danego zawodnika


CREATE VIEW najwiecej_goli_1 AS
select imie, nazwisko, count(rw.id_wydarzenia) from premier_league."Zawodnik1" inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika inner join "Klub" K on Zk.id_klubu = K.id_klubu
inner join "Mecz" M on K.id_klubu = M.id_goscia inner join sklad_gosci sg on M.id_gospodarza = sg.id_gospodarza and M.id_goscia = sg.id_goscia and M.id_meczu = sg.id_meczu
inner join "Wydarzenia_meczowe_gosci" Wmg on sg.id_gospodarza = Wmg.id_gospodarza and sg.id_goscia = Wmg.id_goscia and sg.id_zawodnika = Wmg.id_zawodnika and sg.id_meczu = Wmg.id_meczu
inner join rodzaje_wydarzen rw on Wmg.id_wydarzenia = rw.id_wydarzenia where rw.nazwa_wydarzenia = 'bramka' group by rw.id_wydarzenia, "Zawodnik1".id_zawodnika

CREATE VIEW najwiecej_goli_2 AS
select imie, nazwisko, count(id_wydarzenia) as liczba_bramek 
from premier_league."Zawodnik1" 
natural inner join "Zawodnik_klubu"
natural inner join "Klub" K
inner join "Mecz" M on K.id_klubu = M.id_goscia 
natural inner join sklad_gosci
natural inner join "Wydarzenia_meczowe_gosci"
natural inner join rodzaje_wydarzen
where nazwa_wydarzenia = 'bramka' 
group by id_wydarzenia, "Zawodnik1".id_zawodnika 
order by liczba_bramek desc


CREATE VIEW najwiecej_goli_3 AS
Create temporary table najwiecej_bramek (
    imie varchar(50),
    nazwisko varchar(50),
    liczba_bramek bigint
);

insert into najwiecej_bramek (imie, nazwisko, liczba_bramek) select imie, nazwisko, count(rw.id_wydarzenia) as liczba_bramek from premier_league."Zawodnik1" inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika inner join "Klub" K on Zk.id_klubu = K.id_klubu
inner join "Mecz" M on K.id_klubu = M.id_goscia inner join sklad_gosci sg on M.id_gospodarza = sg.id_gospodarza and M.id_goscia = sg.id_goscia and M.id_meczu = sg.id_meczu
inner join "Wydarzenia_meczowe_gosci" Wmg on sg.id_gospodarza = Wmg.id_gospodarza and sg.id_goscia = Wmg.id_goscia and sg.id_zawodnika = Wmg.id_zawodnika and sg.id_meczu = Wmg.id_meczu
inner join rodzaje_wydarzen rw on Wmg.id_wydarzenia = rw.id_wydarzenia where rw.nazwa_wydarzenia = 'bramka' group by rw.id_wydarzenia, "Zawodnik1".id_zawodnika order by liczba_bramek desc

--------------------------------------------------------------------------------------------

8. Zapytanie zwracające zawodników po 2003 roku

CREATE VIEW zawodnicy_po_2003_1 AS
select imie, nazwisko, nazwa_klubu, data_urodzenia from premier_league."Zawodnik1" inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika inner join "Klub" K on Zk.id_klubu = K.id_klubu
where date_part('year',data_urodzenia) > 2003

CREATE VIEW zawodnicy_po_2003_2 AS
select imie, nazwisko, nazwa_klubu, data_urodzenia from premier_league."Klub", premier_league."Zawodnik1", premier_league."Zawodnik_klubu" where "Zawodnik1".id_zawodnika = "Zawodnik_klubu".id_zawodnika
and "Zawodnik_klubu".id_klubu = "Klub".id_klubu and (date_part('year', data_urodzenia) > 2003)

--------------------------------------------------------------------------------------------

9. Zapytanie zwracające który z klubów posiada najwięcej kontuzjowanych zawodników

CREATE VIEW najwiecej_kontuzjowanych_1 AS
Select nazwa_klubu, count("Klub".id_klubu) as liczba_kontuzjowanych_zawodnikow from premier_league."Klub" inner join "Zawodnik_klubu" Zk on "Klub".id_klubu = Zk.id_klubu
inner join "Wykluczeni_zawodnicy" Wz on Zk.id_zawodnika = Wz.id_zawodnika and Zk.id_klubu = Wz.id_klubu group by nazwa_klubu order by liczba_kontuzjowanych_zawodnikow desc
limit 1

CREATE VIEW najwiecej_kontuzjowanych_2 AS
WITH liczba_kontuzjowanych_zawodnikow as (Select count(id_klubu) from premier_league."Wykluczeni_zawodnicy")
SELECT nazwa_klubu from premier_league."Klub" where (Select max(liczba_kontuzjowanych_zawodnikow))

--------------------------------------------------------------------------------------------

10. Wyświetlenie najstarszego zawodnika 

CREATE VIEW najstarszy_zawodnik_1 AS
select "Zawodnik1".id_zawodnika, imie, nazwisko, nazwa_klubu, min(data_urodzenia) from premier_league."Zawodnik1" inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika
inner join "Klub" K on Zk.id_klubu = K.id_klubu group by "Zawodnik1".id_zawodnika, nazwa_klubu, data_urodzenia order by data_urodzenia asc limit 1


CREATE VIEW najstarszy_zawodnik_2 AS
with najstarsi_zawodnicy as (select "Zawodnik1".id_zawodnika, imie, nazwisko, nazwa_klubu, min(data_urodzenia) as data_urodzenia from premier_league."Zawodnik1" inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika
inner join "Klub" K on Zk.id_klubu = K.id_klubu group by "Zawodnik1".id_zawodnika, nazwa_klubu, data_urodzenia order by data_urodzenia asc limit 1)
select imie, nazwisko, nazwa_klubu, data_urodzenia from najstarsi_zawodnicy

--------------------------------------------------------------------------------------------

11. Zawodnik z najdłuższym wykluczeniem

CREATE VIEW najdluzsze_wykluczenie AS
select imie, nazwisko, nazwa_klubu, rodzaj_wykluczenia, max(dlugosc_wykluczenia) as najdluzsze_wykluczenie from "Zawodnik1"
inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika
inner join "Wykluczeni_zawodnicy" Wz on Zk.id_zawodnika = Wz.id_zawodnika and Zk.id_klubu = Wz.id_klubu
inner join "Klub" K on Zk.id_klubu = K.id_klubu group by imie, nazwisko, nazwa_klubu, rodzaj_wykluczenia

--------------------------------------------------------------------------------------------

12. Wydarzenia meczowe dla meczu z id = 1

CREATE VIEW wydarzenia_meczowe AS
select imie, nazwisko, nazwa_klubu, minuta_meczu, nazwa_wydarzenia from "Zawodnik1"
inner join "Zawodnik_klubu" Zk on "Zawodnik1".id_zawodnika = Zk.id_zawodnika
inner join "Klub" K on Zk.id_klubu = K.id_klubu
inner join "Mecz" M on K.id_klubu = M.id_goscia
inner join sklad_gosci sg on M.id_gospodarza = sg.id_gospodarza and M.id_goscia = sg.id_goscia and M.id_meczu = sg.id_meczu
inner join "Wydarzenia_meczowe_gosci" Wmg on sg.id_gospodarza = Wmg.id_gospodarza and sg.id_goscia = Wmg.id_goscia and sg.id_zawodnika = Wmg.id_zawodnika and sg.id_meczu = Wmg.id_meczu
inner join rodzaje_wydarzen rw on Wmg.id_wydarzenia = rw.id_wydarzenia
where M.id_meczu = 1

--------------------------------------------------------------------------------------------


13. Zawodnicy urodzenie pomiędzy 1997 a 2000

CREATE VIEW pomiedzy_1997_2000 AS
select imie, nazwisko from "Zawodnik1" where date_part('year',data_urodzenia) between 1997 and 2000

--------------------------------------------------------------------------------------------

14. Ilość zawodników urodzonych w 1997 roku

CREATE VIEW urodzeni_1997 AS
select count(id_zawodnika) from "Zawodnik1" where date_part('year',data_urodzenia) = 1997

--------------------------------------------------------------------------------------------

15. Zawodnicy któych pensja jest nieznana

CREATE VIEW nieznana_pensja AS
select imie, nazwisko from "Zawodnik1" where pensja is null


-- Completed on 2020-01-31 20:19:08

--
-- PostgreSQL database dump complete
--

