/*Выводит какая фирма на какую сумму продала товары в порядке уменьшения выручки*/
SELECT
  caption_nm
  ,date_of_payment_dttm
  ,price_amt
FROM (
       SELECT
         delivery.supplier_id
         ,caption_nm
         ,payment_id
       FROM SUPPLIER
         LEFT JOIN DELIVERY ON SUPPLIER.supplier_id = DELIVERY.supplier_id
     ) AS t_1 LEFT JOIN PAYMENT ON t_1.payment_id = PAYMENT.payment_id
WHERE PAYMENT.payment_type_txt = 'card'
ORDER BY price_amt DESC;

/*Выводит кто сколько потратил*/
SELECT
  last_nm
  , first_nm
  , middle_nm
  , SUM(price_amt)
  FROM (
    SELECT
      last_nm
      , first_nm
      , middle_nm
      , payment_id
      FROM BUYING LEFT JOIN CONSUMER ON BUYING.consumer_id = CONSUMER.consumer_id
       ) AS t_1 LEFT JOIN PAYMENT ON t_1.payment_id = PAYMENT.payment_id
  GROUP BY
  last_nm
  , first_nm
  , middle_nm;

/*Выводит кто как оплачивал свои покупки*/
SELECT DISTINCT
  last_nm
  , first_nm
  , middle_nm
  , payment_type_txt
  FROM (
    SELECT
      last_nm
      , first_nm
      , middle_nm
      , payment_id
      FROM BUYING LEFT JOIN CONSUMER ON BUYING.consumer_id = CONSUMER.consumer_id
       ) AS t_1 LEFT JOIN PAYMENT ON t_1.payment_id = PAYMENT.payment_id;

/*Вывели название товара качества "max", его производителя и его стоимость*/
SELECT
  name_nm
  , caption_nm
  , price_amt
  FROM (
    /*Вывели имя поставщика и id товара*/
    SELECT
      caption_nm
      , product_id
        FROM (
          /*Выводит id и имя производителя, а также id его поставки*/
          SELECT
            SUPPLIER.supplier_id
            , caption_nm
            , delivery_id
            FROM SUPPLIER LEFT JOIN DELIVERY ON SUPPLIER.supplier_id = DELIVERY.supplier_id
        ) AS t_1 LEFT JOIN ACCOUNT_JOURNAL ON t_1.delivery_id = ACCOUNT_JOURNAL.delivery_id
  ) AS t_2 LEFT JOIN PRODUCT ON t_2.product_id = PRODUCT.product_id
    WHERE quality_txt = 'max';

/*Вывели ФИО покупателей, имя и кол-во товара, и сумму их покупки*/
SELECT
  last_nm
  , first_nm
  , middle_nm
  , name_nm
  , number_product_cnt
  , t_3.price_amt
    FROM (
      /*Вывели ФИО покупателей, id и кол-во товара, и сумму их покупки*/
      SELECT
        last_nm
        , first_nm
        , middle_nm
        , product_id
        , number_product_cnt
        , price_amt
          FROM (
            /*Вывели ФИО покупателей, а также id покупки и сумму их покупки*/
            SELECT
              last_nm
              , first_nm
              , middle_nm
              , buying_id
              , price_amt
                FROM (
                  /*Вывели ФИО покупателей, а также id покупки и id их платежа*/
                  SELECT
                  last_nm
                  , first_nm
                  , middle_nm
                  , buying_id
                  , payment_id
                    FROM BUYING LEFT JOIN CONSUMER on BUYING.consumer_id = CONSUMER.consumer_id
                ) AS t_1 LEFT JOIN PAYMENT ON t_1.payment_id = PAYMENT.payment_id
          ) AS t_2 LEFT JOIN PURCHASES_JOURNAL ON t_2.buying_id = PURCHASES_JOURNAL.buying_id
    ) AS t_3 LEFT JOIN PRODUCT ON t_3.product_id = PRODUCT.product_id;
