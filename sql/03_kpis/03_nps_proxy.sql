
-- =========================================
-- EXPLORACIÓN: NPS PROXY - SATISFACCIÓN DEL CLIENTE POR SCORE
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================


-- KPI 3: NPS Proxy - Satisfacción del cliente por score
SELECT
  review_score,
  COUNT(*) AS total_reviews,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS porcentaje
FROM `olist-ecommerce-daniel.olist_raw.order_reviews`
GROUP BY review_score
ORDER BY review_score DESC;