# Nädal 3: SQL JOINid

DACA (Andmeanalüütiku Karjäärikiirendi) nädal 3. Meeskond: UrbanStyle G2 – Kliendid-Turundus.

## Kontekst

UrbanStyle'i turundusjuht Anna Mets soovis teada, kes on parimad kliendid, millised tooted müüvad, kes pole kunagi ostnud ja millised müügikanalid ning linnad töötavad. Selleks tuli ühendada mitu tabelit (sales, customers, products, inventory) JOIN-lausetega. Meeskond jagas ülesanded neljaks rolliks (A, B, C, D). Selles failis on kirjeldatud ainult minu osa.

## Minu roll: A (Müük + Kliendid, INNER JOIN)

Ülesanne: ühendada tabelid sales ja customers, leida TOP kliendid ning vaadata müüki linnade ja lojaalsustasemete kaupa.

### Eeltöö

Enne JOINe viisin nädala 2 puhastuse originaaltabelitesse: sales 15 234 -> 10 118 rida (duplikaadid kustutatud, tuleviku kuupäevad parandatud) ja customers linnad 54 -> 12 (INITCAP + TRIM).

### Failid

- [individual/week3_roll_a_myyk_kliendid.sql](individual/week3_roll_a_myyk_kliendid.sql): kõik päringud
- individual/screenshots/: tulemuste ekraanipildid (TOP 10 kliendid, müük linnade kaupa, müük lojaalsustasemete kaupa)
- Meeskonna ühine väljund: [LISA LINK SIIA]

### Päringud

1. Kontrollpäringud: INNER JOIN annab 9 130 rida, 988 müügirida jääb ilma kliendita, kliente on 3 150 (2 551 aktiivset ja 599 kadunud).
2. TOP 10 klienti kogumüügi järgi.
3. Müük linnade kaupa.
4. Müük lojaalsustasemete kaupa.
5. Kliendid, kelle kogumüük on üle keskmise (alampäring).

### Leiud

| Näitaja | Tulemus |
|---|---|
| Kogumüük (9 130 rea põhjal) | 2 622 731,78 € |
| TOP 10 klienti | 228 336,79 € (8,7% müügist) |
| Parim klient | Tiina Pärn, Tartu, 27 668,02 € (73 ostu) |
| Tallinna osa müügist | 38,4% (1 006 252,88 €) |
| Kõrgeim müük kliendi kohta | Pärnu, 1 355 € (Tallinn 999 €, Tartu 997 €) |
| Üle keskmise kulutajad | 762 klienti (29,9% aktiivsetest) |
| Lojaalsustase puudub | 1 024 klienti, 41% müügist |

### Kokkuvõte Annale

TOP 10 klienti toovad 8,7% müügist ja kõige suurem on Tiina Pärn Tartust. Tallinn annab 38% müügist, aga Pärnu kliendid kulutavad keskmiselt kõige rohkem. Gold-taseme klient on väärtuslikum kui bronze (1 087 € vs 890 € kliendi kohta), kuid 1 024 kliendil pole taset üldse määratud. Soovitus: keskenduda TOP klientide ja 762 üle keskmise kulutaja hoidmisele, panna Pärnule rohkem tähelepanu ning määrata lojaalsustase ka tasemeta klientidele.

### Andmete piirangud

- 988 müügirida (9,8%) ei leia customers tabelist klienti, seega ei kajastu need klientide ja linnade tulemustes.
- Ligikaudu 150 duplikaatset kliendikirjet jäävad lahendamata (nädal 4+).
- loyalty_tier on 1 024 kliendil NULL.

### Mida õppisin

- INNER JOIN jätab välja read ilma vasteta, seega tasub ridade arvu alati kontrollida (10 118 vs 9 130).
- LEFT JOIN + IS NULL leiab read, millel puudub vaste (kadunud kliendid, kliendita müügiread).
- ON-tingimus peab siduma kaks eri tabelit (`s.customer_id = c.customer_id`), vastasel juhul on tulemus vale.
- Pärast GROUP BY-d tuleb sorteerida aliase või agregaadi järgi.
