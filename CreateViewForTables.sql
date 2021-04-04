CREATE VIEW V_PRODUCT AS
  (
    SELECT
      name_nm         AS Название_продукта
      , price_amt     AS Цена
      , weight_amt    AS Вес
        FROM PRODUCT
  );

CREATE VIEW V_PAYMENT AS
  (
    SELECT
      payment_id                                   AS Номер_платежа
      , date_of_payment_dttm                       AS Дата_платежа
      , payment_type_txt                           AS Способ_оплаты
      , (CASE WHEN price_amt != 0 THEN '***' END ) AS Цена
        FROM PAYMENT
  );

CREATE VIEW V_BUYING AS
  (
    SELECT
      buying_id       AS Номер_покупки
      , consumer_id   AS Номер_покупателя
      , payment_id    AS Номер_платежа
        FROM BUYING
  );

CREATE VIEW V_PURCHASES_JOURNAL AS
  (
    SELECT
      record_id                 AS №
      , shop_id                 AS Номер_магазина
      , product_id              AS Номер_продукта
      , number_product_cnt      AS Количество
        FROM PURCHASES_JOURNAL
  );

CREATE VIEW V_CONSUMER AS
  (
    SELECT
    last_nm                                            AS Фамилия
    , first_nm                                         AS Имя
    , middle_nm                                        AS Отчество
    , (CASE WHEN phone_no != 0 THEN '***********' END) AS Телефон
      FROM CONSUMER
  );

CREATE VIEW V_SHOP AS
  (
    SELECT
      shop_id         AS Номер_магазина
      , address_txt   AS Адрес
      , phone_no      AS Номер
      , size_txt      AS Размер
        FROM SHOP
  );

CREATE VIEW V_ACCOUNT_JOURNAL AS
  (
    SELECT
      record_id                 AS №
      , shop_id                 AS Номер_магазина
      , product_id              AS Номер_продукта
      , number_product_cnt      AS Количество
        FROM ACCOUNT_JOURNAL
  );

CREATE VIEW V_DELIVERY AS
  (
    SELECT
    delivery_id         AS Номер_поставки
    , supplier_id       AS Номер_поставщика
    , payment_id        AS Номер_платежа
      FROM DELIVERY
  );

CREATE VIEW V_SUPPLIER AS
  (
    SELECT
      caption_nm                                              AS Название
      , address_txt                                           AS Адрес
      , (CASE WHEN phone_no != 0 THEN '***************' END ) AS Телефон
      , email_txt                                             AS email
      FROM SUPPLIER
  );
