# Nädal 3 – Meeskonna JOIN-analüüs

**Meeskond:** UrbanStyle G2 – Kliendid-Turundus
**Tegelane:** Anna Mets (turundusjuht)

Meeskonna ühine esitlus: [UrbanStyle G2 Nädal 3 esitlus](https://docs.google.com/presentation/d/1_Ft9nK9J098MdFqELLU8sawzKJsgkvK8X-9ry-ssxhU/edit)
Meeskonna repo: [UrbanStyle-G2----Kliendid-Turundus](https://github.com/kairikiik-hub/UrbanStyle-G2----Kliendid-Turundus)

## Peamised leiud rollide kaupa

- **Roll A, müük + kliendid (Virko, INNER JOIN):** TOP 10 klienti toovad 8,7% müügist (228 337 €), parim klient on Tiina Pärn Tartust (27 668 €). Tallinn annab 38% müügist, aga Pärnu klient kulutab kõige rohkem (1 355 € vs Tallinn 999 €). 762 klienti kulutab üle keskmise. 988 müügirida on ilma kliendita.
- **Roll B, kliendid ilma ostudeta (Berent, LEFT JOIN):** [Berendi tulemus lisatakse]
- **Roll C, tooted + inventuur (Kairi, LEFT JOIN):** 12 toodet pole kunagi ostetud ja laos on neid 0 tk, seega müümata tooted raha kinni ei hoia. Edukamad kategooriad on jalanõud ja meeste riided.
- **Roll D, müügikanalid (Katri, mitme tabeli JOIN):** Pood toob ligi 2/3 kogumüügist (1,90 mln €), online ligi 1/3 (1,01 mln €). Müük kliendi kohta on poes 835 € ja online'is 590 €. Online'is juhivad jalanõud, poes meeste riided.

## Suurim üllatus

Pood on selgelt suurema osakaaluga kui online, kuigi eeldasime vastupidist. Lisaks müüdi kõige rohkem tükke naistekleite ja seemisnahkseid oxforde, aga kõige rohkem raha tõid sporditossud ja goretex oxfordid. [Berendi üllatus lisatakse]

## Soovitus Annale

Keskenduda TOP klientide ja üle keskmise kulutajate hoidmisele ning suunata varud jalanõudele ja meeste riietele. Pood on praegu tugevam ja efektiivsem kanal, online'is on kasvuruumi jalanõude kampaaniatega. Kampaaniaid võiks kohandada kanali ja linna järgi (Tallinn, Tartu, Pärnu). [Berendi soovitus lisatakse]

## Puuduvad andmed

Kanalite kulud ja kampaaniate maksumused (kasumlikkust ei saa hinnata), tagastuste andmed, põhjus, miks kliendid eelistavad ühte kanalit, ning lojaalsustase 1 024 kliendil.

## Andmete kvaliteedi märkus

INNER JOIN sales ja customers vahel annab 9 130 rida 10 118-st, sest 988 müügirida on ilma kliendita. Seetõttu on kanalite ja klientide kogusummad erinevad (2,91 mln € vs 2,62 mln €).
