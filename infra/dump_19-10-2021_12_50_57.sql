--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.api_favorites OWNER TO postgres;

--
-- Name: api_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_favorites_id_seq OWNER TO postgres;

--
-- Name: api_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_favorites_id_seq OWNED BY public.api_favorites.id;


--
-- Name: api_favorites_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_favorites_recipe (
    id bigint NOT NULL,
    favorites_id bigint NOT NULL,
    recipes_id bigint NOT NULL
);


ALTER TABLE public.api_favorites_recipe OWNER TO postgres;

--
-- Name: api_favorites_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_favorites_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_favorites_recipe_id_seq OWNER TO postgres;

--
-- Name: api_favorites_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_favorites_recipe_id_seq OWNED BY public.api_favorites_recipe.id;


--
-- Name: api_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_ingredients (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    measurement_unit character varying(200) NOT NULL
);


ALTER TABLE public.api_ingredients OWNER TO postgres;

--
-- Name: api_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_ingredients_id_seq OWNER TO postgres;

--
-- Name: api_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_ingredients_id_seq OWNED BY public.api_ingredients.id;


--
-- Name: api_recipeingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipeingredient (
    id bigint NOT NULL,
    amount smallint NOT NULL,
    ingredients_id bigint NOT NULL,
    recipes_id bigint NOT NULL
);


ALTER TABLE public.api_recipeingredient OWNER TO postgres;

--
-- Name: api_recipeingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipeingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipeingredient_id_seq OWNER TO postgres;

--
-- Name: api_recipeingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipeingredient_id_seq OWNED BY public.api_recipeingredient.id;


--
-- Name: api_recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipes (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    name character varying(200) NOT NULL,
    text text NOT NULL,
    cooking_time smallint NOT NULL,
    author_id bigint,
    CONSTRAINT api_recipes_cooking_time_check CHECK ((cooking_time >= 0))
);


ALTER TABLE public.api_recipes OWNER TO postgres;

--
-- Name: api_recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipes_id_seq OWNER TO postgres;

--
-- Name: api_recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipes_id_seq OWNED BY public.api_recipes.id;


--
-- Name: api_recipes_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipes_tags (
    id bigint NOT NULL,
    recipes_id bigint NOT NULL,
    tags_id bigint NOT NULL
);


ALTER TABLE public.api_recipes_tags OWNER TO postgres;

--
-- Name: api_recipes_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipes_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipes_tags_id_seq OWNER TO postgres;

--
-- Name: api_recipes_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipes_tags_id_seq OWNED BY public.api_recipes_tags.id;


