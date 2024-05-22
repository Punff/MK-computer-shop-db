-- KREIRANJE TABLICA BAZE PODATAKA

CREATE TABLE Firma (
	OIB CHAR(9) PRIMARY KEY,
	Naziv CHAR(40) NOT NULL,
	Vlasnik CHAR(40) NOT NULL,
	PostanskiBroj CHAR(5) NOT NULL,
	Grad CHAR(20) NOT NULL
);

CREATE TABLE Racun (
	SifraRacuna INT PRIMARY KEY,
	ID_Narudzba INT FOREIGN KEY REFERENCES Narudzba(ID_Narudzba),
	OIB_Firma CHAR(9) FOREIGN KEY REFERENCES Firma(OIB),
	DatumIzdavanja DATE NOT NULL
);

CREATE TABLE Klijent (
	OIB CHAR(9) PRIMARY KEY,
	Naziv VARCHAR(40) NOT NULL,
	Telefon VARCHAR(20) NOT NULL,
	Email VARCHAR(40) NOT NULL,
);

CREATE TABLE Zaposlenik (
	OIB CHAR(9) PRIMARY KEY,
	Ime VARCHAR(20) NOT NULL,
	Prezime VARCHAR(20) NOT NULL,
	Telefon VARCHAR(20) NOT NULL,
	Email VARCHAR(40) NOT NULL,
);

CREATE TABLE Narudzba (
	ID_Narudzba INT PRIMARY KEY,
	OIB_Zaposlenik CHAR(9) FOREIGN KEY REFERENCES zaposlenik(OIB),
    OIB_Klijent CHAR(9) FOREIGN KEY REFERENCES klijent(OIB),
	DatumZaprimanja DATE NOT NULL,
	DatumIsporuke DATE NOT NULL
);

CREATE TABLE Artikal (
	ID_Artikal INT PRIMARY KEY,
	Naziv VARCHAR(40) NOT NULL,
	Model VARCHAR(40) NOT NULL,
	Proizvodjac VARCHAR(40) NOT NULL
);

CREATE TABLE ArtikliNarudzbe (
	ID_Narudzba INT FOREIGN KEY REFERENCES Narudzba(ID_Narudzba),
	ID_Artikal INT FOREIGN KEY REFERENCES Artikal(ID_Artikal),
	Kolicina INT NOT NULL,
	UkupnaCijena DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (ID_Narudzba, ID_Artikal)
);

CREATE TABLE Skladiste (
	ID_Stavka INT PRIMARY KEY,
	OIB_Dobavljac CHAR(9) FOREIGN KEY REFERENCES Dobavljac(OIB),
	ID_Artikal INT FOREIGN KEY REFERENCES Artikal(ID_Artikal),
	Cijena DECIMAL(10, 2) NOT NULL,
	DatumSkladistenja DATE NOT NULL
);

CREATE TABLE Dobavljac (
	OIB CHAR(9) PRIMARY KEY,
	Naziv CHAR(40) NOT NULL,
	Vlasnik CHAR(40) NOT NULL,
	PostanskiBroj CHAR(5) NOT NULL,
	Grad CHAR(20) NOT NULL
);