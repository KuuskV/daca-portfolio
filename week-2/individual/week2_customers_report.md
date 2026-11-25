# Nädal 2: kliendiandmete puhastamisraport (roll B)

**Autor:** Virko Kuusk | **Meeskond:** UrbanStyle G2 – Kliendid-Turundus
**Tabel:** `customers` (3150 rida) | **Töötabel:** `customers_test`
**Skript:** [week2_customers_cleaning.sql](week2_customers_cleaning.sql)

## Töövoog

Test koopia → leia probleemid → puhasta koopial → kontrolli → dokumenteeri. Päris tabelit `customers` ei muudetud.

## Leiud

| Kategooria | Leitud | Kirjeldus |
|---|---|---|
| Duplikaatsed e-mailid | 128 e-maili (130 liigset rida) | 2 e-maili esineb 3 korda. Duplikaatidel erineb nimi tähesuuruse poolest (nt Ago vs AGO) |
| NULL eesnimi | 0 | Nimed on täielikud |
| NULL perenimi | 0 | Nimed on täielikud |
| Ebajärjekindlad linnanimed | 54 kirjaviisi 12 linnale | Väiketähed, suurtähed ja tühikud (nt Tallinn 4 kujul) |
| NULL telefon | 0 | Telefonid on täielikud |
| NULL e-mail | 380 | 12% klientidest ei ole e-maili |

## Enne ja pärast

| Näitaja | Enne | Pärast |
|---|---|---|
| Linnakirjaviise | 54 | 12 |
| Valesti kirjutatud linnadega ridu | 252 | 0 |
| E-mailid valesti formaadis | 0 | 0 |
| Duplikaatsed e-mailid | 128 | 128 (ei kustutatud, vajab ärireeglit) |
| Kliente ilma e-mailita | 380 | 380 (SQL ei paranda) |
| Telefoni formaat | +372 XXXX XXXX | muutmata (kontroll: 0 erineva formaadiga numbrit) |

## Tähelepanekud

- Linnade ebajärjekindlus on suurim üllatus. 54 kirjaviisi tähendab, et igasugune linnapõhine aruanne näitaks 12 linna asemel 54 ja jagaks iga linna kliendid mitme rea vahel.
- Duplikaadid tuvastati e-maili järgi, sest nime järgi otsimine jätaks osa kaduma (Ago vs AGO).
- Tulemus 0 (nimed, telefonid, e-mailide formaat) tähendab, et need reeglid kehtivad selles andmestikus, mitte seda, et päring on vale.

## Soovitus Toomasele

1. Esimesena ühtlustada linnanimed. Üks `UPDATE ... INITCAP(TRIM(city))` parandab 252 rida ja kõik linnaaruanded.
2. Seejärel eemaldada 130 liigset duplikaatkirjet pärast ärireegli kokkuleppimist, milline kirje jääb alles.
3. 380 puuduvat e-maili tuleb klientidelt uuesti küsida, näiteks kassas või püsikliendiprogrammis.

## Mõju turundusele (osakondade sild)

Kontakte e-mailiga: 3150 − 380 = 2770. Ilma duplikaatideta ligikaudu 2640. Turundus ülehindab oma kontaktbaasi umbes 130 kontakti võrra.

## Puuduvad andmed

Ei ole teada, millise duplikaatkirje peab alles jätma (vanim `customer_id` vs täielikum kirje). See on ärireegel, mitte SQL-küsimus.
