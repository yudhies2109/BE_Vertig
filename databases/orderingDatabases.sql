--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9 (Ubuntu 11.9-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.9 (Ubuntu 11.9-1.pgdg18.04+1)

-- Started on 2020-10-13 11:13:04 WIB

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

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16515)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    list_menu character(200)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16513)
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_menu_seq OWNER TO postgres;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 198
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


--
-- TOC entry 205 (class 1259 OID 16551)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id_order integer NOT NULL,
    req_order character(150),
    qty_order integer,
    buyer_name character(100),
    id_spec_restaurant integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16545)
-- Name: orders_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_order_seq OWNER TO postgres;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 204
-- Name: orders_id_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_order_seq OWNED BY public.orders.id_order;


--
-- TOC entry 209 (class 1259 OID 16592)
-- Name: orders_id_spec_restaurant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_spec_restaurant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_spec_restaurant_seq OWNER TO postgres;

--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 209
-- Name: orders_id_spec_restaurant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_spec_restaurant_seq OWNED BY public.orders.id_spec_restaurant;


--
-- TOC entry 196 (class 1259 OID 16498)
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    id_restaurant integer NOT NULL,
    nama_restaurant character(128),
    almt_restaurant character(150),
    nmr_tlpn text
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16502)
-- Name: restaurants_id_restaurant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurants_id_restaurant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_restaurant_seq OWNER TO postgres;

--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 197
-- Name: restaurants_id_restaurant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurants_id_restaurant_seq OWNED BY public.restaurants.id_restaurant;


--
-- TOC entry 203 (class 1259 OID 16527)
-- Name: specific_restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specific_restaurant (
    id_spec_restaurant integer NOT NULL,
    id_restaurant integer NOT NULL,
    id_menu integer NOT NULL,
    price_menu integer
);


ALTER TABLE public.specific_restaurant OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16525)
-- Name: specific_restaurant_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specific_restaurant_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specific_restaurant_id_menu_seq OWNER TO postgres;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 202
-- Name: specific_restaurant_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specific_restaurant_id_menu_seq OWNED BY public.specific_restaurant.id_menu;


--
-- TOC entry 201 (class 1259 OID 16523)
-- Name: specific_restaurant_id_restaurant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specific_restaurant_id_restaurant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specific_restaurant_id_restaurant_seq OWNER TO postgres;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 201
-- Name: specific_restaurant_id_restaurant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specific_restaurant_id_restaurant_seq OWNED BY public.specific_restaurant.id_restaurant;


--
-- TOC entry 200 (class 1259 OID 16521)
-- Name: specific_restaurant_id_spec_restaurant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specific_restaurant_id_spec_restaurant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specific_restaurant_id_spec_restaurant_seq OWNER TO postgres;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 200
-- Name: specific_restaurant_id_spec_restaurant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specific_restaurant_id_spec_restaurant_seq OWNED BY public.specific_restaurant.id_spec_restaurant;


--
-- TOC entry 208 (class 1259 OID 16573)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id_tag integer NOT NULL,
    tag_name character(100),
    id_restaurant integer NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16571)
-- Name: tags_id_restaurant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_restaurant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_restaurant_seq OWNER TO postgres;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 207
-- Name: tags_id_restaurant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_restaurant_seq OWNED BY public.tags.id_restaurant;


--
-- TOC entry 206 (class 1259 OID 16569)
-- Name: tags_id_tag_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_tag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_tag_seq OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 206
-- Name: tags_id_tag_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_tag_seq OWNED BY public.tags.id_tag;


--
-- TOC entry 2835 (class 2604 OID 16518)
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- TOC entry 2839 (class 2604 OID 16554)
-- Name: orders id_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id_order SET DEFAULT nextval('public.orders_id_order_seq'::regclass);


--
-- TOC entry 2840 (class 2604 OID 16594)
-- Name: orders id_spec_restaurant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id_spec_restaurant SET DEFAULT nextval('public.orders_id_spec_restaurant_seq'::regclass);


--
-- TOC entry 2834 (class 2604 OID 16504)
-- Name: restaurants id_restaurant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id_restaurant SET DEFAULT nextval('public.restaurants_id_restaurant_seq'::regclass);


--
-- TOC entry 2836 (class 2604 OID 16530)
-- Name: specific_restaurant id_spec_restaurant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_restaurant ALTER COLUMN id_spec_restaurant SET DEFAULT nextval('public.specific_restaurant_id_spec_restaurant_seq'::regclass);


