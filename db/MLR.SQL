DROP DATABASE IF EXISTS MLR;

CREATE DATABASE IF NOT EXISTS MLR;
USE MLR;

# -----------------------------------------------------------------------------
#       TABLE : TYPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE
 (
   ID_TYPE INTEGER NOT NULL  ,
   LABEL VARCHAR(32) NOT NULL  
   , PRIMARY KEY (ID_TYPE) 
 );

# -----------------------------------------------------------------------------
#       TABLE : FILE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FILE
 (
   ID_FILE INTEGER NOT NULL  ,
   ID_BRAND INTEGER NULL  ,
   ID_TYPE INTEGER NOT NULL  ,
   ID_ARTICLE INTEGER NULL  ,
   PATH VARCHAR(32) NOT NULL  
   , PRIMARY KEY (ID_FILE) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FILE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FILE_BRAND
     ON FILE (ID_BRAND ASC);

CREATE  INDEX I_FK_FILE_TYPE
     ON FILE (ID_TYPE ASC);

CREATE  INDEX I_FK_FILE_ARTICLE
     ON FILE (ID_ARTICLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : ARTICLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ARTICLE
 (
   ID_ARTICLE INTEGER NOT NULL  ,
   ID_BRAND INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  ,
   DESCRIPTION VARCHAR(255) NULL  ,
   PRICE INTEGER NULL  ,
   STOCK INTEGER NULL  ,
   IS_ACTIVE BOOL NULL  
   , PRIMARY KEY (ID_ARTICLE) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ARTICLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ARTICLE_BRAND
     ON ARTICLE (ID_BRAND ASC);

# -----------------------------------------------------------------------------
#       TABLE : NOTIFICATIONS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
#       TABLE : BRAND
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS BRAND
 (
   ID_BRAND INTEGER NOT NULL  ,
   NAME VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_BRAND) 
 );

ALTER TABLE FILE 
  ADD FOREIGN KEY FK_FILE_BRAND (ID_BRAND)
      REFERENCES BRAND (ID_BRAND) ;

ALTER TABLE FILE 
  ADD FOREIGN KEY FK_FILE_TYPE (ID_TYPE)
      REFERENCES TYPE (ID_TYPE) ;

ALTER TABLE FILE 
  ADD FOREIGN KEY FK_FILE_ARTICLE (ID_ARTICLE)
      REFERENCES ARTICLE (ID_ARTICLE) ;

ALTER TABLE ARTICLE 
  ADD FOREIGN KEY FK_ARTICLE_BRAND (ID_BRAND)
      REFERENCES BRAND (ID_BRAND) ;