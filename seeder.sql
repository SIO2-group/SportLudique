DROP DATABASE IF EXISTS sport_ludique;

CREATE DATABASE IF NOT EXISTS sport_ludique;
USE sport_ludique;

CREATE TABLE IF NOT EXISTS invoice
(
    id        INT AUTO_INCREMENT
        PRIMARY KEY,
    pay_date  DATETIME NULL,
    status_id INT      NULL,
    FOREIGN KEY fk_invoice_status (status_id)
        REFERENCES status (id)
);

CREATE TABLE IF NOT EXISTS user
(
    id         INT AUTO_INCREMENT
        PRIMARY KEY,
    last_name  VARCHAR(128) NULL,
    first_name VARCHAR(128) NULL,
    email      VARCHAR(128) NOT NULL,
    roles      JSON         NULL,
    password   VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS category
(
    id   INT AUTO_INCREMENT
        PRIMARY KEY,
    name VARCHAR(64) NULL
);

CREATE TABLE IF NOT EXISTS article
(
    id          INT AUTO_INCREMENT
        PRIMARY KEY,
    category_id INT         NULL,
    brand_id    INT         NULL,
    name        VARCHAR(64) NOT NULL,
    price       FLOAT       NOT NULL,
    quantity    INT         NULL,
    is_active   BOOL        NULL,
    FOREIGN KEY fk_article_category (category_id)
        REFERENCES category (id),
    FOREIGN KEY fk_article_brand (brand_id)
        REFERENCES brand (id)
);

CREATE TABLE IF NOT EXISTS brand
(
    id   INT AUTO_INCREMENT
        PRIMARY KEY,
    name VARCHAR(64) NULL
);

CREATE TABLE IF NOT EXISTS status
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(64) NULL
);

CREATE TABLE IF NOT EXISTS `order`
(
    invoice_id INT NOT NULL
        PRIMARY KEY,
    article_id INT NOT NULL
        PRIMARY KEY,
    user_id    INT NOT NULL
        PRIMARY KEY,
    status_id  INT NOT NULL,
    FOREIGN KEY fk_order_invoice (invoice_id)
        REFERENCES invoice (id),
    FOREIGN KEY fk_order_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_order_user (user_id)
        REFERENCES user (id),
    FOREIGN KEY fk_ordre_status (status_id)
        REFERENCES status (id)
);

CREATE TABLE IF NOT EXISTS review
(
    article_id INT           NULL
        PRIMARY KEY,
    user_id    INT           NULL
        PRIMARY KEY,
    note       INT(3)        NULL,
    comment    VARCHAR(1024) NULL,
    post_date  DATETIME      NULL,
    FOREIGN KEY fk_review_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_review_user (user_id)
        REFERENCES user (id)
);

CREATE INDEX i_fk_invoice_status
    ON invoice (status_id ASC);

CREATE INDEX i_fk_article_categorie
    ON article (category_id ASC);

CREATE INDEX i_fk_article_brand
    ON article (brand_id ASC);

CREATE INDEX i_fk_order_invoice
    ON `order` (invoice_id ASC);

CREATE INDEX i_fk_order_user
    ON `order` (user_id ASC);

CREATE INDEX i_fk_review_user
    ON review (user_id ASC);

CREATE INDEX i_fk_review_article
    ON review (article_id ASC);

CREATE INDEX i_fk_order_article
    ON `order` (article_id ASC);

CREATE INDEX i_fk_ordre_status
    ON `order` (status_id ASC);

