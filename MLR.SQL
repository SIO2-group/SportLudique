DROP DATABASE IF EXISTS MLR;

CREATE DATABASE IF NOT EXISTS MLR;
USE MLR;
# -----------------------------------------------------------------------------
#       TABLE : USER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS USER
 (
   ID_USER INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  ,
   EMAIL VARCHAR(128) NULL  ,
   ROLES json NULL  ,
   PASSWORD VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FILE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FILE
 (
   ID_FILE INTEGER NOT NULL  
   , PRIMARY KEY (ID_FILE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ORDER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ORDER
 (
   ID_ORDER INTEGER NOT NULL  ,
   ID_STATUS INTEGER NOT NULL  ,
   ID_USER INTEGER NOT NULL  ,
   PAY_DATE DATETIME NULL  
   , PRIMARY KEY (ID_ORDER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ORDER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ORDER_STATUS
     ON ORDER (ID_STATUS ASC);

CREATE  INDEX I_FK_ORDER_USER
     ON ORDER (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : REPORT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REPORT
 (
   ID_REPORT INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_USER INTEGER NOT NULL  ,
   CONTENT VARCHAR(255) NOT NULL  
   , PRIMARY KEY (ID_REPORT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REPORT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REPORT_ARTICLE
     ON REPORT (ID_ARTICLE ASC);

CREATE  INDEX I_FK_REPORT_USER
     ON REPORT (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : COLOR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COLOR
 (
   ID_COLOR INTEGER NOT NULL  ,
   LABEL CHAR(32) NOT NULL  
   , PRIMARY KEY (ID_COLOR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SIZE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SIZE
 (
   ID_SIZE INTEGER NOT NULL  ,
   LABEL CHAR(32) NOT NULL  
   , PRIMARY KEY (ID_SIZE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CATEGORY
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORY
 (
   ID_CATEGORY INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_CATEGORY) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PATH
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PATH
 (
   ID_PATH INTEGER NOT NULL  ,
   LINK CHAR(32) NULL  
   , PRIMARY KEY (ID_PATH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ARTICLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ARTICLE
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_BRAND INTEGER NOT NULL  ,
   ID_FILE INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  ,
   DESCRIPTION VARCHAR(255) NULL  ,
   PRICE INTEGER NULL  ,
   QUANTITY INTEGER NULL  ,
   IS_ACTIVE BOOL NULL  
   , PRIMARY KEY (ID_ARTICLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ARTICLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ARTICLE_BRAND
     ON ARTICLE (ID_BRAND ASC);

CREATE  INDEX I_FK_ARTICLE_FILE
     ON ARTICLE (ID_FILE ASC);

# -----------------------------------------------------------------------------
#       TABLE : NOTIFICATIONS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NOTIFICATIONS
 (
   ID_NOTIF INTEGER NOT NULL  ,
   CONTENT VARCHAR(255) NOT NULL  
   , PRIMARY KEY (ID_NOTIF) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : BRAND
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS BRAND
 (
   ID_BRAND INTEGER NOT NULL  ,
   ID_FILE INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_BRAND) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE BRAND
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_BRAND_FILE
     ON BRAND (ID_FILE ASC);

# -----------------------------------------------------------------------------
#       TABLE : STATUS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STATUS
 (
   ID_STATUS INTEGER NOT NULL  ,
   LABEL VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_STATUS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FAVORITES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FAVORITES
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_USER INTEGER NOT NULL  
   , PRIMARY KEY (ID_ARTICLE,ID_USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FAVORITES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FAVORITES_ARTICLE
     ON FAVORITES (ID_ARTICLE ASC);

CREATE  INDEX I_FK_FAVORITES_USER
     ON FAVORITES (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : CONTAIN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTAIN
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_ORDER INTEGER NOT NULL  
   , PRIMARY KEY (ID_ARTICLE,ID_ORDER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONTAIN
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONTAIN_ARTICLE
     ON CONTAIN (ID_ARTICLE ASC);

CREATE  INDEX I_FK_CONTAIN_ORDER
     ON CONTAIN (ID_ORDER ASC);

# -----------------------------------------------------------------------------
#       TABLE : INCLUDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INCLUDE
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_CATEGORY INTEGER NOT NULL  
   , PRIMARY KEY (ID_ARTICLE,ID_CATEGORY) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INCLUDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INCLUDE_ARTICLE
     ON INCLUDE (ID_ARTICLE ASC);

CREATE  INDEX I_FK_INCLUDE_CATEGORY
     ON INCLUDE (ID_CATEGORY ASC);

# -----------------------------------------------------------------------------
#       TABLE : NOTIFY
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NOTIFY
 (
   ID_USER INTEGER NOT NULL  ,
   ID_NOTIF INTEGER NOT NULL  
   , PRIMARY KEY (ID_USER,ID_NOTIF) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE NOTIFY
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_NOTIFY_USER
     ON NOTIFY (ID_USER ASC);

CREATE  INDEX I_FK_NOTIFY_NOTIFICATIONS
     ON NOTIFY (ID_NOTIF ASC);

# -----------------------------------------------------------------------------
#       TABLE : MEASURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEASURE
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_SIZE INTEGER NOT NULL  
   , PRIMARY KEY (ID_ARTICLE,ID_SIZE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEASURE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEASURE_ARTICLE
     ON MEASURE (ID_ARTICLE ASC);

CREATE  INDEX I_FK_MEASURE_SIZE
     ON MEASURE (ID_SIZE ASC);

# -----------------------------------------------------------------------------
#       TABLE : REVIEW
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REVIEW
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_USER INTEGER NOT NULL  ,
   NOTE SMALLINT NOT NULL  ,
   COMMENT VARCHAR(128) NULL  ,
   POST_DATE DATETIME NOT NULL  
   , PRIMARY KEY (ID_ARTICLE,ID_USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REVIEW
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REVIEW_ARTICLE
     ON REVIEW (ID_ARTICLE ASC);

CREATE  INDEX I_FK_REVIEW_USER
     ON REVIEW (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : COLORIZE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COLORIZE
 (
   ID_COLOR INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER NOT NULL  
   , PRIMARY KEY (ID_COLOR,ID_ARTICLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COLORIZE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COLORIZE_COLOR
     ON COLORIZE (ID_COLOR ASC);

CREATE  INDEX I_FK_COLORIZE_ARTICLE
     ON COLORIZE (ID_ARTICLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : LOCALIZE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LOCALIZE
 (
   ID_FILE INTEGER NOT NULL  ,
   ID_PATH INTEGER NOT NULL  
   , PRIMARY KEY (ID_FILE,ID_PATH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE LOCALIZE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_LOCALIZE_FILE
     ON LOCALIZE (ID_FILE ASC);

CREATE  INDEX I_FK_LOCALIZE_PATH
     ON LOCALIZE (ID_PATH ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE ORDER 
  ADD FOREIGN KEY FK_ORDER_STATUS (ID_STATUS)
      REFERENCES STATUS (ID_STATUS) ;


ALTER TABLE ORDER 
  ADD FOREIGN KEY FK_ORDER_USER (ID_USER)
      REFERENCES USER (ID_USER) ;


ALTER TABLE REPORT 
  ADD FOREIGN KEY FK_REPORT_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE REPORT 
  ADD FOREIGN KEY FK_REPORT_USER (ID_USER)
      REFERENCES USER (ID_USER) ;


ALTER TABLE ARTICLE 
  ADD FOREIGN KEY FK_ARTICLE_BRAND (ID_BRAND)
      REFERENCES BRAND (ID_BRAND) ;


ALTER TABLE ARTICLE 
  ADD FOREIGN KEY FK_ARTICLE_FILE (ID_FILE)
      REFERENCES FILE (ID_FILE) ;


ALTER TABLE BRAND 
  ADD FOREIGN KEY FK_BRAND_FILE (ID_FILE)
      REFERENCES FILE (ID_FILE) ;


ALTER TABLE FAVORITES 
  ADD FOREIGN KEY FK_FAVORITES_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE FAVORITES 
  ADD FOREIGN KEY FK_FAVORITES_USER (ID_USER)
      REFERENCES USER (ID_USER) ;


ALTER TABLE CONTAIN 
  ADD FOREIGN KEY FK_CONTAIN_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE CONTAIN 
  ADD FOREIGN KEY FK_CONTAIN_ORDER (ID_ORDER)
      REFERENCES ORDER (ID_ORDER) ;


ALTER TABLE INCLUDE 
  ADD FOREIGN KEY FK_INCLUDE_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE INCLUDE 
  ADD FOREIGN KEY FK_INCLUDE_CATEGORY (ID_CATEGORY)
      REFERENCES CATEGORY (ID_CATEGORY) ;


ALTER TABLE NOTIFY 
  ADD FOREIGN KEY FK_NOTIFY_USER (ID_USER)
      REFERENCES USER (ID_USER) ;


ALTER TABLE NOTIFY 
  ADD FOREIGN KEY FK_NOTIFY_NOTIFICATIONS (ID_NOTIF)
      REFERENCES NOTIFICATIONS (ID_NOTIF) ;


ALTER TABLE MEASURE 
  ADD FOREIGN KEY FK_MEASURE_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE MEASURE 
  ADD FOREIGN KEY FK_MEASURE_SIZE (ID_SIZE)
      REFERENCES SIZE (ID_SIZE) ;


ALTER TABLE REVIEW 
  ADD FOREIGN KEY FK_REVIEW_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE REVIEW 
  ADD FOREIGN KEY FK_REVIEW_USER (ID_USER)
      REFERENCES USER (ID_USER) ;


ALTER TABLE COLORIZE 
  ADD FOREIGN KEY FK_COLORIZE_COLOR (ID_COLOR)
      REFERENCES COLOR (ID_COLOR) ;


ALTER TABLE COLORIZE 
  ADD FOREIGN KEY FK_COLORIZE_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE LOCALIZE 
  ADD FOREIGN KEY FK_LOCALIZE_FILE (ID_FILE)
      REFERENCES FILE (ID_FILE) ;


ALTER TABLE LOCALIZE 
  ADD FOREIGN KEY FK_LOCALIZE_PATH (ID_PATH)
      REFERENCES PATH (ID_PATH) ;

