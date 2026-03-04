-- =========================================
-- EXPLORACIÓN: MÉTODOS DE PAGO
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================

-- ¿Qué métodos de pago usan los clientes y cuál es el ticket promedio?
SELECT
  payment_type,
  COUNT(*) AS total_transacciones,
  ROUND(AVG(payment_value), 2) AS ticket_promedio,
  ROUND(SUM(payment_value), 2) AS ingreso_total
FROM `olist-ecommerce-daniel.olist_raw.order_payments`
GROUP BY payment_type
ORDER BY total_transacciones DESC;



