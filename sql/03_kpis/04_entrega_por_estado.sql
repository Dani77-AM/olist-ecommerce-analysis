
-- =========================================
-- EXPLORACIÓN: ENTREGA POR ESTADO
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================

-- KPI 4: Tiempo de entrega real vs estimado por estado
SELECT
  c.customer_state AS estado,
  COUNT(o.order_id) AS total_pedidos,
  ROUND(AVG(DATE_DIFF(o.order_delivered_customer_date,
            o.order_purchase_timestamp, DAY)), 1) AS dias_entrega_real,
  ROUND(AVG(DATE_DIFF(o.order_estimated_delivery_date,
            o.order_purchase_timestamp, DAY)), 1) AS dias_estimados,
  ROUND(AVG(DATE_DIFF(o.order_estimated_delivery_date,
            o.order_delivered_customer_date, DAY)), 1) AS dias_adelanto
FROM `olist-ecommerce-daniel.olist_raw.orders` o
JOIN `olist-ecommerce-daniel.olist_raw.customers` c
  ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY estado
ORDER BY dias_entrega_real ASC;