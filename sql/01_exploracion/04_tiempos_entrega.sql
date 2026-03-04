-- =========================================
-- EXPLORACIÓN: TIEMPOS DE ENTREGA
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================


-- ¿Cuál es el tiempo promedio de entrega en días?
SELECT
  ROUND(AVG(DATE_DIFF(order_delivered_customer_date, 
            order_purchase_timestamp, DAY)), 1) AS dias_entrega_promedio,
  ROUND(AVG(DATE_DIFF(order_estimated_delivery_date, 
            order_purchase_timestamp, DAY)), 1) AS dias_estimados_promedio,
  ROUND(AVG(DATE_DIFF(order_estimated_delivery_date, 
            order_delivered_customer_date, DAY)), 1) AS dias_adelanto_promedio
FROM `olist-ecommerce-daniel.olist_raw.orders`
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL;