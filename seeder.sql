DROP DATABASE IF EXISTS sport_ludique;

CREATE DATABASE IF NOT EXISTS sport_ludique;
USE sport_ludique;

CREATE TABLE IF NOT EXISTS status
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(64) NULL
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
    name VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS brand
(
    id        INT AUTO_INCREMENT
        PRIMARY KEY,
    name      VARCHAR(64)  NOT NULL,
    icon_path VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS article
(
    id         INT AUTO_INCREMENT
        PRIMARY KEY,
    brand_id   INT          NULL,
    name       VARCHAR(64)  NOT NULL,
    price      FLOAT        NOT NULL,
    quantity   INT          NULL,
    image_path VARCHAR(255) NULL,
    is_active  BOOL         NULL,
    FOREIGN KEY fk_article_brand (brand_id)
        REFERENCES brand (id)
);

CREATE TABLE IF NOT EXISTS `order`
(
    id        INT AUTO_INCREMENT
        PRIMARY KEY,
    user_id   INT      NOT NULL,
    status_id INT      NOT NULL,
    pay_date  DATETIME NULL,
    FOREIGN KEY fk_order_user (user_id)
        REFERENCES user (id),
    FOREIGN KEY fk_order_status (status_id)
        REFERENCES status (id)
);

CREATE TABLE IF NOT EXISTS review
(
    article_id INT           NOT NULL,
    user_id    INT           NOT NULL,
    note       INT(3)        NULL,
    comment    VARCHAR(1024) NULL,
    post_date  DATETIME      NULL,
    PRIMARY KEY (article_id, user_id),
    FOREIGN KEY fk_review_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_review_user (user_id)
        REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS include
(
    article_id  INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (article_id, category_id),
    FOREIGN KEY fk_include_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_include_category (category_id)
        REFERENCES CATEGORY (id)
);

CREATE TABLE IF NOT EXISTS report
(
    id         INT           NOT NULL
        PRIMARY KEY,
    article_id INT           NOT NULL,
    user_id    INT           NOT NULL,
    content    VARCHAR(2048) NOT NULL,
    FOREIGN KEY fk_report_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_report_user (user_id)
        REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS contain
(
    article_id INT NOT NULL,
    order_id   INT NOT NULL,
    PRIMARY KEY (article_id, order_id),
    FOREIGN KEY fk_contain_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_contain_order (order_id)
        REFERENCES `order` (id)
);

CREATE INDEX i_fk_article_brand
    ON article (brand_id ASC);

CREATE INDEX i_fk_order_user
    ON `order` (user_id ASC);

CREATE INDEX i_fk_review_user
    ON review (user_id ASC);

CREATE INDEX i_fk_review_article
    ON review (article_id ASC);

CREATE INDEX i_fk_order_status
    ON `order` (status_id ASC);

CREATE INDEX i_fk_include_article
    ON include (article_id ASC);

CREATE INDEX i_fk_include_category
    ON include (category_id ASC);

CREATE INDEX i_fk_report_article
    ON report (article_id ASC);

CREATE INDEX i_fk_report_user
    ON report (user_id ASC);

CREATE INDEX i_fk_contain_article
    ON contain (article_id ASC);

CREATE INDEX i_fk_contain_order
    ON contain (order_id ASC);
