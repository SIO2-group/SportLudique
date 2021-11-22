USE sport_ludique;

INSERT INTO sport_ludique.brand (id, name, icon_path) VALUES (1, 'nike', 'todo');
INSERT INTO sport_ludique.brand (id, name, icon_path) VALUES (2, 'adidas', 'todo');
INSERT INTO sport_ludique.brand (id, name, icon_path) VALUES (3, 'puma', 'todo');
INSERT INTO sport_ludique.brand (id, name, icon_path) VALUES (4, 'arena', 'todo');
INSERT INTO sport_ludique.brand (id, name, icon_path) VALUES (5, 'asics', 'todo');

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
INSERT INTO sport_ludique.category (id, name) VALUES (11, 'football');
INSERT INTO sport_ludique.category (id, name) VALUES (12, 'natation');
INSERT INTO sport_ludique.category (id, name) VALUES (13, 'cyclisme');
INSERT INTO sport_ludique.category (id, name) VALUES (14, 'trail');
INSERT INTO sport_ludique.category (id, name) VALUES (15, 'tennis');

INSERT INTO sport_ludique.size (id, label) VALUES (1, 'S');
INSERT INTO sport_ludique.size (id, label) VALUES (2, 'M');
INSERT INTO sport_ludique.size (id, label) VALUES (3, 'L');
INSERT INTO sport_ludique.size (id, label) VALUES (4, 'XL');
INSERT INTO sport_ludique.size (id, label) VALUES (5, 'XXL');

INSERT INTO sport_ludique.color (id, label) VALUES (1, 'noir');
INSERT INTO sport_ludique.color (id, label) VALUES (2, 'blanc');
INSERT INTO sport_ludique.color (id, label) VALUES (3, 'bleu');
INSERT INTO sport_ludique.color (id, label) VALUES (4, 'rouge');
INSERT INTO sport_ludique.color (id, label) VALUES (5, 'vert');
INSERT INTO sport_ludique.color (id, label) VALUES (6, 'violet');
INSERT INTO sport_ludique.color (id, label) VALUES (7, 'orange');
INSERT INTO sport_ludique.color (id, label) VALUES (8, 'gris');
INSERT INTO sport_ludique.color (id, label) VALUES (9, 'marron');
INSERT INTO sport_ludique.color (id, label) VALUES (10, 'jaune');
INSERT INTO sport_ludique.color (id, label) VALUES (11, 'rose');

INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (1, 1, 2, 1, 'Maillot de supporteur Football Homme PSG MNK DF STAD JSY SS AW', 89.99, 26, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (2, 1, 1, 1, 'Echarpe de football Unisexe NK STRKE SNOOD Noir', 19.99, 39, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (3, 1, 1, 1, 'Vêtements de football Enfant PSG LKNK DF STRK TRK SUIT K AW Noir', 64.99, 17, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (4, 1, 1, 1, 'Pantalon de supporteur Homme PSG MNK DF STADIUM SHORT 3R', 39.99, 71, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (5, 2, 1, 1, 'Pantalon homme JUVE TR PNT Noir', 55, 82, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (6, 3, 3, 1, 'Maillot de football Homme OM AWAY SHIRT REP SPO Bleu', 90, 5, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (7, 3, 1, 1, 'Tongs Homme EPIC FLIP V2 Noir', 20, 92, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (8, 2, 3, 1, 'Maillot de bain homme FIT 3SECOND BX Bleu', 29.95, 128, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (9, 2, 1, 1, 'Claquettes Unisexe ADILETTE AQUA Noir', 20, 118, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (10, 4, 1, 1, 'Lunettes de natation homme ZOOM X-FIT Noir', 12, 105, 'todo', 1);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (11, 2, 1, 1, 'Maillot de bain homme FIT BX BOS Noir', 23, 206, 'todo', 0);
INSERT INTO sport_ludique.article (id, brand_id, color_id, size_id, name, price, quantity, image_path, is_active)VALUES (12, 4, 1, 1, 'Maillot de bain femme W VIBRANCY SWIM PRO BACK ONE PIECE Noir', 40, 152, 'todo', 0);

INSERT INTO sport_ludique.include (article_id, category_id) VALUES (1, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (1, 5);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (1, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (2, 7);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (2, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (3, 3);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (3, 10);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (3, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (4, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (4, 4);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (4, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (5, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (5, 4);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (5, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (6, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (6, 5);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (6, 11);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (7, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (7, 6);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (7, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (8, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (8, 8);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (8, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (9, 6);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (9, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (10, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (10, 7);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (10, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (11, 1);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (11, 8);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (11, 12);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (12, 2);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (12, 8);
INSERT INTO sport_ludique.include (article_id, category_id) VALUES (12, 12);

INSERT INTO sport_ludique.status (id, label) VALUES (1, 'cart');
INSERT INTO sport_ludique.status (id, label) VALUES (2, 'ordered');
INSERT INTO sport_ludique.status (id, label) VALUES (3, 'payed');
INSERT INTO sport_ludique.status (id, label) VALUES (4, 'delivered');

INSERT INTO sport_ludique.user (id, name, email, roles, password) VALUES (1, 'JeanLAFONTAINE', 'jean.lafontaine@gmail.com', '{"ROLES": "ROLES_ADMIN"}', 'l4f0nt4ine');
INSERT INTO sport_ludique.user (id, name, email, roles, password) VALUES (2, 'BernieCORNEIL', 'bernie.corneil@gmail.com', '{"ROLES": "ROLES_USER"}', 'c0rn31l');
INSERT INTO sport_ludique.user (id, name, email, roles, password) VALUES (3, 'MichelBOILO', 'michel.boilo@gmail.com', '{"ROLES": "ROLES_ADMIN"}', 'm1ch3l');
INSERT INTO sport_ludique.user (id, name, email, roles, password) VALUES (4, 'RemyVOLTERRE', 'remy.volterre@gmail.com', '{"ROLES": "ROLES_USER"}', 'v0lt1r');
INSERT INTO sport_ludique.user (id, name, email, roles, password) VALUES (5, 'jacques_mau28', 'jacques.mauliere@gmail.com', null, 'm0l13r');

INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (2, 4, 1, 'nul', '2020-01-01 12:17:29');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (3, 2, 0, 'trop nul !', '2021-09-11 10:10:24');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (6, 2, 3, 'j''aime bien', '2021-10-21 17:42:02');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (7, 4, 5, 'super j''adore', '2019-09-03 20:20:46');
INSERT INTO sport_ludique.review (article_id, user_id, note, comment, post_date) VALUES (10, 2, 4, 'cool', '2020-04-28 11:44:12');

