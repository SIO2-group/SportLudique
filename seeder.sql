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
    role_id       INT          NULL,
    name          VARCHAR(64)  NOT NULL,
    email         VARCHAR(128) NULL,
    password      VARCHAR(128) NOT NULL,
    creation_date DATETIME     NOT NULL,
    FOREIGN KEY fk_user_role (role_id)
        REFERENCES role (id)
);

CREATE TABLE IF NOT EXISTS category
(
    id   INT AUTO_INCREMENT
        PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS file
(
    id INT AUTO_INCREMENT
        PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS brand
(
    id      INT AUTO_INCREMENT
        PRIMARY KEY,
    file_id INT         NOT NULL,
    name    VARCHAR(32) NOT NULL,
    FOREIGN KEY fk_brand_file (file_id)
        REFERENCES file (id)
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

CREATE TABLE IF NOT EXISTS article
(
    id          INT AUTO_INCREMENT
        PRIMARY KEY,
    brand_id    INT          NOT NULL,
    file_id     INT          NOT NULL,
    name        VARCHAR(64)  NOT NULL,
    description VARCHAR(256) NULL,
    price       FLOAT        NULL,
    quantity    INT          NULL,
    is_active   BOOL         NULL,
    FOREIGN KEY fk_article_brand (brand_id)
        REFERENCES brand (id),
    FOREIGN KEY fk_article_file (file_id)
        REFERENCES file (id)
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
        REFERENCES category (id)
);

CREATE TABLE IF NOT EXISTS report
(
    id         INT AUTO_INCREMENT
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
    order_id   INT NOT NULL,
    article_id INT NOT NULL,
    PRIMARY KEY (order_id, article_id),
    FOREIGN KEY fk_contain_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_contain_order (order_id)
        REFERENCES `order` (id)
);

CREATE TABLE IF NOT EXISTS path
(
    id      INT AUTO_INCREMENT
        PRIMARY KEY,
    file_id INT          NULL,
    link    VARCHAR(256) NOT NULL,
    FOREIGN KEY fk_path_file (file_id)
        REFERENCES file (id)
);

CREATE TABLE IF NOT EXISTS measure
(
    article_id INT NOT NULL,
    size_id    INT NOT NULL,
    PRIMARY KEY (article_id, size_id),
    FOREIGN KEY fk_measure_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_measure_size (size_id)
        REFERENCES size (id)
);

CREATE TABLE IF NOT EXISTS colorize
(
    article_id INT NOT NULL,
    color_id   INT NOT NULL,
    PRIMARY KEY (article_id, color_id),
    FOREIGN KEY fk_colorize_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_colorize_color (color_id)
        REFERENCES color (id)
);

CREATE TABLE IF NOT EXISTS `group`
(
    id   INT AUTO_INCREMENT
        PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS notifications
(
    id        INT AUTO_INCREMENT
        PRIMARY KEY,
    group_id  INT          NOT NULL,
    content   VARCHAR(256) NOT NULL,
    FOREIGN KEY fk_notifications_group (group_id)
        REFERENCES `group` (id)
);

CREATE TABLE IF NOT EXISTS favorite
(
    article_id INT NOT NULL,
    user_id    INT NOT NULL,
    PRIMARY KEY (article_id, user_id),
    FOREIGN KEY fk_favorite_article (article_id)
        REFERENCES article (id),
    FOREIGN KEY fk_favorite_user (user_id)
        REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS path
(
    id      INT AUTO_INCREMENT
        PRIMARY KEY,
    file_id INT      NULL,
    link    CHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS belong
(
    group_id INTEGER NOT NULL,
    user_id  INTEGER NOT NULL,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY fk_belong_user (user_id)
        REFERENCES user (id),
    FOREIGN KEY fk_belong_group (group_id)
        REFERENCES `group` (id)
);

CREATE INDEX i_fk_article_brand
    ON article (brand_id ASC);

CREATE INDEX i_fk_article_file
    ON ARTICLE (file_id ASC);

CREATE INDEX i_fk_order_user
    ON `order` (user_id ASC);

CREATE INDEX i_fk_order_status
    ON `order` (status_id ASC);

CREATE INDEX i_fk_review_user
    ON review (user_id ASC);

CREATE INDEX i_fk_review_article
    ON review (article_id ASC);

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

CREATE INDEX i_fk_measure_article
    ON measure (article_id ASC);

CREATE INDEX i_fk_measure_size
    ON measure (size_id ASC);

CREATE INDEX i_fk_colorize_color
    ON colorize (color_id ASC);

CREATE INDEX i_fk_colorize_article
    ON colorize (article_id ASC);

CREATE INDEX i_fk_brand_file
    ON brand (file_id ASC);

CREATE INDEX i_fk_favorite_article
    ON favorite (article_id ASC);

CREATE INDEX i_fk_favorite_user
    ON favorite (user_id ASC);

CREATE INDEX i_fk_user_role
    ON user (role_id ASC);

CREATE INDEX i_fk_path_file
    ON path (file_id ASC);

CREATE INDEX i_fk_notifications_group
    ON notifications (group_id ASC);

CREATE INDEX i_fk_belong_user
    ON belong (user_id ASC);

CREATE INDEX i_fk_belong_group
    ON belong (group_id ASC);