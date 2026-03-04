-- =========================================
-- EXPLORACIÓN: CATEGORÍAS DE PRODUCTOS
-- Proyecto: Olist E-commerce Analysis
-- Autor: Daniel AM
-- Fecha: 2026-03-03
-- =========================================



-- ¿Cuáles son las categorías más vendidas?
SELECT
  t.string_field_1 AS categoria,
  COUNT(oi.order_id) AS total_ventas,
  ROUND(SUM(oi.price), 2) AS ingreso_total,
  ROUND(AVG(oi.price), 2) AS precio_promedio
FROM `olist-ecommerce-daniel.olist_raw.order_items` oi
JOIN `olist-ecommerce-daniel.olist_raw.products` p
  ON oi.product_id = p.product_id
JOIN `olist-ecommerce-daniel.olist_raw.product_category_translation` t
  ON p.product_category_name = t.string_field_0
GROUP BY categoria
ORDER BY total_ventas DESC
LIMIT 10;