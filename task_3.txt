CREATE TABLE PRODUCT (
  product_id  SERIAL       NOT NULL PRIMARY KEY,
  name_nm     VARCHAR(100) NOT NULL,
  price_amt   REAL         NOT NULL CHECK (price_amt > 0),
  quality_txt VARCHAR(100),
  weight_amt  REAL         NOT NULL CHECK (weight_amt > 0)
);

CREATE TABLE SUPPLIER (
  supplier_id SERIAL       NOT NULL PRIMARY KEY,
  caption_nm  VARCHAR(100) NOT NULL,
  address_txt VARCHAR(100) NOT NULL,
  phone_no    INTEGER      NOT NULL,
  email_txt   VARCHAR(100) DEFAULT '---'
);

CREATE TABLE CONSUMER (
  consumer_id SERIAL       NOT NULL PRIMARY KEY,
  last_nm     VARCHAR(100) NOT NULL,
  first_nm    VARCHAR(100) NOT NULL,
  middle_nm   VARCHAR(100) DEFAULT '---',
  phone_no    INTEGER      NOT NULL
);

CREATE TABLE PAYMENT (
  payment_id           SERIAL       NOT NULL PRIMARY KEY,
  date_of_payment_dttm DATE         NOT NULL,
  payment_type_txt     VARCHAR(100) NOT NULL,
  price_amt            REAL         NOT NULL CHECK (price_amt > 0)
);

CREATE TABLE BUYING (
  buying_id   SERIAL  NOT NULL PRIMARY KEY,
  consumer_id INTEGER NOT NULL,
  payment_id  INTEGER NOT NULL,
  FOREIGN KEY (consumer_id) REFERENCES CONSUMER (consumer_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY (payment_id) REFERENCES PAYMENT (payment_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE DELIVERY (
  delivery_id SERIAL  NOT NULL PRIMARY KEY,
  supplier_id INTEGER NOT NULL,
  payment_id  INTEGER NOT NULL,
  FOREIGN KEY (supplier_id) REFERENCES SUPPLIER (supplier_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY (payment_id) REFERENCES PAYMENT (payment_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE SHOP (
  shop_id     SERIAL UNIQUE      NOT NULL PRIMARY KEY,
  address_txt VARCHAR(100)       NOT NULL,
  phone_no    INTEGER,
  size_txt    VARCHAR(100) DEFAULT '---'
);

CREATE TABLE PURCHASES_JOURNAL (
  record_id          SERIAL UNIQUE NOT NULL,
  buying_id          INTEGER       NOT NULL,
  shop_id            INTEGER       NOT NULL,
  product_id         INTEGER       NOT NULL,
  number_product_cnt INTEGER CHECK (number_product_cnt > 0),
  responsible_nm     VARCHAR(100)  NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (shop_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY (buying_id) REFERENCES BUYING (buying_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE ACCOUNT_JOURNAL (
  record_id          SERIAL UNIQUE NOT NULL,
  delivery_id        INTEGER       NOT NULL,
  shop_id            INTEGER       NOT NULL,
  product_id         INTEGER       NOT NULL,
  number_product_cnt INTEGER       NOT NULL CHECK (number_product_cnt > 0),
  responsible_nm     VARCHAR(100)  NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (shop_id) REFERENCES SHOP (shop_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE,
  FOREIGN KEY (delivery_id) REFERENCES DELIVERY (delivery_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE
);
