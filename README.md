# Prodaja hardverske opreme - seminarski rad

## 1. Dekompozicija
- [x] a) Dokumentacija korisničkog zahtjeva + UserStory
- [x] b) Definicija atributa (minimalno 20)
- [x] c) Određivanje funkcionalnih ovisnosti (minimalno 5)
- [x] d) Određivanje i izbor primarnih ključeva (ograda atributa)
- [x] e) Dekompozicija 3NF i BCNF korištenjem algoritama za dekompoziciju

## 2. Realizacija prema 3NF
- [x] a) kreiranje baze (tablice,atributi, relacije)
- [x] b) najmanje po jedan od svake vrste triggera
- [x] c) najmanje po jednu proceduru i funkciju koje primaju parametre i vraćaju vrijednosti
- [x] d) najmanje jednu explicitnu transakciju koja će imati najmanje jedan savepoint

## Funkcijalnosti baze
- [x] Dobivanje svih narudžbi za određen datum
- [x]  Dobivanje svih narudžbi u određenom periodu
- [x]  Dobivanje artikala po tipu
- [x]  INSERT Trigger koji Update-a tablicu StavkeZaNarudzbu s razlikom tablica ArtikliNarudzbe i Skladiste kada se doda nova narudžba
- [x]  DELETE trigger koji izbrise stavke ArtikliNarudzbe s ID-em narudzbe koja se izbrisala
- [x]  UPDATE trigger

> DDL i DML SQL kod \\
> prirodni ključ - ključ sa poslovnom vrijednosti i logičkom povezanosti s tablicom \\
> surogat ključ - obično autonum field ID \\

## MK Computer Shop

Klijent zahtijeva računalo po narudžbi.
Zaposlenica u bazu podataka zapisuje:
- Podatke o klijentu
- Podatake o narudžbi
- Popis komponenti za računalo

Popis komponenti se uspoređuje s skladištem te se komponente 
koje nisu na skladištu automatski dodaju na popis za narudžbu od dobavljača.
Popis komponenti s narudžbe se dodaju na račun

### Tablice

| firma           |                  |
|-----------------|------------------|
| OIB             | (PK)             |
| Naziv           |                  |
| Vlasnik         |                  |
| PostanskiBroj   |                  |
| Grad            |                  |

| račun           |                  |
|-----------------|------------------|
| SifraRacuna     | (PK)             |
| IdNarudzba      | (FK)             |
| OIB             | (FK)             |
| DatumIzdavanja  |                  |

| klijent         |                  |
|-----------------|------------------|
| OIB_klijent     | (PK)             |
| Naziv           |                  |
| Telefon         |                  |
| Email           |                  |

| zaposlenik      |                  |
|-----------------|------------------|
| OIB_zaposlenik  | (PK)             |
| ime             |                  |
| prezime         |                  |
| telefon         |                  |
| email           |                  |

| narudžba        |                  |
|-----------------|------------------|
| id_narudzba     | (PK)             |
| OIB_zaposlenik  | (FK)             |
| OIB_klijent     | (FK)             |
| DatumZaprimanja |                  |
| DatumIsporuke   |                  |

| popis_artikala  |                  |
|-----------------|------------------|
| id_narudzba     | (FK)             |
| id_artikal      | (FK)             |
| Kolicina        |                  |
| UkupnaCijena    |                  |

| skladište       |                  |
|-----------------|------------------|
| id_stavka       | (PK)             |
| OIB_dobavljac   | (FK)             |
| id_artikal      | (FK)             |
| Cijena          |                  |
| DatumDospijeca  |                  |

| artikli         |                  |
|-----------------|------------------|
| id_artikal      | (PK)             |
| naziv           |                  |
| model           |                  |
| proizvodjac     |                  |

| dobavljač       |                  |
|-----------------|------------------|
| OIB_dobavljac   | (PK)             |
| Naziv           |                  |
| Vlasnik         |                  |
| PostanskiBroj   |                  |
| Grad            |                  |

| artikli         |                  |
|-----------------|------------------|
| id_artikal      | (PK)             |
| naziv           |                  |
| model           |                  |
| proizvodjac     |                  |

| dobavljač       |                  |
|-----------------|------------------|
| OIB_dobavljac   | (PK)             |
| Naziv           |                  |
| Vlasnik         |                  |
| PostanskiBroj   |                  |
| Grad            |                  |

