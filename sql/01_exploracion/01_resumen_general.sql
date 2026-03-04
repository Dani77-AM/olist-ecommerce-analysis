sql-- =========================================
-- EXPLORACIÓN GENERAL
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================

-- ¿Cuántos pedidos tenemos y cuál es el rango de fechas?
SELECT
  COUNT(*) AS total_pedidos,
  MIN(order_purchase_timestamp) AS primer_pedido,
  MAX(order_purchase_timestamp) AS ultimo_pedido
FROM `olist-ecommerce-daniel.olist_raw.orders`;


-- ¿Cuántos pedidos hay por estado?
SELECT
  order_status,
  COUNT(*) AS total,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS porcentaje
FROM `olist-ecommerce-daniel.olist_raw.orders`
GROUP BY order_status
ORDER BY total DESC;