--
-- Name: api_shoppingcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_shoppingcard (
    id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.api_shoppingcard OWNER TO postgres;

--
-- Name: api_shoppingcard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_shoppingcard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_shoppingcard_id_seq OWNER TO postgres;

--
-- Name: api_shoppingcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_shoppingcard_id_seq OWNED BY public.api_shoppingcard.id;


--
-- Name: api_shoppingcard_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_shoppingcard_recipe (
    id bigint NOT NULL,
    shoppingcard_id bigint NOT NULL,
    recipes_id bigint NOT NULL
);


ALTER TABLE public.api_shoppingcard_recipe OWNER TO postgres;

--
-- Name: api_shoppingcard_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_shoppingcard_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_shoppingcard_recipe_id_seq OWNER TO postgres;

--
-- Name: api_shoppingcard_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_shoppingcard_recipe_id_seq OWNED BY public.api_shoppingcard_recipe.id;


--
-- Name: api_subscribes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_subscribes (
    id bigint NOT NULL,
    subscribe_on_id bigint NOT NULL,
    subscriber_id bigint NOT NULL
);


ALTER TABLE public.api_subscribes OWNER TO postgres;

--
-- Name: api_subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_subscribes_id_seq OWNER TO postgres;

--
-- Name: api_subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_subscribes_id_seq OWNED BY public.api_subscribes.id;


--
-- Name: api_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_tags (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(7) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.api_tags OWNER TO postgres;

--
-- Name: api_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_tags_id_seq OWNER TO postgres;

--
-- Name: api_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_tags_id_seq OWNED BY public.api_tags.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    role character varying(30) NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: api_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites ALTER COLUMN id SET DEFAULT nextval('public.api_favorites_id_seq'::regclass);


--
-- Name: api_favorites_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites_recipe ALTER COLUMN id SET DEFAULT nextval('public.api_favorites_recipe_id_seq'::regclass);


--
-- Name: api_ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredients ALTER COLUMN id SET DEFAULT nextval('public.api_ingredients_id_seq'::regclass);


--
-- Name: api_recipeingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipeingredient ALTER COLUMN id SET DEFAULT nextval('public.api_recipeingredient_id_seq'::regclass);


--
-- Name: api_recipes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes ALTER COLUMN id SET DEFAULT nextval('public.api_recipes_id_seq'::regclass);


--
-- Name: api_recipes_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes_tags ALTER COLUMN id SET DEFAULT nextval('public.api_recipes_tags_id_seq'::regclass);


--
-- Name: api_shoppingcard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard ALTER COLUMN id SET DEFAULT nextval('public.api_shoppingcard_id_seq'::regclass);


--
-- Name: api_shoppingcard_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard_recipe ALTER COLUMN id SET DEFAULT nextval('public.api_shoppingcard_recipe_id_seq'::regclass);


--
-- Name: api_subscribes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_subscribes ALTER COLUMN id SET DEFAULT nextval('public.api_subscribes_id_seq'::regclass);


--
-- Name: api_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tags ALTER COLUMN id SET DEFAULT nextval('public.api_tags_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: api_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_favorites (id, user_id) FROM stdin;
1	1
\.


--
-- Data for Name: api_favorites_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_favorites_recipe (id, favorites_id, recipes_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: api_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_ingredients (id, name, measurement_unit) FROM stdin;
1	Соль	г
2	Сахар	г
3	Хуй	г
\.


--
-- Data for Name: api_recipeingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_recipeingredient (id, amount, ingredients_id, recipes_id) FROM stdin;
3	1	2	1
\.


--
-- Data for Name: api_recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_recipes (id, image, name, text, cooking_time, author_id) FROM stdin;
1	0b7e1e22-f99c-46c5-84a2-1c23e5bc8079.jpg	Хуй	Без соли	10	1
\.


--
-- Data for Name: api_recipes_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_recipes_tags (id, recipes_id, tags_id) FROM stdin;
1	1	2
2	1	1
\.


--
-- Data for Name: api_shoppingcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_shoppingcard (id, user_id) FROM stdin;
1	1
\.


--
-- Data for Name: api_shoppingcard_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_shoppingcard_recipe (id, shoppingcard_id, recipes_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: api_subscribes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_subscribes (id, subscribe_on_id, subscriber_id) FROM stdin;
\.


--
-- Data for Name: api_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_tags (id, name, color, slug) FROM stdin;
2	c cахаром	#B78450	sugar
1	с солью	#FFFFFF	sault
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add token	7	add_tokenproxy
26	Can change token	7	change_tokenproxy
27	Can delete token	7	delete_tokenproxy
28	Can view token	7	view_tokenproxy
29	Can add user	8	add_user
30	Can change user	8	change_user
31	Can delete user	8	delete_user
32	Can view user	8	view_user
33	Can add Ingredients	9	add_ingredients
34	Can change Ingredients	9	change_ingredients
35	Can delete Ingredients	9	delete_ingredients
36	Can view Ingredients	9	view_ingredients
37	Can add Recipe ingredient	10	add_recipeingredient
38	Can change Recipe ingredient	10	change_recipeingredient
39	Can delete Recipe ingredient	10	delete_recipeingredient
40	Can view Recipe ingredient	10	view_recipeingredient
41	Can add Recipes	11	add_recipes
42	Can change Recipes	11	change_recipes
43	Can delete Recipes	11	delete_recipes
44	Can view Recipes	11	view_recipes
45	Can add Tags	12	add_tags
46	Can change Tags	12	change_tags
47	Can delete Tags	12	delete_tags
48	Can view Tags	12	view_tags
49	Can add Follow	13	add_subscribes
50	Can change Follow	13	change_subscribes
51	Can delete Follow	13	delete_subscribes
52	Can view Follow	13	view_subscribes
53	Can add Shopping card	14	add_shoppingcard
54	Can change Shopping card	14	change_shoppingcard
55	Can delete Shopping card	14	delete_shoppingcard
56	Can view Shopping card	14	view_shoppingcard
57	Can add List of favorite recipes	15	add_favorites
58	Can change List of favorite recipes	15	change_favorites
59	Can delete List of favorite recipes	15	delete_favorites
60	Can view List of favorite recipes	15	view_favorites
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
624132c2d404db1a4f0f4c45b976cf52a1b63000	2021-10-19 11:51:17.160911+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-19 11:09:37.315014+00	1	Соль	1	[{"added": {}}]	12	2
2	2021-10-19 11:09:55.694483+00	2	Сахар	1	[{"added": {}}]	12	2
3	2021-10-19 11:11:52.855923+00	2	c cахаром	2	[{"changed": {"fields": ["Tag's name"]}}]	12	2
4	2021-10-19 11:11:58.588313+00	1	с солью	2	[{"changed": {"fields": ["Tag's name"]}}]	12	2
5	2021-10-19 11:19:18.257199+00	1	Соль	1	[{"added": {}}]	9	2
6	2021-10-19 11:19:27.254193+00	2	Сахар	1	[{"added": {}}]	9	2
7	2021-10-19 11:50:57.949559+00	3	Хуй	1	[{"added": {}}]	9	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	users	user
9	api	ingredients
10	api	recipeingredient
11	api	recipes
12	api	tags
13	api	subscribes
14	api	shoppingcard
15	api	favorites
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-19 09:39:13.759914+00
2	contenttypes	0002_remove_content_type_name	2021-10-19 09:39:13.768623+00
3	auth	0001_initial	2021-10-19 09:39:13.83138+00
4	auth	0002_alter_permission_name_max_length	2021-10-19 09:39:13.837528+00
5	auth	0003_alter_user_email_max_length	2021-10-19 09:39:13.843772+00
6	auth	0004_alter_user_username_opts	2021-10-19 09:39:13.850459+00
7	auth	0005_alter_user_last_login_null	2021-10-19 09:39:13.857136+00
8	auth	0006_require_contenttypes_0002	2021-10-19 09:39:13.860231+00
9	auth	0007_alter_validators_add_error_messages	2021-10-19 09:39:13.866605+00
10	auth	0008_alter_user_username_max_length	2021-10-19 09:39:13.872851+00
11	auth	0009_alter_user_last_name_max_length	2021-10-19 09:39:13.878967+00
12	auth	0010_alter_group_name_max_length	2021-10-19 09:39:13.885401+00
13	auth	0011_update_proxy_permissions	2021-10-19 09:39:13.893407+00
14	auth	0012_alter_user_first_name_max_length	2021-10-19 09:39:13.899487+00
15	users	0001_initial	2021-10-19 09:39:14.010025+00
16	admin	0001_initial	2021-10-19 09:39:14.045817+00
17	admin	0002_logentry_remove_auto_add	2021-10-19 09:39:14.05518+00
18	admin	0003_logentry_add_action_flag_choices	2021-10-19 09:39:14.065423+00
19	api	0001_initial	2021-10-19 09:39:14.3033+00
20	authtoken	0001_initial	2021-10-19 09:39:14.343682+00
21	authtoken	0002_auto_20160226_1747	2021-10-19 09:39:14.426743+00
22	authtoken	0003_tokenproxy	2021-10-19 09:39:14.432147+00
23	sessions	0001_initial	2021-10-19 09:39:14.466945+00
24	users	0002_alter_user_role	2021-10-19 09:39:14.48042+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
p3n6qf9clq3w6njwgp2sp0oifyohm7v2	.eJxVjMsOwiAQRf-FtSF0oDxcuvcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZnAeL0uxGmB7cd5Du22yzT3NZlIrkr8qBdXufMz8vh_h1U7PVbe48mFQ4OtKZgnbZAyisfBkOj95mMYSjOOYYAOkNhi5w52TBSGRSI9wfKnDeQ:1mcmze:_nowymnYVc2xHb5_l0mOT1Ap-bxpUrL0YjN0WjFovLc	2021-11-02 11:09:18.652912+00
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, is_superuser, is_staff, is_active, date_joined, email, role, username, first_name, last_name) FROM stdin;
2	pbkdf2_sha256$260000$0Dn0GAFyIo4kNmzuYqqxB2$fpQ9dData41jT0d1dR92Ua11Q2DIaK5BMO6IcaFyEE4=	2021-10-19 11:09:18.65035+00	t	t	t	2021-10-19 10:22:46.630016+00	admin@admin.com	user	admin		
1	pbkdf2_sha256$260000$eNtXSFCJz8b4gDxdftkZNn$qLoU4uAsC2Q6NCxSlYPsJYisvWxoAZg3X8Vbjj9vmDI=	2021-10-19 11:51:17.164848+00	f	f	t	2021-10-19 09:43:39.552024+00	pavel@pavel.com	user	pavel	pavel	pavel
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: api_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_favorites_id_seq', 1, true);


--
-- Name: api_favorites_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_favorites_recipe_id_seq', 1, true);


--
-- Name: api_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_ingredients_id_seq', 3, true);


--
-- Name: api_recipeingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipeingredient_id_seq', 3, true);


--
-- Name: api_recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipes_id_seq', 1, true);


--
-- Name: api_recipes_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipes_tags_id_seq', 6, true);


--
-- Name: api_shoppingcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_shoppingcard_id_seq', 1, true);


--
-- Name: api_shoppingcard_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_shoppingcard_recipe_id_seq', 1, true);


--
-- Name: api_subscribes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_subscribes_id_seq', 1, false);


--
-- Name: api_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_tags_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 7, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: api_favorites api_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites
    ADD CONSTRAINT api_favorites_pkey PRIMARY KEY (id);


--
-- Name: api_favorites_recipe api_favorites_recipe_favorites_id_recipes_id_97964578_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites_recipe
    ADD CONSTRAINT api_favorites_recipe_favorites_id_recipes_id_97964578_uniq UNIQUE (favorites_id, recipes_id);


--
-- Name: api_favorites_recipe api_favorites_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites_recipe
    ADD CONSTRAINT api_favorites_recipe_pkey PRIMARY KEY (id);


--
-- Name: api_ingredients api_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_ingredients
    ADD CONSTRAINT api_ingredients_pkey PRIMARY KEY (id);


--
-- Name: api_recipeingredient api_recipeingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipeingredient
    ADD CONSTRAINT api_recipeingredient_pkey PRIMARY KEY (id);


--
-- Name: api_recipes api_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes
    ADD CONSTRAINT api_recipes_pkey PRIMARY KEY (id);


--
-- Name: api_recipes_tags api_recipes_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes_tags
    ADD CONSTRAINT api_recipes_tags_pkey PRIMARY KEY (id);


--
-- Name: api_recipes_tags api_recipes_tags_recipes_id_tags_id_9e0203ea_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes_tags
    ADD CONSTRAINT api_recipes_tags_recipes_id_tags_id_9e0203ea_uniq UNIQUE (recipes_id, tags_id);


--
-- Name: api_shoppingcard api_shoppingcard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard
    ADD CONSTRAINT api_shoppingcard_pkey PRIMARY KEY (id);


--
-- Name: api_shoppingcard_recipe api_shoppingcard_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard_recipe
    ADD CONSTRAINT api_shoppingcard_recipe_pkey PRIMARY KEY (id);


--
-- Name: api_shoppingcard_recipe api_shoppingcard_recipe_shoppingcard_id_recipes__64f01bc8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard_recipe
    ADD CONSTRAINT api_shoppingcard_recipe_shoppingcard_id_recipes__64f01bc8_uniq UNIQUE (shoppingcard_id, recipes_id);


--
-- Name: api_subscribes api_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_subscribes
    ADD CONSTRAINT api_subscribes_pkey PRIMARY KEY (id);


--
-- Name: api_tags api_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_tags
    ADD CONSTRAINT api_tags_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_subscribes unique_subscribe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_subscribes
    ADD CONSTRAINT unique_subscribe UNIQUE (subscriber_id, subscribe_on_id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user users_user_first_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_first_name_key UNIQUE (first_name);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_last_name_key UNIQUE (last_name);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: api_favorites_recipe_favorites_id_92c578f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_favorites_recipe_favorites_id_92c578f9 ON public.api_favorites_recipe USING btree (favorites_id);


--
-- Name: api_favorites_recipe_recipes_id_f0642a15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_favorites_recipe_recipes_id_f0642a15 ON public.api_favorites_recipe USING btree (recipes_id);


--
-- Name: api_favorites_user_id_4c612f91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_favorites_user_id_4c612f91 ON public.api_favorites USING btree (user_id);


--
-- Name: api_recipeingredient_ingredients_id_23ce8022; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipeingredient_ingredients_id_23ce8022 ON public.api_recipeingredient USING btree (ingredients_id);


--
-- Name: api_recipeingredient_recipes_id_79e54119; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipeingredient_recipes_id_79e54119 ON public.api_recipeingredient USING btree (recipes_id);


--
-- Name: api_recipes_author_id_39b2d3bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipes_author_id_39b2d3bc ON public.api_recipes USING btree (author_id);


--
-- Name: api_recipes_tags_recipes_id_e5aafcf0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipes_tags_recipes_id_e5aafcf0 ON public.api_recipes_tags USING btree (recipes_id);


--
-- Name: api_recipes_tags_tags_id_85a7fd38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipes_tags_tags_id_85a7fd38 ON public.api_recipes_tags USING btree (tags_id);


--
-- Name: api_shoppingcard_recipe_recipes_id_3ea23afa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_shoppingcard_recipe_recipes_id_3ea23afa ON public.api_shoppingcard_recipe USING btree (recipes_id);


--
-- Name: api_shoppingcard_recipe_shoppingcard_id_f7599b71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_shoppingcard_recipe_shoppingcard_id_f7599b71 ON public.api_shoppingcard_recipe USING btree (shoppingcard_id);


--
-- Name: api_shoppingcard_user_id_7bc0260f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_shoppingcard_user_id_7bc0260f ON public.api_shoppingcard USING btree (user_id);


--
-- Name: api_subscribes_subscribe_on_id_10a056f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_subscribes_subscribe_on_id_10a056f7 ON public.api_subscribes USING btree (subscribe_on_id);


--
-- Name: api_subscribes_subscriber_id_10421620; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_subscribes_subscriber_id_10421620 ON public.api_subscribes USING btree (subscriber_id);


--
-- Name: api_tags_slug_95d1099d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_tags_slug_95d1099d ON public.api_tags USING btree (slug);


--
-- Name: api_tags_slug_95d1099d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_tags_slug_95d1099d_like ON public.api_tags USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_first_name_1bd0e2c1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_first_name_1bd0e2c1_like ON public.users_user USING btree (first_name varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_last_name_fb97206b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_last_name_fb97206b_like ON public.users_user USING btree (last_name varchar_pattern_ops);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: api_favorites_recipe api_favorites_recipe_favorites_id_92c578f9_fk_api_favorites_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites_recipe
    ADD CONSTRAINT api_favorites_recipe_favorites_id_92c578f9_fk_api_favorites_id FOREIGN KEY (favorites_id) REFERENCES public.api_favorites(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favorites_recipe api_favorites_recipe_recipes_id_f0642a15_fk_api_recipes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites_recipe
    ADD CONSTRAINT api_favorites_recipe_recipes_id_f0642a15_fk_api_recipes_id FOREIGN KEY (recipes_id) REFERENCES public.api_recipes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favorites api_favorites_user_id_4c612f91_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_favorites
    ADD CONSTRAINT api_favorites_user_id_4c612f91_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipeingredient api_recipeingredient_ingredients_id_23ce8022_fk_api_ingre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipeingredient
    ADD CONSTRAINT api_recipeingredient_ingredients_id_23ce8022_fk_api_ingre FOREIGN KEY (ingredients_id) REFERENCES public.api_ingredients(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipeingredient api_recipeingredient_recipes_id_79e54119_fk_api_recipes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipeingredient
    ADD CONSTRAINT api_recipeingredient_recipes_id_79e54119_fk_api_recipes_id FOREIGN KEY (recipes_id) REFERENCES public.api_recipes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipes api_recipes_author_id_39b2d3bc_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes
    ADD CONSTRAINT api_recipes_author_id_39b2d3bc_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipes_tags api_recipes_tags_recipes_id_e5aafcf0_fk_api_recipes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes_tags
    ADD CONSTRAINT api_recipes_tags_recipes_id_e5aafcf0_fk_api_recipes_id FOREIGN KEY (recipes_id) REFERENCES public.api_recipes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipes_tags api_recipes_tags_tags_id_85a7fd38_fk_api_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipes_tags
    ADD CONSTRAINT api_recipes_tags_tags_id_85a7fd38_fk_api_tags_id FOREIGN KEY (tags_id) REFERENCES public.api_tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shoppingcard_recipe api_shoppingcard_rec_shoppingcard_id_f7599b71_fk_api_shopp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard_recipe
    ADD CONSTRAINT api_shoppingcard_rec_shoppingcard_id_f7599b71_fk_api_shopp FOREIGN KEY (shoppingcard_id) REFERENCES public.api_shoppingcard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shoppingcard_recipe api_shoppingcard_recipe_recipes_id_3ea23afa_fk_api_recipes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard_recipe
    ADD CONSTRAINT api_shoppingcard_recipe_recipes_id_3ea23afa_fk_api_recipes_id FOREIGN KEY (recipes_id) REFERENCES public.api_recipes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_shoppingcard api_shoppingcard_user_id_7bc0260f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_shoppingcard
    ADD CONSTRAINT api_shoppingcard_user_id_7bc0260f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_subscribes api_subscribes_subscribe_on_id_10a056f7_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_subscribes
    ADD CONSTRAINT api_subscribes_subscribe_on_id_10a056f7_fk_users_user_id FOREIGN KEY (subscribe_on_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_subscribes api_subscribes_subscriber_id_10421620_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_subscribes
    ADD CONSTRAINT api_subscribes_subscriber_id_10421620_fk_users_user_id FOREIGN KEY (subscriber_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

