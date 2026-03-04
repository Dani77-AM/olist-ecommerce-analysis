-- =========================================
-- EXPLORACIÓN: TICKET PROMEDIO MENSUAL
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================

-- KPI 1: Ticket promedio mensual
SELECT
  FORMAT_DATE('%Y-%m', order_purchase_timestamp) AS mes,
  COUNT(DISTINCT o.order_id) AS total_pedidos,
  ROUND(SUM(op.payment_value), 2) AS ingreso_total,
  ROUND(AVG(op.payment_value), 2) AS ticket_promedio
FROM `olist-ecommerce-daniel.olist_raw.orders` o
JOIN `olist-ecommerce-daniel.olist_raw.order_payments` op
  ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY mes
ORDER BY mes ASC;