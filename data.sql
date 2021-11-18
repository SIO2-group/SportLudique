USE sport_ludique;

INSERT INTO sport_ludique.brand (id, name) VALUES (1, 'nike');
INSERT INTO sport_ludique.brand (id, name) VALUES (2, 'adidas');
INSERT INTO sport_ludique.brand (id, name) VALUES (3, 'lecoqsportif');
INSERT INTO sport_ludique.brand (id, name) VALUES (4, 'asics');
INSERT INTO sport_ludique.brand (id, name) VALUES (5, 'puma');

INSERT INTO sport_ludique.category (id, name) VALUES (1, 'homme');
INSERT INTO sport_ludique.category (id, name) VALUES (2, 'femme');
INSERT INTO sport_ludique.category (id, name) VALUES (3, 'enfant');
INSERT INTO sport_ludique.category (id, name) VALUES (4, 'pantalons');
INSERT INTO sport_ludique.category (id, name) VALUES (5, 'tee-shirts');
INSERT INTO sport_ludique.category (id, name) VALUES (6, 'chaussures');
INSERT INTO sport_ludique.category (id, name) VALUES (7, 'accessoires');
INSERT INTO sport_ludique.category (id, name) VALUES (8, 'maillots');
INSERT INTO sport_ludique.category (id, name) VALUES (9, 'pulls');
INSERT INTO sport_ludique.category (id, name) VALUES (10, 'survêtements');

INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (7, 1, 'Maillot de supporteur Football Homme PSG MNK DF STAD JSY SS AW', 89.99, 26, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (8, 1, 'Echarpe de football Unisexe NK STRKE SNOOD Noir', 19.99, 39, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (10, 1, 'Vêtements de football Enfant PSG LKNK DF STRK TRK SUIT K AW Noir', 64.99, 17, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (11, 1, 'Pantalon de supporteur Homme PSG MNK DF STADIUM SHORT 3R', 39.99, 71, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (12, 2, 'pantalon homme JUVE TR PNT Noir', 55, 82, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (13, 5, 'Maillot de football Homme OM AWAY SHIRT REP SPO Bleu', 90, 5, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (14, 5, 'Tongs Homme EPIC FLIP V2 Noir', 20, 92, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (15, 2, 'Maillot de bain homme FIT 3SECOND BX Bleu', 29.95, 128, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (16, 2, 'Claquettes Unisexe ADILETTE AQUA Noir', 20, 118, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (17, 6, 'Lunettes de natation homme ZOOM X-FIT Noir', 12, 105, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (18, 2, 'Maillot de bain homme FIT BX BOS Noir', 23, 206, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, name, price, quantity, path, is_active) VALUES (19, 6, 'Maillot de bain femme W VIBRANCY SWIM PRO BACK ONE PIECE Noir', 40, 152, 'todo', 0);

INSERT INTO sport_ludique.include (article_id, category_id) VALUES (7, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (7, 5);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (7, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (8, 7);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (8, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (10, 3);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (10, 10);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (10, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (11, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (11, 4);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (11, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (12, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (12, 4);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (12, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (13, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (13, 5);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (13, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (14, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (14, 6);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (14, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (15, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (15, 8);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (15, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (16, 6);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (16, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (17, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (17, 7);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (17, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (18, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (18, 8);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (18, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (19, 2);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (19, 8);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (19, 11);

INSERT INTO sport_ludique.user (id, last_name, first_name, email, roles, password) VALUES (1, 'LAFONTAINE', 'Jean', 'jean.lafontaine@gmail.com', '{"ROLES": "ROLES_ADMIN"}', 'l4f0nt4ine');
INSERT INTO sport_ludique.user (id, last_name, first_name, email, roles, password) VALUES (2, 'CORNEIL', 'Bernie', 'bernie.corneil@gmail.com', '{"ROLES": "ROLES_USER"}', 'c0rn31l');
INSERT INTO sport_ludique.user (id, last_name, first_name, email, roles, password) VALUES (3, 'BOILO', 'Michel', 'michel.boilo@gmail.com', '{"ROLES": "ROLES_ADMIN"}', 'm1ch3l');
INSERT INTO sport_ludique.user (id, last_name, first_name, email, roles, password) VALUES (4, 'VOLTERRE', 'Remy', 'remy.volterre@gmail.com', '{"ROLES": "ROLES_USER"}', 'v0lt1r');
INSERT INTO sport_ludique.user (id, last_name, first_name, email, roles, password) VALUES (5, 'MAULIERE', 'Jacques', 'jacques.mauliere@gmail.com', null, 'm0l13r');

INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (8, 4, 1, 'nul', '2020-01-01 12:17:29');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (10, 2, 0, 'trop nul !', '2021-09-11 10:10:24');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (13, 2, 3, 'j''aime bien', '2021-10-21 17:42:02');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (15, 4, 5, 'super j''adore', '2019-09-03 20:20:46');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (18, 2, 4, 'cool', '2020-04-28 11:44:12');