--
-- TOC entry 2837 (class 2604 OID 16531)
-- Name: specific_restaurant id_restaurant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_restaurant ALTER COLUMN id_restaurant SET DEFAULT nextval('public.specific_restaurant_id_restaurant_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 16532)
-- Name: specific_restaurant id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_restaurant ALTER COLUMN id_menu SET DEFAULT nextval('public.specific_restaurant_id_menu_seq'::regclass);


--
-- TOC entry 2841 (class 2604 OID 16576)
-- Name: tags id_tag; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id_tag SET DEFAULT nextval('public.tags_id_tag_seq'::regclass);


--
-- TOC entry 2842 (class 2604 OID 16577)
-- Name: tags id_restaurant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id_restaurant SET DEFAULT nextval('public.tags_id_restaurant_seq'::regclass);


--
-- TOC entry 2981 (class 0 OID 16515)
-- Dependencies: 199
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, list_menu) FROM stdin;
1	Ayam Bakar                                                                                                                                                                                              
2	Ayam Goreng                                                                                                                                                                                             
3	Ayam Bakar Bekakak                                                                                                                                                                                      
5	Nasi Goreng special                                                                                                                                                                                     
6	Susu Murni aneka rasa                                                                                                                                                                                   
7	Mie Goreng special                                                                                                                                                                                      
8	Mie rebus special                                                                                                                                                                                       
\.


--
-- TOC entry 2987 (class 0 OID 16551)
-- Dependencies: 205
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id_order, req_order, qty_order, buyer_name, id_spec_restaurant) FROM stdin;
1	ayam bakar madu                                                                                                                                       	2	yudhis                                                                                              	1
2	without petai                                                                                                                                         	1	rizky                                                                                               	6
3	goreng matang                                                                                                                                         	3	yudhis                                                                                              	2
4	telur setengah matang                                                                                                                                 	4	angri                                                                                               	8
\.


--
-- TOC entry 2978 (class 0 OID 16498)
-- Dependencies: 196
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurants (id_restaurant, nama_restaurant, almt_restaurant, nmr_tlpn) FROM stdin;
1	Ayam Bakar & Goreng "ABG"                                                                                                       	Jl. Taman Safari - cibereum                                                                                                                           	+627334842
2	cimory                                                                                                                          	Jl. Raya Bogor                                                                                                                                        	+628392734
3	mieXp                                                                                                                           	Jl. Raya Karawang                                                                                                                                     	++627384923
\.


--
-- TOC entry 2985 (class 0 OID 16527)
-- Dependencies: 203
-- Data for Name: specific_restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specific_restaurant (id_spec_restaurant, id_restaurant, id_menu, price_menu) FROM stdin;
1	1	1	15000
2	1	2	20000
3	1	3	55000
4	2	1	20000
5	2	6	20000
6	2	5	23000
7	3	5	20000
8	3	7	15000
9	3	8	20000
\.


--
-- TOC entry 2990 (class 0 OID 16573)
-- Dependencies: 208
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id_tag, tag_name, id_restaurant) FROM stdin;
1	ayam                                                                                                	1
2	chicken food                                                                                        	1
3	susu                                                                                                	2
4	sapi                                                                                                	2
5	mie pedas                                                                                           	3
6	ayam                                                                                                	2
\.


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 198
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 8, true);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 204
-- Name: orders_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_order_seq', 4, true);


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 209
-- Name: orders_id_spec_restaurant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_spec_restaurant_seq', 4, true);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 197
-- Name: restaurants_id_restaurant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurants_id_restaurant_seq', 11, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 202
-- Name: specific_restaurant_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specific_restaurant_id_menu_seq', 1, false);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 201
-- Name: specific_restaurant_id_restaurant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specific_restaurant_id_restaurant_seq', 1, false);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 200
-- Name: specific_restaurant_id_spec_restaurant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specific_restaurant_id_spec_restaurant_seq', 9, true);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 207
-- Name: tags_id_restaurant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_restaurant_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 206
-- Name: tags_id_tag_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_tag_seq', 6, true);


--
-- TOC entry 2846 (class 2606 OID 16520)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 2850 (class 2606 OID 16558)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);


--
-- TOC entry 2844 (class 2606 OID 16512)
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id_restaurant);


--
-- TOC entry 2848 (class 2606 OID 16534)
-- Name: specific_restaurant specific_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_restaurant
    ADD CONSTRAINT specific_restaurant_pkey PRIMARY KEY (id_spec_restaurant);


--
-- TOC entry 2852 (class 2606 OID 16579)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id_tag);


--
-- TOC entry 2855 (class 2606 OID 16599)
-- Name: orders orders_id_spec_restaurant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_spec_restaurant_fkey FOREIGN KEY (id_spec_restaurant) REFERENCES public.specific_restaurant(id_spec_restaurant);


--
-- TOC entry 2854 (class 2606 OID 16540)
-- Name: specific_restaurant specific_restaurant_id_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_restaurant
    ADD CONSTRAINT specific_restaurant_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- TOC entry 2853 (class 2606 OID 16535)
-- Name: specific_restaurant specific_restaurant_id_restaurant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specific_restaurant
    ADD CONSTRAINT specific_restaurant_id_restaurant_fkey FOREIGN KEY (id_restaurant) REFERENCES public.restaurants(id_restaurant);


--
-- TOC entry 2856 (class 2606 OID 16580)
-- Name: tags tags_id_restaurant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_id_restaurant_fkey FOREIGN KEY (id_restaurant) REFERENCES public.restaurants(id_restaurant);


-- Completed on 2020-10-13 11:13:04 WIB

--
-- PostgreSQL database dump complete
--

