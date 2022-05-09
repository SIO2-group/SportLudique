DROP DATABASE IF EXISTS sport_ludique;

CREATE DATABASE IF NOT EXISTS sport_ludique;
USE sport_ludique;

CREATE TABLE IF NOT EXISTS status
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS role
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS user
(
    id            INT AUTO_INCREMENT
        PRIMARY KEY,
    role_id       INT          NULL
        REFERENCES role (id),
    name          VARCHAR(64)  NOT NULL,
    email         VARCHAR(128) NULL,
    password      VARCHAR(128) NOT NULL,
    creation_date DATETIME     NOT NULL
);

CREATE TABLE IF NOT EXISTS category
(
    id   INT AUTO_INCREMENT
        PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS brand
(
    id     INT AUTO_INCREMENT
        PRIMARY KEY,
    `name` VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS article
(
    id            INT AUTO_INCREMENT
        PRIMARY KEY,
    brand_id      INT          NOT NULL
        REFERENCES brand (id),
    `name`        VARCHAR(64)  NOT NULL,
    `description` VARCHAR(256) NULL,
    price         FLOAT        NULL,
    stock         INT          NULL,
    is_active     BOOL         NULL
);

CREATE TABLE IF NOT EXISTS type
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS file
(
    id         INT AUTO_INCREMENT
        PRIMARY KEY,
    `path`     VARCHAR(32) NOT NULL,
    type_id    INT         NOT NULL
        REFERENCES type (id),
    brand_id   INT         NULL
        REFERENCES brand (id),
    article_id INT         NULL
        REFERENCES article (id)
);

CREATE TABLE IF NOT EXISTS color
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS size
(
    id    INT AUTO_INCREMENT
        PRIMARY KEY,
    label VARCHAR(8) NOT NULL
);

CREATE TABLE IF NOT EXISTS `order`
(
    id        INT AUTO_INCREMENT
        PRIMARY KEY,
    user_id   INT      NOT NULL
        REFERENCES user (id),
    status_id INT      NOT NULL
        REFERENCES status (id),
    pay_date  DATETIME NULL
);

CREATE TABLE IF NOT EXISTS review
(
    article_id INT           NOT NULL
        REFERENCES article (id),
    user_id    INT           NOT NULL
        REFERENCES user (id),
    note       INT(3)        NULL,
    comment    VARCHAR(1024) NULL,
    post_date  DATETIME      NULL,
    PRIMARY KEY (article_id, user_id)
);

CREATE TABLE IF NOT EXISTS category_article
(
    article_id  INT NOT NULL
        REFERENCES article (id),
    category_id INT NOT NULL
        REFERENCES category (id),
    PRIMARY KEY (article_id, category_id)
);

CREATE TABLE IF NOT EXISTS report
(
    id         INT AUTO_INCREMENT
        PRIMARY KEY,
    article_id INT           NOT NULL
        REFERENCES article (id),
    user_id    INT           NOT NULL
        REFERENCES user (id),
    content    VARCHAR(2048) NOT NULL
);

CREATE TABLE IF NOT EXISTS order_article
(
    order_id   INT NOT NULL
        REFERENCES `order` (id),
    article_id INT NOT NULL
        REFERENCES article (id),
    quantity   INT NOT NULL,
    PRIMARY KEY (order_id, article_id)
);

CREATE TABLE IF NOT EXISTS size_article
(
    article_id INT NOT NULL
        REFERENCES article (id),
    size_id    INT NOT NULL
        REFERENCES size (id),
    PRIMARY KEY (article_id, size_id)
);

CREATE TABLE IF NOT EXISTS color_article
(
    article_id INT NOT NULL
        REFERENCES article (id),
    color_id   INT NOT NULL
        REFERENCES color (id),
    PRIMARY KEY (article_id, color_id)
);

CREATE TABLE IF NOT EXISTS `group`
(
    id   INT AUTO_INCREMENT
        PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS notification
(
    id       INT AUTO_INCREMENT
        PRIMARY KEY,
    group_id INT           NOT NULL
        REFERENCES `group` (id),
    object   VARCHAR(128)  NOT NULL,
    content  VARCHAR(2048) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_article
(
    article_id INT NOT NULL
        REFERENCES article (id),
    user_id    INT NOT NULL
        REFERENCES user (id),
    PRIMARY KEY (article_id, user_id)
);

CREATE TABLE IF NOT EXISTS group_user
(
    user_id  INTEGER NOT NULL
        REFERENCES user (id),
    group_id INTEGER NOT NULL
        REFERENCES `group` (id),
    PRIMARY KEY (group_id, user_id)
);

CREATE INDEX i_fk_file_brand
    ON `file` (brand_id ASC);

CREATE INDEX i_fk_file_type
    ON `file` (type_id ASC);

CREATE INDEX i_fk_file_article
    ON `file` (article_id ASC);

CREATE INDEX i_fk_article_brand
    ON article (brand_id ASC);

CREATE INDEX i_fk_order_user
    ON `order` (user_id ASC);

CREATE INDEX i_fk_order_status
    ON `order` (status_id ASC);

CREATE INDEX i_fk_review_user
    ON review (user_id ASC);

CREATE INDEX i_fk_review_article
    ON review (article_id ASC);

CREATE INDEX i_fk_category_article_article
    ON category_article (article_id ASC);

CREATE INDEX i_fk_category_article_category
    ON category_article (category_id ASC);

CREATE INDEX i_fk_report_article
    ON report (article_id ASC);

CREATE INDEX i_fk_report_user
    ON report (user_id ASC);

CREATE INDEX i_fk_order_article_article
    ON order_article (article_id ASC);

CREATE INDEX i_fk_order_article_order
    ON order_article (order_id ASC);

CREATE INDEX i_fk_size_article_article
    ON size_article (article_id ASC);

CREATE INDEX i_fk_size_article_size
    ON size_article (size_id ASC);

CREATE INDEX i_fk_color_article_color
    ON color_article (color_id ASC);

CREATE INDEX i_fk_color_article_article
    ON color_article (article_id ASC);

CREATE INDEX i_fk_user_article_article
    ON user_article (article_id ASC);

CREATE INDEX i_fk_user_article_user
    ON user_article (user_id ASC);

CREATE INDEX i_fk_user_role
    ON user (role_id ASC);

CREATE INDEX i_fk_notification_group
    ON notification (group_id ASC);

CREATE INDEX i_fk_group_user_user
    ON group_user (user_id ASC);

CREATE INDEX i_fk_group_user_group
    ON group_user (group_id ASC);