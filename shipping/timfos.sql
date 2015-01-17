--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-01-17 18:35:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 24609)
-- Name: business; Type: SCHEMA; Schema: -; Owner: timfos
--

CREATE SCHEMA business;


ALTER SCHEMA business OWNER TO timfos;

--
-- TOC entry 7 (class 2615 OID 24578)
-- Name: master; Type: SCHEMA; Schema: -; Owner: timfos
--

CREATE SCHEMA master;


ALTER SCHEMA master OWNER TO timfos;

--
-- TOC entry 9 (class 2615 OID 24691)
-- Name: parameter; Type: SCHEMA; Schema: -; Owner: timfos
--

CREATE SCHEMA parameter;


ALTER SCHEMA parameter OWNER TO timfos;

--
-- TOC entry 10 (class 2615 OID 24692)
-- Name: security; Type: SCHEMA; Schema: -; Owner: timfos
--

CREATE SCHEMA security;


ALTER SCHEMA security OWNER TO timfos;

--
-- TOC entry 197 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 197
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = business, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 24685)
-- Name: bs_customer; Type: TABLE; Schema: business; Owner: postgres; Tablespace: 
--

CREATE TABLE bs_customer (
    customer_id bigint NOT NULL,
    customer_name character varying(100),
    customer_contact character varying(50),
    customer_address character varying(225),
    customer_acceptor_contact character varying(50)
);


ALTER TABLE business.bs_customer OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 24683)
-- Name: bs_customer_customer_id_seq; Type: SEQUENCE; Schema: business; Owner: postgres
--

CREATE SEQUENCE bs_customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE business.bs_customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 187
-- Name: bs_customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: business; Owner: postgres
--

ALTER SEQUENCE bs_customer_customer_id_seq OWNED BY bs_customer.customer_id;


--
-- TOC entry 181 (class 1259 OID 24624)
-- Name: bs_price; Type: TABLE; Schema: business; Owner: postgres; Tablespace: 
--

CREATE TABLE bs_price (
    price_id bigint NOT NULL,
    price_code character varying(50),
    price_type character varying(2),
    price_value real
);


ALTER TABLE business.bs_price OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 24622)
-- Name: price_price_id_seq; Type: SEQUENCE; Schema: business; Owner: postgres
--

CREATE SEQUENCE price_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE business.price_price_id_seq OWNER TO postgres;

--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 180
-- Name: price_price_id_seq; Type: SEQUENCE OWNED BY; Schema: business; Owner: postgres
--

ALTER SEQUENCE price_price_id_seq OWNED BY bs_price.price_id;


SET search_path = master, pg_catalog;

--
-- TOC entry 175 (class 1259 OID 24587)
-- Name: m_branch; Type: TABLE; Schema: master; Owner: postgres; Tablespace: 
--

CREATE TABLE m_branch (
    branch_id bigint NOT NULL,
    branch_code character varying(50),
    branch_name character varying(100)
);


ALTER TABLE master.m_branch OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24585)
-- Name: m_branch_branch_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE m_branch_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.m_branch_branch_id_seq OWNER TO postgres;

--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 174
-- Name: m_branch_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE m_branch_branch_id_seq OWNED BY m_branch.branch_id;


--
-- TOC entry 179 (class 1259 OID 24599)
-- Name: m_country; Type: TABLE; Schema: master; Owner: postgres; Tablespace: 
--

CREATE TABLE m_country (
    country_id bigint NOT NULL,
    country_code character varying(50),
    country_name character varying(100),
    currency_id bigint NOT NULL
);


ALTER TABLE master.m_country OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 24597)
-- Name: m_country_country_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE m_country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.m_country_country_id_seq OWNER TO postgres;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 178
-- Name: m_country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE m_country_country_id_seq OWNED BY m_country.country_id;


--
-- TOC entry 186 (class 1259 OID 24663)
-- Name: m_country_currency_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE m_country_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.m_country_currency_id_seq OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 186
-- Name: m_country_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE m_country_currency_id_seq OWNED BY m_country.currency_id;


