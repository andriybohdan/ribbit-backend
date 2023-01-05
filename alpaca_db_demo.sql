--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8
-- Dumped by pg_dump version 14.0

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
-- Name: assets; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.assets (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id text NOT NULL,
    class text,
    exchange text,
    symbol text,
    name text,
    status text,
    tradable boolean,
    marginable boolean,
    shortable boolean,
    easy_to_borrow boolean,
    fractionable boolean,
    is_watchlisted boolean
);


ALTER TABLE public.assets OWNER TO alpaca_user;

--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.bank_accounts (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id bigint NOT NULL,
    user_id bigint,
    access_token text,
    account_id text,
    bank_name text,
    account_name text,
    status boolean
);


ALTER TABLE public.bank_accounts OWNER TO alpaca_user;

--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_accounts_id_seq OWNER TO alpaca_user;

--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- Name: coin_statements; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.coin_statements (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id bigint NOT NULL,
    user_id bigint,
    coins bigint,
    type text,
    reason text,
    status boolean
);


ALTER TABLE public.coin_statements OWNER TO alpaca_user;

--
-- Name: coin_statements_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.coin_statements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_statements_id_seq OWNER TO alpaca_user;

--
-- Name: coin_statements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.coin_statements_id_seq OWNED BY public.coin_statements.id;


--
-- Name: rewards; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.rewards (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id bigint NOT NULL,
    per_account_limit bigint,
    referral_kyc_reward double precision,
    referral_signup_reward double precision,
    referre_kyc_reward double precision
);


ALTER TABLE public.rewards OWNER TO alpaca_user;

--
-- Name: rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rewards_id_seq OWNER TO alpaca_user;

--
-- Name: rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.rewards_id_seq OWNED BY public.rewards.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    access_level smallint,
    name text
);


ALTER TABLE public.roles OWNER TO alpaca_user;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO alpaca_user;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: user_rewards; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.user_rewards (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id bigint NOT NULL,
    user_id bigint,
    journal_id text,
    referred_by bigint,
    reward_value real,
    reward_type text,
    reward_transfer_status boolean,
    error_response text
);


ALTER TABLE public.user_rewards OWNER TO alpaca_user;

--
-- Name: user_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.user_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_rewards_id_seq OWNER TO alpaca_user;

--
-- Name: user_rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.user_rewards_id_seq OWNED BY public.user_rewards.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.users (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id bigint NOT NULL,
    first_name text,
    last_name text,
    username text,
    password text,
    email text,
    mobile text,
    country_code text,
    address text,
    last_login timestamp with time zone,
    verified boolean,
    active boolean,
    token text,
    role_id bigint,
    account_id text,
    account_number text,
    account_currency text,
    account_status text,
    dob text,
    city text,
    state text,
    country text,
    tax_id_type text,
    tax_id text,
    funding_source text,
    employment_status text,
    investing_experience text,
    public_shareholder text,
    another_brokerage text,
    device_id text,
    profile_completion text,
    bio text,
    facebook_url text,
    twitter_url text,
    instagram_url text,
    public_portfolio text,
    employer_name text,
    occupation text,
    unit_apt text,
    zip_code text,
    stock_symbol text,
    brokerage_firm_name text,
    brokerage_firm_employee_name text,
    brokerage_firm_employee_relationship text,
    shareholder_company_name text,
    avatar text,
    referred_by text,
    referral_code text,
    watchlist_id text,
    per_account_limit double precision
);


ALTER TABLE public.users OWNER TO alpaca_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO alpaca_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: verifications; Type: TABLE; Schema: public; Owner: alpaca_user
--

CREATE TABLE public.verifications (
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    id bigint NOT NULL,
    token text,
    user_id bigint
);


ALTER TABLE public.verifications OWNER TO alpaca_user;

--
-- Name: verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: alpaca_user
--

CREATE SEQUENCE public.verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verifications_id_seq OWNER TO alpaca_user;

--
-- Name: verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alpaca_user
--

ALTER SEQUENCE public.verifications_id_seq OWNED BY public.verifications.id;


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- Name: coin_statements id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.coin_statements ALTER COLUMN id SET DEFAULT nextval('public.coin_statements_id_seq'::regclass);


