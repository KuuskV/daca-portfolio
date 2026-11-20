-- =====================================================================
-- DACA Nädal 2 | Roll B: Kliendiandmete puhastaja (customers)
-- Autor: Virko Kuusk | Meeskond: UrbanStyle G2 - Kliendid-Turundus
-- Reegel: test koopia -> puhasta -> kontrolli -> dokumenteeri
-- Kõik muudatused tehakse ainult tabelis customers_test, mitte customers.
-- =====================================================================

-- ---------------------------------------------------------------------
-- BAASTASE
-- ---------------------------------------------------------------------

-- Samm 1: loo test koopia
-- Tulemus: 3150 rida
DROP TABLE IF EXISTS customers_test;
CREATE TABLE customers_test AS SELECT * FROM customers;
SELECT COUNT(*) AS ridade_arv FROM customers_test;

-- Samm 2: duplikaatsed e-mailid
-- Tulemus: 128 e-maili esineb mitu korda (2 e-maili 3 korda), kokku 130 liigset rida
SELECT email, COUNT(*) AS koopiate_arv
FROM customers_test
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

-- Samm 2b: duplikaatsete e-mailide arv (ROW_NUMBER, liigsed read)
-- Tulemus: 130
SELECT COUNT(*) AS dup_read
FROM (
    SELECT ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn
    FROM customers_test
    WHERE email IS NOT NULL
) t
WHERE rn > 1;

-- Samm 3: puuduvad nimed
-- Tulemus: 0 NULL eesnime, 0 NULL perenime
SELECT
    COUNT(*) FILTER (WHERE first_name IS NULL OR first_name = '') AS null_eesnimi,
    COUNT(*) FILTER (WHERE last_name IS NULL OR last_name = '') AS null_perenimi
FROM customers_test;

-- Samm 4: linnade nimekujud
-- Tulemus: 54 erinevat rida
SELECT city, COUNT(*) AS arv
FROM customers_test
GROUP BY city
ORDER BY city;

-- Samm 4b: kirjaviisid vs päris linnad
-- Tulemus: 54 kirjaviisi, 12 päris linna
SELECT
    COUNT(DISTINCT city) AS kirjaviise,
    COUNT(DISTINCT INITCAP(TRIM(city))) AS paris_linnu
FROM customers_test;

-- Samm 5: puuduvad kontaktandmed
-- Tulemus: 0 NULL telefon, 380 NULL e-mail (12% klientidest)
SELECT
    COUNT(*) FILTER (WHERE phone IS NULL OR phone = '') AS null_telefon,
    COUNT(*) FILTER (WHERE email IS NULL OR email = '') AS null_email
FROM customers_test;

-- ---------------------------------------------------------------------
-- EDASIJÕUDNUTE TASE (puhastus customers_test tabelis)
-- ---------------------------------------------------------------------

-- Linnad, eelvaade (midagi ei muuda)
-- Tulemus: 42 kirjaviisi muutub
SELECT city, INITCAP(TRIM(city)) AS uus_city, COUNT(*) AS arv
FROM customers_test
WHERE city != INITCAP(TRIM(city))
GROUP BY city
ORDER BY city;

-- Linnad, enne: mitu rida on valesti kirjutatud (loeb ainult, ei muuda)
-- Tulemus: 252 rida
SELECT COUNT(*) AS valesti_kirjutatud
FROM customers
WHERE city != INITCAP(TRIM(city));

-- Linnad, UPDATE
UPDATE customers_test
SET city = INITCAP(TRIM(city))
WHERE city != INITCAP(TRIM(city));

-- Linnad, kontroll
-- Tulemus: 12 kirjaviisi (enne 54)
SELECT COUNT(DISTINCT city) AS kirjaviise
FROM customers_test;

-- E-mailid, eelvaade
-- Tulemus: 0 (e-mailid olid juba väiketähtedega ja ilma tühikuteta)
SELECT COUNT(*) AS muudetavaid
FROM customers_test
WHERE email != LOWER(TRIM(email));

-- E-mailid, UPDATE (muutis 0 rida)
UPDATE customers_test
SET email = LOWER(TRIM(email))
WHERE email != LOWER(TRIM(email));

-- E-mailid, kontroll
-- Tulemus: 0
SELECT COUNT(*) AS jaanud
FROM customers_test
WHERE email != LOWER(TRIM(email));

-- Duplikaatide kordus pärast puhastust
-- Tulemus: 128 (duplikaadid ei tulnud tähesuurusest)
SELECT COUNT(*) AS dup_emailid
FROM (
    SELECT email
    FROM customers_test
    WHERE email IS NOT NULL
    GROUP BY email
    HAVING COUNT(*) > 1
) t;

-- Telefoninumbrid, formaadi eelvaade (CASE WHEN)
-- Tulemus: kõik 10 vaadatud numbrit on juba kujul +372 XXXX XXXX
SELECT phone,
    CASE
        WHEN phone LIKE '+372%' THEN phone
        WHEN phone LIKE '372%' THEN '+' || phone
        WHEN LENGTH(phone) = 7 THEN '+372' || phone
        ELSE phone
    END AS standardne_telefon
FROM customers_test
WHERE phone IS NOT NULL
LIMIT 10;

-- Telefoninumbrid, kontroll kogu tabelil
-- Tulemus: TÄIDA (0 = kõik samas formaadis)
SELECT COUNT(*) AS erinev_formaat
FROM customers_test
WHERE phone IS NOT NULL
  AND phone NOT LIKE '+372 ____ ____';