--
-- TOC entry 183 (class 1259 OID 24637)
-- Name: m_currency; Type: TABLE; Schema: master; Owner: postgres; Tablespace: 
--

CREATE TABLE m_currency (
    currency_id bigint NOT NULL,
    currency_code character varying(50),
    currency_name character varying(100)
);


ALTER TABLE master.m_currency OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24635)
-- Name: m_currency_currency_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE m_currency_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.m_currency_currency_id_seq OWNER TO postgres;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 182
-- Name: m_currency_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE m_currency_currency_id_seq OWNED BY m_currency.currency_id;


--
-- TOC entry 185 (class 1259 OID 24657)
-- Name: m_exchange_rate; Type: TABLE; Schema: master; Owner: timfos; Tablespace: 
--

CREATE TABLE m_exchange_rate (
    exchange_rate_id bigint NOT NULL,
    exchange_rate_code character varying(50),
    exchange_rate_name character varying(50),
    exchange_rate_value real
);


ALTER TABLE master.m_exchange_rate OWNER TO timfos;

--
-- TOC entry 184 (class 1259 OID 24655)
-- Name: m_exchange_rate_exchange_rate_id_seq; Type: SEQUENCE; Schema: master; Owner: timfos
--

CREATE SEQUENCE m_exchange_rate_exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.m_exchange_rate_exchange_rate_id_seq OWNER TO timfos;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 184
-- Name: m_exchange_rate_exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: timfos
--

ALTER SEQUENCE m_exchange_rate_exchange_rate_id_seq OWNED BY m_exchange_rate.exchange_rate_id;


--
-- TOC entry 177 (class 1259 OID 24593)
-- Name: m_region; Type: TABLE; Schema: master; Owner: postgres; Tablespace: 
--

CREATE TABLE m_region (
    region_id bigint NOT NULL,
    region_code character varying(50),
    region_name character varying(100)
);


ALTER TABLE master.m_region OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24591)
-- Name: m_region_region_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE m_region_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.m_region_region_id_seq OWNER TO postgres;

--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 176
-- Name: m_region_region_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE m_region_region_id_seq OWNED BY m_region.region_id;


SET search_path = parameter, pg_catalog;

--
-- TOC entry 190 (class 1259 OID 24698)
-- Name: p_category; Type: TABLE; Schema: parameter; Owner: timfos; Tablespace: 
--

CREATE TABLE p_category (
    category_id bigint NOT NULL,
    category_code character varying(50),
    category_name character varying(100),
    category_desc character varying(225)
);


ALTER TABLE parameter.p_category OWNER TO timfos;

--
-- TOC entry 189 (class 1259 OID 24696)
-- Name: p_category_category_id_seq; Type: SEQUENCE; Schema: parameter; Owner: timfos
--

CREATE SEQUENCE p_category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parameter.p_category_category_id_seq OWNER TO timfos;

--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 189
-- Name: p_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: parameter; Owner: timfos
--

ALTER SEQUENCE p_category_category_id_seq OWNED BY p_category.category_id;


--
-- TOC entry 192 (class 1259 OID 24704)
-- Name: p_repository; Type: TABLE; Schema: parameter; Owner: timfos; Tablespace: 
--

CREATE TABLE p_repository (
    repository_id bigint NOT NULL,
    repository_code character varying(50),
    repository_name character varying(50),
    repository_value integer
);


ALTER TABLE parameter.p_repository OWNER TO timfos;

--
-- TOC entry 191 (class 1259 OID 24702)
-- Name: p_repository_repository_id_seq; Type: SEQUENCE; Schema: parameter; Owner: timfos
--

CREATE SEQUENCE p_repository_repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parameter.p_repository_repository_id_seq OWNER TO timfos;

--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 191
-- Name: p_repository_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: parameter; Owner: timfos
--

ALTER SEQUENCE p_repository_repository_id_seq OWNED BY p_repository.repository_id;


--
-- TOC entry 194 (class 1259 OID 24712)
-- Name: p_variant; Type: TABLE; Schema: parameter; Owner: timfos; Tablespace: 
--

