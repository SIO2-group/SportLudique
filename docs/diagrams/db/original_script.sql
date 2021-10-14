DROP DATABASE IF EXISTS sport_ludique;

CREATE DATABASE IF NOT EXISTS sport_ludique;
USE sport_ludique;
# -----------------------------------------------------------------------------
#       TABLE : INVOICE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INVOICE
 (
   ID_INVOICE INTEGER NOT NULL  ,
   ID_STATUS INTEGER NOT NULL  ,
   PAY_DATE DATE NULL  
   , PRIMARY KEY (ID_INVOICE) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INVOICE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INVOICE_STATUS
     ON INVOICE (ID_STATUS ASC);

# -----------------------------------------------------------------------------
#       TABLE : USER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS USER
 (
   ID_USER INTEGER NOT NULL  ,
   LAST_NAME VARCHAR(128) NULL  ,
   FIRST_NAME VARCHAR(128) NULL  ,
   EMAIL VARCHAR(128) NULL  ,
   ROLES json NULL  ,
   PASSWORD VARCHAR(128) NULL  
   , PRIMARY KEY (ID_USER) 
 );

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIE
 (
   ID_CATEGORIE INTEGER NOT NULL  ,
   NAME VARCHAR(128) NULL  
   , PRIMARY KEY (ID_CATEGORIE) 
 );

# -----------------------------------------------------------------------------
#       TABLE : ARTICLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ARTICLE
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_CATEGORIE INTEGER NOT NULL  ,
   ID_BRAND INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  ,
   PRICE INTEGER NULL  ,
   QUANTITY INTEGER NULL  ,
   IS_ACTIVE BOOL NULL  
   , PRIMARY KEY (ID_ARTICLE) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ARTICLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ARTICLE_CATEGORIE
     ON ARTICLE (ID_CATEGORIE ASC);

CREATE  INDEX I_FK_ARTICLE_BRAND
     ON ARTICLE (ID_BRAND ASC);

# -----------------------------------------------------------------------------
#       TABLE : BRAND
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS BRAND
 (
   ID_BRAND INTEGER NOT NULL  ,
   NAME VARCHAR(128) NULL  
   , PRIMARY KEY (ID_BRAND) 
 );

# -----------------------------------------------------------------------------
#       TABLE : STATUS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STATUS
 (
   ID_STATUS INTEGER NOT NULL  ,
   LABEL VARCHAR(128) NULL  
   , PRIMARY KEY (ID_STATUS) 
 );

# -----------------------------------------------------------------------------
#       TABLE : ORDER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ORDER`
 (
   ID_INVOICE INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_USER INTEGER NOT NULL  ,
   STATUS VARCHAR(128) NULL  
   , PRIMARY KEY (ID_INVOICE,ID_ARTICLE,ID_USER) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ORDER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ORDER_INVOICE
     ON `ORDER` (ID_INVOICE ASC);

CREATE  INDEX I_FK_ORDER_ARTICLE
     ON `ORDER` (ID_ARTICLE ASC);

CREATE  INDEX I_FK_ORDER_USER
     ON `ORDER` (ID_USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : REVIEW
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REVIEW
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_USER INTEGER NOT NULL  ,
   NOTE SMALLINT NULL  ,
   COMMENT VARCHAR(128) NULL  ,
   POST_DATE DATETIME NULL  
   , PRIMARY KEY (ID_ARTICLE,ID_USER) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REVIEW
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REVIEW_ARTICLE
     ON REVIEW (ID_ARTICLE ASC);

CREATE  INDEX I_FK_REVIEW_USER
     ON REVIEW (ID_USER ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE INVOICE 
  ADD FOREIGN KEY FK_INVOICE_STATUS (ID_STATUS)
      REFERENCES STATUS (ID_STATUS) ;


ALTER TABLE ARTICLE 
  ADD FOREIGN KEY FK_ARTICLE_CATEGORIE (ID_CATEGORIE)
      REFERENCES CATEGORIE (ID_CATEGORIE) ;


ALTER TABLE ARTICLE 
  ADD FOREIGN KEY FK_ARTICLE_BRAND (ID_BRAND)
      REFERENCES BRAND (ID_BRAND) ;


ALTER TABLE `ORDER`
  ADD FOREIGN KEY FK_ORDER_INVOICE (ID_INVOICE)
      REFERENCES INVOICE (ID_INVOICE) ;


ALTER TABLE `ORDER`
  ADD FOREIGN KEY FK_ORDER_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE `ORDER`
  ADD FOREIGN KEY FK_ORDER_USER (ID_USER)
      REFERENCES USER (ID_USER) ;


ALTER TABLE REVIEW 
  ADD FOREIGN KEY FK_REVIEW_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;


ALTER TABLE REVIEW 
  ADD FOREIGN KEY FK_REVIEW_USER (ID_USER)
      REFERENCES USER (ID_USER) ;

