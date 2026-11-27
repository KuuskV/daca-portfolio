# Nädal 3 – Roll A: Müük + Kliendid (kokkuvõte)

## Kokkuvõte Annale

UrbanStyle'i müügist (2 622 732 €) tuleb 8,7% vaid 10 parima kliendi käest: TOP 10 ostsid kokku 228 337 € eest, kusjuures kõige suurem on Tiina Pärn (Tartu, 27 668 € ja 73 ostu). Tallinn annab 38% kogumüügist (1 006 253 €), aga TOP 10-st on Tallinnast vaid kolm klienti, Pärnust neli. Pärnu klient kulutab keskmiselt kõige rohkem (1 355 € kliendi kohta vs Tallinn 999 € ja Tartu 997 €). Gold-taseme klient on väärtuslikum kui teised (1 087 € kliendi kohta, bronze 891 €), kuid 1 024 kliendil (40% aktiivsetest) pole lojaalsustaset üldse määratud ja nemad toovad 41% müügist. Soovitus: suunata kampaania TOP 10 ja 762 üle keskmise kulutava kliendi (30% aktiivsetest) hoidmisele, panna Pärnule rohkem tähelepanu ning määrata lojaalsustase ka tasemeta klientidele.

## Võtmenumbrid

| Näitaja | Väärtus |
|---|---|
| Müügiridu kokku (pärast puhastust) | 10 118 |
| Müügiread kliendiga (INNER JOIN) | 9 130 |
| Müügiread ilma kliendita | 988 |
| Aktiivsed kliendid | 2 551 |
| Kadunud kliendid (pole ostnud) | 599 (19% kõigist 3 150-st) |
| Kogumüük (9 130 rea põhjal) | 2 622 731,78 € |
| TOP 10 kliendi müük | 228 336,79 € (8,7%) |
| Üle keskmise kulutajaid | 762 (29,9% aktiivsetest) |

## Müük linnade kaupa (TOP 5)

| Linn | Kliente | Oste | Kogumüük € | Osa | € kliendi kohta |
|---|---|---|---|---|---|
| Tallinn | 1007 | 3601 | 1 006 252,88 | 38,4% | 999 |
| Tartu | 525 | 1764 | 523 286,64 | 20,0% | 997 |
| Pärnu | 276 | 1231 | 374 005,86 | 14,3% | 1 355 |
| Narva | 145 | 438 | 122 226,14 | 4,7% | 843 |
| Viljandi | 94 | 359 | 102 314,94 | 3,9% | 1 088 |

## Müük lojaalsustasemete kaupa

| Tase | Kliente | Kogumüük € | Osa | € kliendi kohta |
|---|---|---|---|---|
| NULL (määramata) | 1024 | 1 071 805,32 | 40,9% | 1 047 |
| silver | 560 | 593 470,07 | 22,6% | 1 060 |
| gold | 491 | 533 601,64 | 20,3% | 1 087 |
| bronze | 476 | 423 854,75 | 16,2% | 890 |

## Märkused andmete kohta

- 988 müügirida (9,8%) ei leia customers tabelist klienti, seega on kõik INNER JOINi summad 9130 rea põhjal.
- Kontrollsummad klapivad: linnade ostud annavad kokku 9130, lojaalsuse kliendid 2551, mõlema tabeli müük 2 622 731,78 €.
- 1024 kliendil on loyalty_tier NULL.
- Üle 100 rea tulemust piirab Supabase 100 reaga, kuid siin on kõik tulemused alla selle.

## Esitluse jutt (45 sekundit)

"Mina uurisin TOP kliente INNER JOINiga. Leidsin, et 10 parimat klienti toovad 8,7% müügist ja kõige suurem on Tiina Pärn Tartust 27,7 tuhande euroga. Tallinn on müügilt suurim, aga Pärnu kliendid kulutavad keskmiselt kõige rohkem. Äriliselt tähendab see, et kampaania peaks hoidma TOP kliente ja arendama Pärnu turgu. Üllatas, et 40% klientidest pole lojaalsustaset, kuigi nad toovad 41% müügist. Ja 988 müügirida jääb ilma kliendita."

## README osa (week-3/README.md)

### Roll A: Müük + Kliendid (INNER JOIN)

Meeskond: UrbanStyle G2 – Kliendid-Turundus. Minu ülesanne oli leida TOP kliendid, linnade ja lojaalsustasemete müük INNER JOINiga sales ja customers vahel ning kontrollida, kui palju müüke INNER JOIN välja jätab.

Failid:
- `individual/week3_roll_a_myyk_kliendid.sql`
- ekraanipildid tulemustest (TOP 10, linnad, lojaalsustasemed)
- meeskonna ühine väljund: [lisa link]

Peamised leiud: TOP 10 klienti toovad 8,7% müügist, Tallinn 38% müügist, Pärnu kliendid kulutavad kõige rohkem, 988 müügirida on ilma kliendita, 762 klienti kulutab üle keskmise.
