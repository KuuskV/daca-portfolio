-- DACA Nädal 3 | Roll A: Müük + Kliendid (INNER JOIN)
-- Autor: Virko Kuusk | Meeskond: UrbanStyle G2 – Kliendid-Turundus
-- Eeldus: Samm 0 puhastus tehtud (sales 10118 rida, customers 12 linna)

-- 0. Kontrollpäringud: kui palju müüke INNER JOIN välja jätab
-- 0.1 Müügiread, millele leidub klient (oodatud 9130)
SELECT COUNT(*) AS myyke_kliendiga
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id;

-- 0.2 Müügiread ilma kliendita (LEFT JOIN + IS NULL, tulemus 988)
SELECT COUNT(*) AS kliendita_myyke
FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 0.3 Kadunud (ostmata) kliendid (tulemus 599) ja aktiivsed (2551); kokku 3150
SELECT COUNT(*) AS kadunud_kliente
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;

SELECT COUNT(DISTINCT c.customer_id) AS aktiivseid_kliente
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id;

-- 1. TOP 10 klienti kogumüügi järgi
SELECT
  c.first_name || ' ' || c.last_name AS klient,
  c.city,
  COUNT(DISTINCT s.sale_id) AS ostude_arv,
  SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY kogumuuk DESC
LIMIT 10;

-- 2. Müük linnade kaupa
SELECT
  c.city,
  COUNT(DISTINCT c.customer_id) AS kliente,
  COUNT(s.sale_id) AS oste,
  SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY kogumuuk DESC;

-- 3. Müük lojaalsustasemete kaupa
SELECT
  c.loyalty_tier,
  COUNT(DISTINCT c.customer_id) AS kliente,
  SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.loyalty_tier
ORDER BY kogumuuk DESC;

-- 4. Edasijõudnute tase: kliendid, kelle kogumüük on üle keskmise (762 klienti)
SELECT
  c.first_name || ' ' || c.last_name AS klient,
  SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.total_price) > (
  SELECT AVG(kliendi_muuk)
  FROM (
    SELECT SUM(total_price) AS kliendi_muuk
    FROM sales
    GROUP BY customer_id
  ) AS keskmised
)
ORDER BY kogumuuk DESC;
