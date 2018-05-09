CREATE VIEW V_VIEW_1 AS
  (
    SELECT
      caption_nm               AS Название_фирмы
      , date_of_payment_dttm   AS Дата_поставки
      , price_amt              AS Стоимость
    FROM (
           SELECT
             delivery.supplier_id
             , caption_nm
             , payment_id
           FROM SUPPLIER
             LEFT JOIN DELIVERY ON SUPPLIER.supplier_id = DELIVERY.supplier_id
         ) AS t_1 LEFT JOIN PAYMENT ON t_1.payment_id = PAYMENT.payment_id
    WHERE PAYMENT.payment_type_txt = 'card'
    ORDER BY price_amt DESC
  );

CREATE VIEW V_VIEW_2 AS
  (
    SELECT
      last_nm             AS Фамилия
      , first_nm          AS Имя
      , middle_nm         AS Отчество
      , SUM(price_amt)    AS Итоговая_сумма
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
            , middle_nm
  );
