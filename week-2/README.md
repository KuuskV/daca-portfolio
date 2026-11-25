# Nädal 2: SQL puhastamine (UrbanStyle)

**Minu roll:** B, kliendiandmete puhastaja (tabel `customers`).

**Kontekst:** meeskond UrbanStyle G2 – Kliendid-Turundus puhastab UrbanStyle'i andmeid. Iga liige võtab ühe domeeni (müük, kliendid, tooted, ristvalideerimine).

Meeskonna ühisraport: https://github.com/kairikiik-hub/UrbanStyle-G2----Kliendid-Turundus

Meeskonna koondraport: [week2_team_cleaning_report.md](team/week2_team_cleaning_report.md)

## Minu osa

- [individual/week2_customers_cleaning.sql](individual/week2_customers_cleaning.sql): skript test koopia, duplikaatide, NULL-ide ja formaatide kontrolliks ning puhastamiseks.
- [individual/week2_customers_report.md](individual/week2_customers_report.md): raport koos enne/pärast tabeli ja soovitusega.

## Peamine tulemus

3150 kliendi hulgas 128 duplikaatset e-maili, 380 klienti ilma e-mailita ja 54 linnakirjaviisi 12 linnale. Linnad parandati koopias (252 rida).

## Mida ma tegin
- Tegin `customers` tabelist test koopia (`customers_test`), et originaalandmeid mitte rikkuda.
- Kontrollisin duplikaate, puuduvaid väärtusi, linnade kirjaviisi ja telefoni formaati.
- Puhastasin linnad `UPDATE` käsuga ja kontrollisin e-maile `LOWER` ja `TRIM` abil.
- Edasijõudnute osas kontrollisin telefoni formaati `CASE WHEN` abil.

## Mida see UrbanStyle'ile tähendab
Duplikaatsed e-mailid paisutavad kampaaniate ulatust: e-mailiga kontakte on enne puhastust 2 770, pärast ligikaudu 2 640. 380 kliendil e-maili üldse pole ja seda ei saa SQL-iga parandada, see on äriküsimus. Linnade parandus teeb piirkondlikud aruanded täpseks.

## Peamised õpid
- `HAVING COUNT(*) > 1` leiab duplikaadid pärast `GROUP BY` käsku, `WHERE` seda ei oska.
- `UPDATE` tuleb alati teha test koopial ja kontrollida enne-pärast arve.
- Sõnumi "Success. No rows returned" järel `UPDATE` käsu puhul on tavaline, see ei tähenda viga.
- Suur- ja väiketähed loevad: Ago ja AGO olid sama inimene, aga erinevad read.
- Kõiki puhastusotsuseid ei saa SQL teha. Näiteks pole reeglit, milline duplikaat alles jääb.

## AI kasutamine
Kasutasin Perplexity AI-d juhendajana: see selgitas puhastamise samme ja kontrollis minu päringuid. Päringud kirjutasin ise ja tulemused kontrollisin Supabase'is üle.

## Meeskonna töö
- Meeskonna repo: https://github.com/kairikiik-hub/UrbanStyle-G2----Kliendid-Turundus
- Esitlus: https://docs.google.com/presentation/d/1xjhDgs9Knx-YogNU7mxKjI4cbaaV8NJfCxgT2Y7uz2s/edit
