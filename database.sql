--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accusations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE accusations (
    id integer NOT NULL,
    user_id integer,
    accusation text NOT NULL
);


ALTER TABLE accusations OWNER TO postgres;

--
-- Name: accusations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accusations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accusations_id_seq OWNER TO postgres;

--
-- Name: accusations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accusations_id_seq OWNED BY accusations.id;


--
-- Name: avaliations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE avaliations (
    id integer NOT NULL,
    medic_id integer NOT NULL,
    user_id integer,
    text text NOT NULL
);


ALTER TABLE avaliations OWNER TO postgres;

--
-- Name: avaliations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE avaliations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE avaliations_id_seq OWNER TO postgres;

--
-- Name: avaliations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE avaliations_id_seq OWNED BY avaliations.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cities (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history (
    id integer NOT NULL,
    birth_date text NOT NULL,
    blood_type text NOT NULL,
    height text NOT NULL,
    weight text NOT NULL,
    sex text NOT NULL
);


ALTER TABLE history OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_id_seq OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;


--
-- Name: medic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE medic (
    id integer NOT NULL,
    user_id integer NOT NULL,
    specialization text NOT NULL,
    address text NOT NULL,
    address_number integer NOT NULL
);


ALTER TABLE medic OWNER TO postgres;

--
-- Name: medic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medic_id_seq OWNER TO postgres;

--
-- Name: medic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medic_id_seq OWNED BY medic.id;


--
-- Name: medic_localization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE medic_localization (
    id integer NOT NULL,
    medic_id integer NOT NULL,
    city_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE medic_localization OWNER TO postgres;

--
-- Name: medic_localization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medic_localization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medic_localization_id_seq OWNER TO postgres;

--
-- Name: medic_localization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medic_localization_id_seq OWNED BY medic_localization.id;


--
-- Name: medication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE medication (
    id integer NOT NULL,
    name text NOT NULL,
    begin_date text NOT NULL,
    dosage text NOT NULL
);


ALTER TABLE medication OWNER TO postgres;

--
-- Name: medication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medication_id_seq OWNER TO postgres;

--
-- Name: medication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medication_id_seq OWNED BY medication.id;


--
-- Name: patient_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE patient_history (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    history_id integer NOT NULL
);


ALTER TABLE patient_history OWNER TO postgres;

--
-- Name: patient_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patient_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patient_history_id_seq OWNER TO postgres;

--
-- Name: patient_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patient_history_id_seq OWNED BY patient_history.id;


--
-- Name: preventions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE preventions (
    id integer NOT NULL,
    name text NOT NULL,
    text text NOT NULL
);


ALTER TABLE preventions OWNER TO postgres;

--
-- Name: preventions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE preventions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE preventions_id_seq OWNER TO postgres;

--
-- Name: preventions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE preventions_id_seq OWNED BY preventions.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token uuid NOT NULL
);


ALTER TABLE sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE states (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: user_medication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_medication (
    id integer NOT NULL,
    user_id integer NOT NULL,
    medication_id integer NOT NULL
);


ALTER TABLE user_medication OWNER TO postgres;

--
-- Name: user_medication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_medication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_medication_id_seq OWNER TO postgres;

--
-- Name: user_medication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_medication_id_seq OWNED BY user_medication.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    type integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    phone text,
    "CRM" text
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: accusations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accusations ALTER COLUMN id SET DEFAULT nextval('accusations_id_seq'::regclass);


--
-- Name: avaliations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliations ALTER COLUMN id SET DEFAULT nextval('avaliations_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- Name: medic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic ALTER COLUMN id SET DEFAULT nextval('medic_id_seq'::regclass);


--
-- Name: medic_localization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization ALTER COLUMN id SET DEFAULT nextval('medic_localization_id_seq'::regclass);


--
-- Name: medication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medication ALTER COLUMN id SET DEFAULT nextval('medication_id_seq'::regclass);


--
-- Name: patient_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_history ALTER COLUMN id SET DEFAULT nextval('patient_history_id_seq'::regclass);


--
-- Name: preventions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preventions ALTER COLUMN id SET DEFAULT nextval('preventions_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: user_medication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_medication ALTER COLUMN id SET DEFAULT nextval('user_medication_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: accusations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accusations (id, user_id, accusation) FROM stdin;
\.


--
-- Data for Name: avaliations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliations (id, medic_id, user_id, text) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (id, name) FROM stdin;
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY history (id, birth_date, blood_type, height, weight, sex) FROM stdin;
\.


--
-- Data for Name: medic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medic (id, user_id, specialization, address, address_number) FROM stdin;
\.


--
-- Data for Name: medic_localization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medic_localization (id, medic_id, city_id, state_id) FROM stdin;
\.


--
-- Data for Name: medication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medication (id, name, begin_date, dosage) FROM stdin;
\.


--
-- Data for Name: patient_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patient_history (id, patient_id, history_id) FROM stdin;
\.


--
-- Data for Name: preventions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY preventions (id, name, text) FROM stdin;
1	Redesignação sexual e nutrição	A população LGBT sempre foi marginalizada em vários campos da sociedade, inclusive na área de saúde. Apesar de leis mais livres, o acesso aos serviços não está livre de discriminação, nem no setor público nem no privado. As últimas décadas foram de avanço com a instituição do Plano Nacional de Promoção da Cidadania e Direitos Humanos de LGBT e da Política Nacional de Saúde Integral de Lésbicas, Gays, Bissexuais, Travestis e Transexuais. Mesmo assim, a implantação é lenta e o atendimento integral, gratuito, de qualidade e que atenda às demandas destes enorme grupo continua um desafio.
2	O que pessoas trans e não-binária precisam saber sobre métodos  anticoncepcionais?	As pessoas trans e não-binárias que estão fazendo o tratamento hormonal de afirmação de gênero podem pensar que não precisam usar métodos anticoncepcionais. No entanto, o tratamento hormonal isolado não protegerá as pessoas trans e não-binárias de uma gravidez.\n A menstruação para de aparecer para a maioria dos homens trans e não-binários AFAB (pessoas que receberam a atribuição do gênero feminino ao nascer) depois de tomar testosterona por alguns meses (1), mas a ovulação (liberação de um óvulo do ovário) ainda pode acontecer mesmo que nunca tenham menstruado (2, 3). 
3	Como acontece a transição hormonal em pessoas transgênero?	A hormonioterapia é um tratamento seguido por muitas pessoas transgênero para modificar o seu corpo através do uso de hormônios, sejam eles masculinos ou femininos. No Brasil, as terapias hormonais são proibidas para menores de 16 anos, e as cirurgias só são liberadas a partir dos 18.\nLeia o texto a seguir e entenda como acontece a transição hormonal, seus estágios e quais passos estão envolvidos. O objetivo da terapia hormonal é fazer a pessoa transgênero ficar mais à vontade consigo mesmo, de maneira física e psicológica. Isso também vai depender da visão do paciente e seus desejos, assim como os pacientes que não buscam a cirurgia de redesignação sexual, por exemplo.
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, user_id, token) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY states (id, name) FROM stdin;
\.


--
-- Data for Name: user_medication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_medication (id, user_id, medication_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, type, email, password, phone, "CRM") FROM stdin;
\.


--
-- Name: accusations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accusations_id_seq', 1, false);


--
-- Name: avaliations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('avaliations_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 1, true);


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('history_id_seq', 1, true);


--
-- Name: medic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medic_id_seq', 1, true);


--
-- Name: medic_localization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medic_localization_id_seq', 1, true);


--
-- Name: medication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medication_id_seq', 5, true);


--
-- Name: patient_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patient_history_id_seq', 1, true);


--
-- Name: preventions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('preventions_id_seq', 3, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 9, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('states_id_seq', 1, true);


--
-- Name: user_medication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_medication_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: accusations accusations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accusations
    ADD CONSTRAINT accusations_pk PRIMARY KEY (id);


--
-- Name: avaliations avaliations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliations
    ADD CONSTRAINT avaliations_pk PRIMARY KEY (id);


--
-- Name: cities cities_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- Name: history history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pk PRIMARY KEY (id);


--
-- Name: medic_localization medic_localization_city_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization
    ADD CONSTRAINT medic_localization_city_id_key UNIQUE (city_id);


--
-- Name: medic_localization medic_localization_medic_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization
    ADD CONSTRAINT medic_localization_medic_id_key UNIQUE (medic_id);


--
-- Name: medic_localization medic_localization_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization
    ADD CONSTRAINT medic_localization_pk PRIMARY KEY (id);


--
-- Name: medic medic_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic
    ADD CONSTRAINT medic_pk PRIMARY KEY (id);


--
-- Name: medic medic_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic
    ADD CONSTRAINT medic_user_id_key UNIQUE (user_id);


--
-- Name: medication medication_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medication
    ADD CONSTRAINT medication_pk PRIMARY KEY (id);


--
-- Name: patient_history patient_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_history
    ADD CONSTRAINT patient_history_pk PRIMARY KEY (id);


--
-- Name: preventions preventions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preventions
    ADD CONSTRAINT preventions_name_key UNIQUE (name);


--
-- Name: preventions preventions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preventions
    ADD CONSTRAINT preventions_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: sessions sessions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_user_id_key UNIQUE (user_id);


--
-- Name: states states_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_name_key UNIQUE (name);


--
-- Name: states states_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pk PRIMARY KEY (id);


--
-- Name: user_medication user_medication_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_medication
    ADD CONSTRAINT user_medication_pk PRIMARY KEY (id);


--
-- Name: users users_CRM_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "users_CRM_key" UNIQUE ("CRM");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: accusations accusations_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accusations
    ADD CONSTRAINT accusations_fk0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: avaliations avaliations_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliations
    ADD CONSTRAINT avaliations_fk0 FOREIGN KEY (medic_id) REFERENCES medic(user_id);


--
-- Name: avaliations avaliations_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliations
    ADD CONSTRAINT avaliations_fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: medic medic_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic
    ADD CONSTRAINT medic_fk0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: medic_localization medic_localization_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization
    ADD CONSTRAINT medic_localization_fk0 FOREIGN KEY (medic_id) REFERENCES medic(user_id);


--
-- Name: medic_localization medic_localization_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization
    ADD CONSTRAINT medic_localization_fk1 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: medic_localization medic_localization_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medic_localization
    ADD CONSTRAINT medic_localization_fk2 FOREIGN KEY (state_id) REFERENCES states(id);


--
-- Name: patient_history patient_history_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_history
    ADD CONSTRAINT patient_history_fk0 FOREIGN KEY (patient_id) REFERENCES users(id);


--
-- Name: patient_history patient_history_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient_history
    ADD CONSTRAINT patient_history_fk1 FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_medication user_medication_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_medication
    ADD CONSTRAINT user_medication_fk0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_medication user_medication_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_medication
    ADD CONSTRAINT user_medication_fk1 FOREIGN KEY (medication_id) REFERENCES medication(id);


--
-- PostgreSQL database dump complete
--
