-- =========================================
-- EXPLORACIÓN: TASA DE CANCELACIÓN MENSUAL
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================


-- KPI 2: Tasa de cancelación mensual
SELECT
  FORMAT_DATE('%Y-%m', order_purchase_timestamp) AS mes,
  COUNT(*) AS total_pedidos,
  COUNTIF(order_status = 'canceled') AS pedidos_cancelados,
  ROUND(COUNTIF(order_status = 'canceled') * 100.0 / COUNT(*), 2) AS tasa_cancelacion
FROM `olist-ecommerce-daniel.olist_raw.orders`
GROUP BY mes
ORDER BY mes ASC;