CREATE TABLE p_variant (
    variant_id bigint NOT NULL,
    variant_code character varying(50),
    variant_name character varying(100)
);


ALTER TABLE parameter.p_variant OWNER TO timfos;

--
-- TOC entry 193 (class 1259 OID 24710)
-- Name: p_variant_variant_id_seq; Type: SEQUENCE; Schema: parameter; Owner: timfos
--

CREATE SEQUENCE p_variant_variant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parameter.p_variant_variant_id_seq OWNER TO timfos;

--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 193
-- Name: p_variant_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: parameter; Owner: timfos
--

ALTER SEQUENCE p_variant_variant_id_seq OWNED BY p_variant.variant_id;


SET search_path = security, pg_catalog;

--
-- TOC entry 196 (class 1259 OID 49439)
-- Name: sec_user; Type: TABLE; Schema: security; Owner: timfos; Tablespace: 
--

CREATE TABLE sec_user (
    user_id bigint NOT NULL,
    username character varying(50),
    email character varying(50),
    address character varying(255),
    phone character varying(50),
    user_status character varying(1),
    created_date timestamp without time zone,
    created_by character varying(25),
    modify_date timestamp without time zone,
    modify_by character varying(25),
    expired_date timestamp without time zone,
    login_status character varying(1),
    is_ntlm boolean
);


ALTER TABLE security.sec_user OWNER TO timfos;

--
-- TOC entry 195 (class 1259 OID 49437)
-- Name: sec_user_user_id_seq; Type: SEQUENCE; Schema: security; Owner: timfos
--

CREATE SEQUENCE sec_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.sec_user_user_id_seq OWNER TO timfos;

--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 195
-- Name: sec_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: timfos
--

ALTER SEQUENCE sec_user_user_id_seq OWNED BY sec_user.user_id;


SET search_path = business, pg_catalog;

--
-- TOC entry 1896 (class 2604 OID 24688)
-- Name: customer_id; Type: DEFAULT; Schema: business; Owner: postgres
--

