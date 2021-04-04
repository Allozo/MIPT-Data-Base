CREATE TABLE CONSUMER (
  consumer_id SERIAL       NOT NULL PRIMARY KEY,
  last_nm     VARCHAR(100) NOT NULL,
  first_nm    VARCHAR(100) NOT NULL,
  middle_nm   VARCHAR(100) DEFAULT '---',
  phone_no    INTEGER      NOT NULL
);

INSERT INTO CONSUMER (consumer_id, last_nm, first_nm, middle_nm, phone_no)
  VALUES
    (1, 'Строганов', 'Илья', 'Владимирович',   965136806),
    (2, 'Павлович', 'Михаил', 'Дмитриевич',    349454624),
    (3, 'Краснова', 'Ольга', 'Сергеевна',      344826510);

DELETE FROM CONSUMER WHERE first_nm = 'Илья';

UPDATE CONSUMER
    SET phone_no = 0
    WHERE first_nm = 'Ольга';

/*------------------------------------------------*/

CREATE TABLE SUPPLIER (
  supplier_id SERIAL       NOT NULL PRIMARY KEY,
  caption_nm  VARCHAR(100) NOT NULL,
  address_txt VARCHAR(100) NOT NULL,
  phone_no    INTEGER      NOT NULL,
  email_txt   VARCHAR(100) DEFAULT '---'
);

INSERT INTO SUPPLIER (supplier_id, caption_nm, address_txt, phone_no, email_txt)
VALUES
  (1, 'Oreo', 'Россия, Москва, улица Арбат, 51, стр. 1', 495120212, 'oreo2014@mail.ru'),
  (268, 'Puma', 'Коровинское шоссе, 9, корп. 1', 800200198, 'shop.ru@puma.com'),
  (5648, 'APPLE', 'Россия, Москва, улица Петровка, 2, ТД ЦУМ, эт. 1, эт. 1', 495933700, 'info@apple.com');

DELETE FROM SUPPLIER
WHERE supplier_id = 1;

UPDATE SUPPLIER
SET supplier_id = 267
WHERE caption_nm = 'Puma';