--
-- Name: rewards id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.rewards ALTER COLUMN id SET DEFAULT nextval('public.rewards_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: user_rewards id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.user_rewards ALTER COLUMN id SET DEFAULT nextval('public.user_rewards_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: verifications id; Type: DEFAULT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.verifications ALTER COLUMN id SET DEFAULT nextval('public.verifications_id_seq'::regclass);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--



--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--



--
-- Data for Name: coin_statements; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--



--
-- Data for Name: rewards; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--

INSERT INTO public.roles VALUES
	(1, 1, 'superadmin'),
	(2, 2, 'admin'),
	(3, 3, 'user');


--
-- Data for Name: user_rewards; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--

INSERT INTO public.users VALUES
	('2023-01-05 16:09:44.858635+02', '2023-01-05 16:10:58.414421+02', NULL, 3, 'Йцу', 'Йцу', NULL, '$2a$10$XUHzioOTcfkuZ.hheb.J5OQeks28posMX2IYaAAsUXakpu7O3MFPG', 'fedorniakl+2@gmail.com', '+11223423423', 'USA', 'цйу', '2023-01-05 16:09:46.347199+02', true, true, 'cerdkamv9mcedb2rilt0', NULL, NULL, NULL, NULL, NULL, '2000-11-11', 'фіва', 'AK', 'United States', 'USA', '112123343', 'employment_income', 'employed', 'None', 'no', 'no', NULL, 'brokerage', NULL, NULL, NULL, NULL, NULL, 'Йду', 'Йцу', 'йцу', '12312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FEDORNIAKL23', NULL, NULL),
	('2023-01-03 19:51:01.091858+02', '2023-01-04 15:05:07.208801+02', NULL, 2, 'Lyubomyr', 'Fedorniak', NULL, '$2a$10$IT9L.sj0JCImHpBRTiejsu.Evm/nKoiJo6Dn87Z8cGnA2Du.itYLi', 'fedorniakl+1@gmail.com', '+13489123840', 'USA', 'we’re', '2023-01-04 19:17:43.613098+02', true, true, 'ceqr9duv9mc64jn5avag', NULL, '0f5266d5-110c-474b-b9cc-084ec88845bb', '949096390', 'USD', 'ACTIVE', '1987-04-17', 'Lviv', 'AK', 'United States', 'USA', '131293812', 'employment_income', 'employed', 'None', 'no', 'no', NULL, 'complete', NULL, NULL, NULL, NULL, NULL, 'John', '123', 'qwe 23', '12393', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FEDORNIAKL12', NULL, NULL),
	('2023-01-03 19:19:14.782209+02', '2023-01-04 20:11:00.41296+02', NULL, 1, 'Lyubomyr', 'Fedorniak', NULL, '$2a$10$HW3SBUFf9TPMKICKPjNCZOgk4j9AHi.e67LJg5sRfysiW.E70JfGa', 'fedorniakl@gmail.com', '+13245234523', 'USA', 'zelena115', '2023-01-04 20:07:55.056404+02', true, true, 'ceqs0uuv9mc64jn5avcg', NULL, 'aa6dcda8-8d64-4069-8fc4-db2b0bd5bf22', '949380056', 'USD', 'ACTIVE', '1987-04-17', 'Lviv', 'AK', 'United States', 'USA', '123123123', 'investments', 'employed', 'Not Much', 'no', 'no', NULL, 'complete', NULL, NULL, NULL, NULL, NULL, 'Еуіе', 'Еуіе', '123', '12312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FEDORNIAKL1', '3075d7d4-9427-48d2-8de0-f9c104b9886a', NULL);


--
-- Data for Name: verifications; Type: TABLE DATA; Schema: public; Owner: alpaca_user
--

INSERT INTO public.verifications VALUES
	('2023-01-03 19:19:14.798099+02', '2023-01-03 19:19:14.798099+02', NULL, 1, '749357', 1),
	('2023-01-03 19:35:10.03476+02', '2023-01-03 19:35:10.03476+02', NULL, 2, '602882', 1),
	('2023-01-03 19:36:55.813877+02', '2023-01-03 19:36:55.813877+02', NULL, 3, '853092', 1),
	('2023-01-03 19:38:26.473394+02', '2023-01-03 19:38:26.473394+02', NULL, 4, '268342', 1),
	('2023-01-03 19:40:16.417616+02', '2023-01-03 19:40:16.417616+02', NULL, 5, '807954', 1),
	('2023-01-03 19:41:27.562793+02', '2023-01-03 19:41:27.562793+02', NULL, 6, '514034', 1),
	('2023-01-03 19:43:07.693932+02', '2023-01-03 19:43:07.693932+02', NULL, 7, '350618', 1),
	('2023-01-03 19:51:01.115493+02', '2023-01-03 19:51:01.115493+02', '2023-01-03 19:51:18.493074+02', 8, '089998', 2),
	('2023-01-03 19:57:22.507722+02', '2023-01-03 19:57:22.507722+02', NULL, 9, '497077', 1),
	('2023-01-05 16:09:44.893123+02', '2023-01-05 16:09:44.893123+02', '2023-01-05 16:09:55.830391+02', 10, '733299', 3);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.bank_accounts_id_seq', 1, false);


--
-- Name: coin_statements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.coin_statements_id_seq', 1, false);


--
-- Name: rewards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.rewards_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: user_rewards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.user_rewards_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: verifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpaca_user
--

SELECT pg_catalog.setval('public.verifications_id_seq', 10, true);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: coin_statements coin_statements_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.coin_statements
    ADD CONSTRAINT coin_statements_pkey PRIMARY KEY (id);


--
-- Name: rewards rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user_rewards user_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.user_rewards
    ADD CONSTRAINT user_rewards_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verifications verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_pkey PRIMARY KEY (id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alpaca_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

