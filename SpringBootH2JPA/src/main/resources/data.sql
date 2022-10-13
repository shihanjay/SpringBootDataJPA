DROP TABLE IF EXISTS USD;



CREATE TABLE USD (
  id     bigint auto_increment primary key,
 /* id      VARCHAR(15) auto_increment primary key,*/
  code    VARCHAR(15) NOT NULL,
  symbol  VARCHAR(128) NOT NULL,
  rate    VARCHAR(32) NOT NULL,
  description   VARCHAR(256) NOT NULL,
   rate_float    VARCHAR(32) NOT NULL,
  /*PRIMARY KEY (code)*/
);

DROP TABLE IF EXISTS GBP;

CREATE TABLE GBP (
   id     bigint auto_increment primary key,
 /* id      VARCHAR(15) auto_increment primary key,*/
  code    VARCHAR(15) NOT NULL,
  symbol  VARCHAR(128) NOT NULL,
  rate    VARCHAR(32) NOT NULL,
  description   VARCHAR(256) NOT NULL,
   rate_float    VARCHAR(32) NOT NULL,
  /*PRIMARY KEY (code)*/
);

DROP TABLE IF EXISTS EUR;

CREATE TABLE EUR (
   id     bigint auto_increment primary key,
 /* id      VARCHAR(15) auto_increment primary key,*/
  code    VARCHAR(15) NOT NULL,
  symbol  VARCHAR(128) NOT NULL,
  rate    VARCHAR(32) NOT NULL,
  description   VARCHAR(256) NOT NULL,
   rate_float    VARCHAR(32) NOT NULL,
  /*PRIMARY KEY (code)*/
);

DROP TABLE IF EXISTS TIME;

CREATE TABLE TIME (
  id     bigint auto_increment primary key,
  updated    VARCHAR(50) NOT NULL,
  updatedISO VARCHAR(128) NOT NULL,
  updateduk    VARCHAR(50) NOT NULL,
  /*PRIMARY KEY (updated)*/
);



INSERT INTO USD (code, symbol,rate,description,rate_float) VALUES ('USD', '&#36;','20,320.0591','United States Dollar','20320.0591');

INSERT INTO GBP (code, symbol,rate,description,rate_float) VALUES ('GBP', '&pound;','16,979.2788','British Pound Sterling','16979.2788');

INSERT INTO EUR (code, symbol,rate,description,rate_float) VALUES ('EUR', '&euro;','19,794.7042','Euro','19794.7042');

INSERT INTO TIME (updated,updatedISO ,updateduk) VALUES ('Sep 14, 2022 09:52:00 UTC', '2022-09-14T09:52:00+00:00;','Sep 14, 2022 at 10:52 BST');
