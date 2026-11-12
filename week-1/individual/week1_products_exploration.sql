/* ============================================================
   DACA Nädal 1 – Grupitöö, liige C: Tooteandmed (products)
   Autor: Virko Kuusk
   ============================================================ */


/* SAMM 2 – Mitu toodet on kokku?
   Tulemus: 362 toodet. */

SELECT COUNT(*) AS toodete_arv
FROM products;


/* SAMM 3 – Millised veerud tabelis on?
   Tulemus: 9 veergu – product_id, product_name, category, subcategory,
   supplier, cost_price, retail_price, eco_certified, created_at. */

SELECT *
FROM products
LIMIT 10;


/* SAMM 4 – Unikaalsed tootekategooriad
   Tulemus: 5 kategooriat – jalanõusid, laste_riided, aksessuaarid,
   naiste_riided, meeste_riided. */

SELECT DISTINCT category
FROM products;


/* SAMM 5.1 – 10 kõige kallimat toodet */

SELECT product_name, category, retail_price
FROM products
ORDER BY retail_price DESC
LIMIT 10;


/* SAMM 5.2 – 10 kõige odavamat toodet */

SELECT product_name, category, retail_price
FROM products
ORDER BY retail_price ASC
LIMIT 10;

/* Tulemus:
   - Kõige kallim toode: "Õhuline sünteetiline sporditossud" (jalanõusid), 434,08 €.
   - Kõige odavam toode: "Vintage villane kangasvöö" (aksessuaarid), 13,53 €.
   - 10 kalleimast 9 on jalanõud.
   - 10 odavamast 7 on aksessuaarid ja 3 lasteriided. */


/* SAMM 6 – Filtreeri kategooria järgi (naiste_riided) */

SELECT *
FROM products
WHERE category = 'naiste_riided'
ORDER BY retail_price DESC;

/* Tulemus: naisteriiete kategoorias on 70 toodet.
   - Kõige kallim: "Boheemlaslik linane pullover", 351,33 €.
   - Kõige odavam: "Klassikaline satiinne mantelpaltoo", 32,93 €. */


/* SAMM 7.1 – Puuduvad väärtused: retail_price */

SELECT COUNT(*) - COUNT(retail_price) AS puuduvad_hinnad
FROM products;

/* Tulemus: 0 puuduvat hinda. */


/* SAMM 7.2 – Puuduvad väärtused: category */

SELECT COUNT(*) - COUNT(category) AS puuduvad_kategooriad
FROM products;

/* Tulemus: 0 puuduvat kategooriat. */


/* SAMM 7.3 – Puuduvad väärtused: eco_certified (lisakontroll) */

SELECT COUNT(*) - COUNT(eco_certified) AS puuduvad_eco_margised
FROM products;

/* Tulemus: 18 tootel puudub ökomärgise info (NULL). */


/* SAMM 8 – Kokkuvõte

   Tabelis on 362 toodet ja 9 veergu. Tooted jagunevad 5 kategooriasse:
   jalanõusid, laste_riided, aksessuaarid, naiste_riided ja meeste_riided.
   Hinnad jäävad vahemikku 13,53 € ("Vintage villane kangasvöö") kuni
   434,08 € ("Õhuline sünteetiline sporditossud"). Hindades ja kategooriates
   puuduvaid väärtusi ei ole, kuid 18 tootel (umbes 5%) puudub ökomärgise info.

   See tähendab UrbanStyle'ile, et hindu ja kategooriaid saab aruandluses
   kindlalt kasutada, kuid 18 toote ökomärgis tuleb üle kontrollida –
   muidu on ökotoodete müügiaruanne ebatäpne. */


/* KOGU faasi lause (grupile esitlemiseks)

   Mina uurisin tooteandmete tabelit (products). Leidsin, et 18 tootel
   362-st (umbes 5%) puudub info ökomärgise kohta. See tähendab
   UrbanStyle'ile, et ökotoodete aruanne on ebatäpne, kuni nende toodete
   märgised on üle kontrollitud. */


/* SAMM 9 – Boonus: kahjumiga müüdavad tooted (müügihind < omahind) */

SELECT product_id, product_name, category, cost_price, retail_price
FROM products
WHERE retail_price < cost_price
ORDER BY cost_price DESC;

/* Tulemus: 10 rida, kuid 2 toodet on tabelis topelt
   ("Vintage nahkne tossud" – ID 1261 ja 1351;
   "Minimalistlik kashmiir bleiser" – ID 1212 ja 1353).
   Tegelikult on kahjumiga tooteid 8.
   - Suurim kahjum: "Praktiline viskoosne jakk" – omahind 346,70 €,
     müügihind 213,35 €, kahjum 133,35 € iga müüdud jaki pealt.
   - Kogu poe kõige odavam toode, "Vintage villane kangasvöö" (13,53 €),
     müüakse samuti kahjumiga (omahind 22,70 €).

   See tähendab UrbanStyle'ile, et nende toodete sisseostuhind tuleb üle
   kontrollida või tõsta müügihind sisseostuhinnast kõrgemaks. */


/* ============================================================
   EDASIJÕUDNUTE TASE (30%)
   ============================================================ */


/* SAMM 10 – Toodete arv kategooriate kaupa */

SELECT category, COUNT(*) AS toodete_arv
FROM products
GROUP BY category
ORDER BY toodete_arv DESC;

/* Tulemus: meeste_riided 82, jalanõusid 73, laste_riided 70,
   naiste_riided 70, aksessuaarid 67 (kokku 362). */


/* SAMM 11 – Hinnad kategooriate kaupa (min, max, keskmine) */

SELECT category,
       COUNT(*) AS toodete_arv,
       MIN(retail_price) AS min_hind,
       MAX(retail_price) AS max_hind,
       ROUND(AVG(retail_price), 2) AS keskmine_hind
FROM products
GROUP BY category
ORDER BY max_hind DESC;

/* Tulemus:
   Kategooria      Tooteid   Min        Max        Keskmine
   jalanõusid      73        58,49 €    434,08 €   214,10 €
   meeste_riided   82        48,85 €    374,54 €   189,91 €
   naiste_riided   70        32,93 €    351,33 €   192,58 €
   aksessuaarid    67        13,53 €    231,13 €   125,71 €
   laste_riided    70        22,70 €    168,82 €    85,30 €

   Jalanõud on kõige kallim kategooria. Naisteriiete keskmine hind on
   kõrgem kui meesteriietel, kuigi meesteriiete kalleim toode on kallim.
   Lasteriided on keskmiselt kõige odavamad. */


/* SAMM 12 – Kombineeritud tingimused: naisteriided üle 50 € */

SELECT *
FROM products
WHERE retail_price > 50 AND category = 'naiste_riided'
ORDER BY retail_price DESC;

/* Tulemus: 67 rida, kuid 2 toodet on topelt sama nime ja hinnaga
   ("Klassikaline kashmiir pusa" – ID 1345 ja 1361;
   "Minimalistlik kashmiir bleiser" – ID 1212 ja 1353).
   Tegelikult on üle 50 € maksvaid naisteriideid 65.
   Duplikaadid näitavad, et products tabel vajab enne analüüsi puhastamist. */