ALTER TABLE ONLY bs_customer ALTER COLUMN customer_id SET DEFAULT nextval('bs_customer_customer_id_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 24627)
-- Name: price_id; Type: DEFAULT; Schema: business; Owner: postgres
--

ALTER TABLE ONLY bs_price ALTER COLUMN price_id SET DEFAULT nextval('price_price_id_seq'::regclass);


SET search_path = master, pg_catalog;

--
-- TOC entry 1889 (class 2604 OID 24590)
-- Name: branch_id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY m_branch ALTER COLUMN branch_id SET DEFAULT nextval('m_branch_branch_id_seq'::regclass);


--
-- TOC entry 1891 (class 2604 OID 24602)
-- Name: country_id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY m_country ALTER COLUMN country_id SET DEFAULT nextval('m_country_country_id_seq'::regclass);


--
-- TOC entry 1892 (class 2604 OID 24665)
-- Name: currency_id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY m_country ALTER COLUMN currency_id SET DEFAULT nextval('m_country_currency_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 24640)
-- Name: currency_id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY m_currency ALTER COLUMN currency_id SET DEFAULT nextval('m_currency_currency_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 24660)
-- Name: exchange_rate_id; Type: DEFAULT; Schema: master; Owner: timfos
--

ALTER TABLE ONLY m_exchange_rate ALTER COLUMN exchange_rate_id SET DEFAULT nextval('m_exchange_rate_exchange_rate_id_seq'::regclass);


--
-- TOC entry 1890 (class 2604 OID 24596)
-- Name: region_id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY m_region ALTER COLUMN region_id SET DEFAULT nextval('m_region_region_id_seq'::regclass);


SET search_path = parameter, pg_catalog;

--
-- TOC entry 1897 (class 2604 OID 24701)
-- Name: category_id; Type: DEFAULT; Schema: parameter; Owner: timfos
--

ALTER TABLE ONLY p_category ALTER COLUMN category_id SET DEFAULT nextval('p_category_category_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 24707)
-- Name: repository_id; Type: DEFAULT; Schema: parameter; Owner: timfos
--

ALTER TABLE ONLY p_repository ALTER COLUMN repository_id SET DEFAULT nextval('p_repository_repository_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 24715)
-- Name: variant_id; Type: DEFAULT; Schema: parameter; Owner: timfos
--

ALTER TABLE ONLY p_variant ALTER COLUMN variant_id SET DEFAULT nextval('p_variant_variant_id_seq'::regclass);


SET search_path = security, pg_catalog;

--
-- TOC entry 1900 (class 2604 OID 49442)
-- Name: user_id; Type: DEFAULT; Schema: security; Owner: timfos
--

ALTER TABLE ONLY sec_user ALTER COLUMN user_id SET DEFAULT nextval('sec_user_user_id_seq'::regclass);


SET search_path = business, pg_catalog;

--
-- TOC entry 2037 (class 0 OID 24685)
-- Dependencies: 188
-- Data for Name: bs_customer; Type: TABLE DATA; Schema: business; Owner: postgres
--

COPY bs_customer (customer_id, customer_name, customer_contact, customer_address, customer_acceptor_contact) FROM stdin;
\.


--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 187
-- Name: bs_customer_customer_id_seq; Type: SEQUENCE SET; Schema: business; Owner: postgres
--

SELECT pg_catalog.setval('bs_customer_customer_id_seq', 1, false);


--
-- TOC entry 2030 (class 0 OID 24624)
-- Dependencies: 181
-- Data for Name: bs_price; Type: TABLE DATA; Schema: business; Owner: postgres
--

COPY bs_price (price_id, price_code, price_type, price_value) FROM stdin;
\.


--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 180
-- Name: price_price_id_seq; Type: SEQUENCE SET; Schema: business; Owner: postgres
--

SELECT pg_catalog.setval('price_price_id_seq', 1, false);


SET search_path = master, pg_catalog;

--
-- TOC entry 2024 (class 0 OID 24587)
-- Dependencies: 175
-- Data for Name: m_branch; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY m_branch (branch_id, branch_code, branch_name) FROM stdin;
\.


--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 174
-- Name: m_branch_branch_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('m_branch_branch_id_seq', 1, false);


--
-- TOC entry 2028 (class 0 OID 24599)
-- Dependencies: 179
-- Data for Name: m_country; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY m_country (country_id, country_code, country_name, currency_id) FROM stdin;
\.


--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 178
-- Name: m_country_country_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('m_country_country_id_seq', 1, false);


--
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 186
-- Name: m_country_currency_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('m_country_currency_id_seq', 1, false);


--
-- TOC entry 2032 (class 0 OID 24637)
-- Dependencies: 183
-- Data for Name: m_currency; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY m_currency (currency_id, currency_code, currency_name) FROM stdin;
\.


--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 182
-- Name: m_currency_currency_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('m_currency_currency_id_seq', 1, false);


--
-- TOC entry 2034 (class 0 OID 24657)
-- Dependencies: 185
-- Data for Name: m_exchange_rate; Type: TABLE DATA; Schema: master; Owner: timfos
--

COPY m_exchange_rate (exchange_rate_id, exchange_rate_code, exchange_rate_name, exchange_rate_value) FROM stdin;
\.


--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 184
-- Name: m_exchange_rate_exchange_rate_id_seq; Type: SEQUENCE SET; Schema: master; Owner: timfos
--

SELECT pg_catalog.setval('m_exchange_rate_exchange_rate_id_seq', 1, false);


--
-- TOC entry 2026 (class 0 OID 24593)
-- Dependencies: 177
-- Data for Name: m_region; Type: TABLE DATA; Schema: master; Owner: postgres
--

COPY m_region (region_id, region_code, region_name) FROM stdin;
\.


--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 176
-- Name: m_region_region_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('m_region_region_id_seq', 1, false);


SET search_path = parameter, pg_catalog;

--
-- TOC entry 2039 (class 0 OID 24698)
-- Dependencies: 190
-- Data for Name: p_category; Type: TABLE DATA; Schema: parameter; Owner: timfos
--

COPY p_category (category_id, category_code, category_name, category_desc) FROM stdin;
\.


--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 189
-- Name: p_category_category_id_seq; Type: SEQUENCE SET; Schema: parameter; Owner: timfos
--

SELECT pg_catalog.setval('p_category_category_id_seq', 1, false);


--
-- TOC entry 2041 (class 0 OID 24704)
-- Dependencies: 192
-- Data for Name: p_repository; Type: TABLE DATA; Schema: parameter; Owner: timfos
--

COPY p_repository (repository_id, repository_code, repository_name, repository_value) FROM stdin;
\.


--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 191
-- Name: p_repository_repository_id_seq; Type: SEQUENCE SET; Schema: parameter; Owner: timfos
--

SELECT pg_catalog.setval('p_repository_repository_id_seq', 1, false);


--
-- TOC entry 2043 (class 0 OID 24712)
-- Dependencies: 194
-- Data for Name: p_variant; Type: TABLE DATA; Schema: parameter; Owner: timfos
--

COPY p_variant (variant_id, variant_code, variant_name) FROM stdin;
\.


--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 193
-- Name: p_variant_variant_id_seq; Type: SEQUENCE SET; Schema: parameter; Owner: timfos
--

SELECT pg_catalog.setval('p_variant_variant_id_seq', 1, false);


SET search_path = security, pg_catalog;

--
-- TOC entry 2045 (class 0 OID 49439)
-- Dependencies: 196
-- Data for Name: sec_user; Type: TABLE DATA; Schema: security; Owner: timfos
--

COPY sec_user (user_id, username, email, address, phone, user_status, created_date, created_by, modify_date, modify_by, expired_date, login_status, is_ntlm) FROM stdin;
\.


--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 195
-- Name: sec_user_user_id_seq; Type: SEQUENCE SET; Schema: security; Owner: timfos
--

SELECT pg_catalog.setval('sec_user_user_id_seq', 1, false);


SET search_path = business, pg_catalog;

--
-- TOC entry 1912 (class 2606 OID 24690)
-- Name: bs_customer_pkey; Type: CONSTRAINT; Schema: business; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bs_customer
    ADD CONSTRAINT bs_customer_pkey PRIMARY KEY (customer_id);


SET search_path = master, pg_catalog;

--
-- TOC entry 1902 (class 2606 OID 24643)
-- Name: m_branch_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY m_branch
    ADD CONSTRAINT m_branch_pkey PRIMARY KEY (branch_id);


--
-- TOC entry 1906 (class 2606 OID 24645)
-- Name: m_country_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY m_country
    ADD CONSTRAINT m_country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 1908 (class 2606 OID 24647)
-- Name: m_currency_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY m_currency
    ADD CONSTRAINT m_currency_pkey PRIMARY KEY (currency_id);


--
-- TOC entry 1910 (class 2606 OID 24662)
-- Name: m_exchange_rate_pkey; Type: CONSTRAINT; Schema: master; Owner: timfos; Tablespace: 
--

ALTER TABLE ONLY m_exchange_rate
    ADD CONSTRAINT m_exchange_rate_pkey PRIMARY KEY (exchange_rate_id);


--
-- TOC entry 1904 (class 2606 OID 24649)
-- Name: m_region_pkey; Type: CONSTRAINT; Schema: master; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY m_region
    ADD CONSTRAINT m_region_pkey PRIMARY KEY (region_id);


SET search_path = parameter, pg_catalog;

--
-- TOC entry 1914 (class 2606 OID 24709)
-- Name: p_repository_pkey; Type: CONSTRAINT; Schema: parameter; Owner: timfos; Tablespace: 
--

ALTER TABLE ONLY p_repository
    ADD CONSTRAINT p_repository_pkey PRIMARY KEY (repository_id);


SET search_path = master, pg_catalog;

--
-- TOC entry 1915 (class 2606 OID 24670)
-- Name: m_country_currency_id_fkey; Type: FK CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY m_country
    ADD CONSTRAINT m_country_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES m_currency(currency_id);


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-01-17 18:35:16

--
-- PostgreSQL database dump complete
--

