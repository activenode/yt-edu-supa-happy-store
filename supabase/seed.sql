SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg20.04+1)

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '2bf4d9d6-d7cf-4530-9cbe-e0de920b6115', 'authenticated', 'authenticated', 'socks@supa.base', '', '2024-04-19 09:52:37.689053+00', NULL, '', NULL, '', NULL, '', '', '2024-04-19 09:51:51.566348+00', '2024-04-19 09:52:38.046903+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-04-19 09:46:56.666965+00', '2024-04-19 09:52:38.050386+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '312a53ae-c92d-4a84-aa67-f67f54e6be97', 'authenticated', 'authenticated', NULL, '', NULL, NULL, '', NULL, '', NULL, '', '', NULL, '2024-04-19 10:29:26.691744+00', '{}', '{}', NULL, '2024-04-19 10:29:26.686977+00', '2024-04-19 10:29:26.695469+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, true),
	('00000000-0000-0000-0000-000000000000', '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc', 'authenticated', 'authenticated', 'dev@supa.base', '$2a$10$3zofxBM2Up6/J5XOOlZ/iemauYdzxuzjc2T4hWlj883Uz4omot7Lu', '2024-04-17 08:40:09.16513+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-04-19 10:12:33.00416+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-04-17 08:40:09.163415+00', '2024-04-19 10:22:13.991743+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('3c2fb3de-98e0-4a7e-a622-da68b9feb8bc', '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc', '{"sub": "3c2fb3de-98e0-4a7e-a622-da68b9feb8bc", "email": "dev@supa.base", "email_verified": false, "phone_verified": false}', 'email', '2024-04-17 08:40:09.164175+00', '2024-04-17 08:40:09.164201+00', '2024-04-17 08:40:09.164201+00', 'e20a760e-c3b6-467c-b361-45afb2ef3f43'),
	('2bf4d9d6-d7cf-4530-9cbe-e0de920b6115', '2bf4d9d6-d7cf-4530-9cbe-e0de920b6115', '{"sub": "2bf4d9d6-d7cf-4530-9cbe-e0de920b6115", "email": "socks@supa.base", "email_verified": true, "phone_verified": false}', 'email', '2024-04-19 09:52:37.683271+00', '2024-04-19 09:52:37.683321+00', '2024-04-19 09:52:37.689867+00', 'c5152f04-4baf-4b22-858b-0053d3c5f812');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('8d91fad0-b612-4df6-ae8d-1c9592d55fbb', '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc', '2024-04-19 10:12:33.004193+00', '2024-04-19 10:22:13.992141+00', NULL, 'aal1', NULL, '2024-04-19 10:22:13.992109', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '192.168.228.1', NULL),
	('4505ea4d-6281-4dff-9f81-bff102e19dc6', '312a53ae-c92d-4a84-aa67-f67f54e6be97', '2024-04-19 10:29:26.691801+00', '2024-04-19 10:29:26.691801+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:124.0) Gecko/20100101 Firefox/124.0', '192.168.228.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('8d91fad0-b612-4df6-ae8d-1c9592d55fbb', '2024-04-19 10:12:33.004662+00', '2024-04-19 10:12:33.004662+00', 'password', '4c399a27-3e3e-4d9d-8a2d-6b59dd49a998'),
	('4505ea4d-6281-4dff-9f81-bff102e19dc6', '2024-04-19 10:29:26.696044+00', '2024-04-19 10:29:26.696044+00', 'anonymous', 'b5778082-8b93-4da6-a2f6-173251336f39');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 17571, 'fSu_QS8CbKHtfjsG5qTZbQ', '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc', true, '2024-04-19 10:12:33.004365+00', '2024-04-19 10:22:13.990858+00', NULL, '8d91fad0-b612-4df6-ae8d-1c9592d55fbb'),
	('00000000-0000-0000-0000-000000000000', 17573, 'XC9H3Xfk_2h3ARDpqUwbNg', '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc', false, '2024-04-19 10:22:13.991215+00', '2024-04-19 10:22:13.991215+00', 'fSu_QS8CbKHtfjsG5qTZbQ', '8d91fad0-b612-4df6-ae8d-1c9592d55fbb'),
	('00000000-0000-0000-0000-000000000000', 17578, 'iZWvTteZ60aquBBWUC7Exg', '312a53ae-c92d-4a84-aa67-f67f54e6be97', false, '2024-04-19 10:29:26.694239+00', '2024-04-19 10:29:26.694239+00', NULL, '4505ea4d-6281-4dff-9f81-bff102e19dc6');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: blogposts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."products" ("id", "created_at", "name", "image_path", "costs") VALUES
	(1, '2024-04-17 06:22:10.340402+00', 'Supabase Cheatsheet', 'cheatsheet.jpg', 390),
	(2, '2024-04-17 06:25:30.302082+00', 'Mechanical Keyboard', 'keyboard.jpg', 17900),
	(4, '2024-04-17 06:28:08.62237+00', 'A teddybear', 'teddy.jpg', 2900),
	(5, '2024-04-17 07:30:31.04444+00', 'Coffee and Cookies', 'coffee.jpg', 690),
	(6, '2024-04-19 08:28:02.621244+00', 'Ant''s used Socks', 'socks.jpg', 900000);


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cart_items" ("id", "created_at", "product", "user") VALUES
	(110, '2024-04-19 08:55:14.442473+00', 4, '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc'),
	(111, '2024-04-19 08:55:15.476854+00', 2, '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc'),
	(112, '2024-04-19 08:55:18.105312+00', 1, '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc'),
	(131, '2024-04-19 09:50:32.07133+00', 2, '2bf4d9d6-d7cf-4530-9cbe-e0de920b6115'),
	(132, '2024-04-19 09:50:33.751769+00', 4, '2bf4d9d6-d7cf-4530-9cbe-e0de920b6115'),
	(133, '2024-04-19 09:50:35.783369+00', 1, '2bf4d9d6-d7cf-4530-9cbe-e0de920b6115'),
	(134, '2024-04-19 09:50:36.634056+00', 6, '2bf4d9d6-d7cf-4530-9cbe-e0de920b6115'),
	(147, '2024-04-19 10:12:33.027537+00', 5, '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc'),
	(148, '2024-04-19 10:12:33.027537+00', 5, '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc'),
	(149, '2024-04-19 10:12:33.027537+00', 5, '3c2fb3de-98e0-4a7e-a622-da68b9feb8bc');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 17578, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: blogposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."blogposts_id_seq"', 1, false);


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."cart_items_id_seq"', 150, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."products_id_seq"', 6, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
