-- =========================================
-- EXPLORACIÓN: TASA DE RECOMPRA
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================

-- KPI 5: Tasa de recompra por cliente
SELECT
  total_pedidos,
  COUNT(*) AS total_clientes,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS porcentaje
FROM (
  SELECT
    customer_unique_id,
    COUNT(o.order_id) AS total_pedidos
  FROM `olist-ecommerce-daniel.olist_raw.customers` c
  JOIN `olist-ecommerce-daniel.olist_raw.orders` o
    ON c.customer_id = o.customer_id
  GROUP BY customer_unique_id
) sub
GROUP BY total_pedidos
ORDER BY total_pedidos ASC;