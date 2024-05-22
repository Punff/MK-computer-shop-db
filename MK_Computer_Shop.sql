-- KREIRANJE TABLICA BAZE PODATAKA

DROP TABLE IF EXISTS ArtikliNarudzbe;
DROP TABLE IF EXISTS Skladiste;
DROP TABLE IF EXISTS Racun;
DROP TABLE IF EXISTS Firma;
DROP TABLE IF EXISTS Dobavljac;
DROP TABLE IF EXISTS Narudzba;
DROP TABLE IF EXISTS Zaposlenik;
DROP TABLE IF EXISTS Klijent;
DROP TABLE IF EXISTS Artikal;
DROP TABLE IF EXISTS StavkeZaNarudzbu;

CREATE TABLE Dobavljac (
    OIB CHAR(9) PRIMARY KEY,
    Naziv CHAR(40) NOT NULL,
    Vlasnik CHAR(40) NOT NULL,
    PostanskiBroj CHAR(5) NOT NULL,
    Grad CHAR(20) NOT NULL
);

CREATE TABLE Artikal (
    ID_Artikal INT PRIMARY KEY IDENTITY,
    Naziv VARCHAR(80) NOT NULL,
    Model VARCHAR(40) NOT NULL,
    Proizvodjac VARCHAR(40) NOT NULL,
    Tip VARCHAR(40) NOT NULL
);

CREATE TABLE Klijent (
    OIB CHAR(9) PRIMARY KEY,
    Naziv VARCHAR(40) NOT NULL,
    Telefon VARCHAR(20) NOT NULL,
    Email VARCHAR(40) NOT NULL
);

CREATE TABLE Zaposlenik (
    OIB CHAR(9) PRIMARY KEY,
    Ime VARCHAR(20) NOT NULL,
    Prezime VARCHAR(20) NOT NULL,
    Telefon VARCHAR(20) NOT NULL,
    Email VARCHAR(40) NOT NULL
);

CREATE TABLE Narudzba (
    ID_Narudzba INT PRIMARY KEY IDENTITY,
    OIB_Zaposlenik CHAR(9) FOREIGN KEY REFERENCES Zaposlenik(OIB),
    OIB_Klijent CHAR(9) FOREIGN KEY REFERENCES Klijent(OIB),
    DatumZaprimanja DATE NOT NULL,
    DatumIsporuke DATE NOT NULL
);

CREATE TABLE Firma (
    OIB CHAR(9) PRIMARY KEY,
    Naziv CHAR(40) NOT NULL,
    Vlasnik CHAR(40) NOT NULL,
    PostanskiBroj CHAR(5) NOT NULL,
    Grad CHAR(20) NOT NULL
);

CREATE TABLE Racun (
    SifraRacuna INT PRIMARY KEY IDENTITY,
    ID_Narudzba INT FOREIGN KEY REFERENCES Narudzba(ID_Narudzba),
    OIB_Firma CHAR(9) FOREIGN KEY REFERENCES Firma(OIB),
    DatumIzdavanja DATE NOT NULL
);


CREATE TABLE ArtikliNarudzbe (
    ID_Narudzba INT FOREIGN KEY REFERENCES Narudzba(ID_Narudzba),
    ID_Artikal INT FOREIGN KEY REFERENCES Artikal(ID_Artikal),
    Kolicina INT NOT NULL,
    PRIMARY KEY (ID_Narudzba, ID_Artikal)
);

CREATE TABLE Skladiste (
    ID_Stavka INT PRIMARY KEY IDENTITY,
    OIB_Dobavljac CHAR(9) FOREIGN KEY REFERENCES Dobavljac(OIB),
    ID_Artikal INT FOREIGN KEY REFERENCES Artikal(ID_Artikal),
    Cijena DECIMAL(10, 2) NOT NULL,
    DatumSkladistenja DATE NOT NULL
);

CREATE TABLE StavkeZaNarudzbu (
    ID_Stavka INT PRIMARY KEY IDENTITY,
    ID_Artikal INT FOREIGN KEY REFERENCES Artikal(ID_Artikal),
	Kolicina INT NOT NULL,
	DatumDodavanja DATE NOT NULL
);

-- PODACI
-- Dodavnaje Firma
INSERT INTO	Firma (OIB, Naziv, Vlasnik, PostanskiBroj, Grad)
VALUES ('123456789', 'MK Computer Shop d.o.o', 'Martin Kovač', '80240', 'Tomislavgrad')

-- Dodavanje Klijenata
INSERT INTO Klijent (OIB, Naziv, Telefon, Email)
VALUES 
    ('123456789', 'Trgovina d.o.o.', '+385987654321', 'info@abctrgovina.ba'),
    ('234567890', 'XYZ Konzalting', '+385955443322', 'info@xyzkonzalting.com'),
    ('345678901', 'Kreativna Agencija Kreativko', '+385912345678', 'office@kreativko.ba'),
	('019983215', 'Boris Ćorić', '+385981234567', 'boris.coric@gmail.com'),
    ('029871234', 'Petar Kovač', '+385989876543', 'petar.kovac@gmail.com'),
    ('039962345', 'Mario Antunović', '+385997654321', 'mario.antunovic@gmail.com'),
    ('016537321', 'Baković d.o.o', '+385954644531', 'bakovic.tg@gmail.com');

-- Dodavanje Zaposlenika
INSERT INTO Zaposlenik (OIB, Ime, Prezime, Telefon, Email)
VALUES 
    ('123456789', 'Ana', 'Horvat', '+385981236567', 'ana.horvat@example.com'),
    ('234567890', 'Ivan', 'Kovač', '+385982873443', 'ivan.kovac@example.com'),
    ('345678901', 'Marina', 'Radić', '+38595765320', 'marina.radic@example.com');

INSERT INTO Artikal (Naziv, Model, Proizvodjac, Tip)
VALUES 
    -- Grafičke kartice
    ('AMD Radeon RX 6900 XT', 'Radeon RX 6900 XT', 'AMD', 'Grafička kartica'),
    ('NVIDIA GeForce RTX 3070', 'RTX 3070', 'NVIDIA', 'Grafička kartica'),
    ('MSI GeForce GTX 1660 Super', 'GTX 1660 Super', 'MSI', 'Grafička kartica'),
    
    -- Procesori
    ('Intel Core i9-11900K', 'Core i9-11900K', 'Intel', 'Procesor'),
    ('AMD Ryzen 9 5900X', 'Ryzen 9 5900X', 'AMD', 'Procesor'),
    ('Intel Core i5-11600K', 'Core i5-11600K', 'Intel', 'Procesor'),
    ('AMD Ryzen 7 5800X', 'Ryzen 7 5800X', 'AMD', 'Procesor'),
    ('Intel Core i7-11700K', 'Core i7-11700K', 'Intel', 'Procesor'),
    ('AMD Ryzen 5 5600X', 'Ryzen 5 5600X', 'AMD', 'Procesor'),

    -- RAM memorija
    ('G.Skill Trident Z RGB 32GB (2x16GB) DDR4 3600MHz', 'Trident Z RGB', 'G.Skill', 'RAM'),
    ('Crucial Ballistix 32GB (2x16GB) DDR4 3200MHz', 'Ballistix', 'Crucial', 'RAM'),
    ('Corsair Vengeance RGB Pro 16GB (2x8GB) DDR4 3200MHz', 'Vengeance RGB Pro', 'Corsair', 'RAM'),
    
    -- SSD diskovi
    ('Samsung 980 PRO 1TB NVMe M.2 SSD', '980 PRO', 'Samsung', 'SSD'),
    ('WD Blue SN550 500GB NVMe M.2 SSD', 'Blue SN550', 'Western Digital', 'SSD'),
    ('Crucial MX500 1TB SATA 2.5" SSD', 'MX500', 'Crucial', 'SSD'),
    
    -- HDD diskovi
    ('Seagate IronWolf 4TB 3.5" SATA HDD', 'IronWolf', 'Seagate', 'HDD'),
    ('WD Red Plus 6TB 3.5" SATA HDD', 'Red Plus', 'Western Digital', 'HDD'),
    ('Toshiba P300 1TB 3.5" SATA HDD', 'P300', 'Toshiba', 'HDD'),
    
    -- Matične ploče
    ('ASRock B550 Steel Legend', 'B550 Steel Legend', 'ASRock', 'Matična ploča'),
    ('Gigabyte X570 Aorus Elite', 'X570 Aorus Elite', 'Gigabyte', 'Matična ploča'),
    ('MSI B450 Tomahawk Max', 'B450 Tomahawk Max', 'MSI', 'Matična ploča'),
    
    -- Hladnjaci
    ('Noctua NH-D15', 'NH-D15', 'Noctua', 'Hladnjak'),
    ('Cooler Master Hyper 212 Black Edition', 'Hyper 212 Black Edition', 'Cooler Master', 'Hladnjak'),
    ('be quiet! Dark Rock Pro 4', 'Dark Rock Pro 4', 'be quiet!', 'Hladnjak'),
    
    -- Napajanja
    ('Seasonic Focus GX-850', 'Focus GX-850', 'Seasonic', 'Napajanje'),
    ('EVGA SuperNOVA 750 G3', 'SuperNOVA 750 G3', 'EVGA', 'Napajanje'),
    ('Corsair RM850x', 'RM850x', 'Corsair', 'Napajanje'),
    
    -- Kućišta
    ('NZXT H510', 'H510', 'NZXT','Kućište'),
    ('Phanteks Eclipse P400A', 'Eclipse P400A', 'Phanteks', 'Kućište'),
    ('Fractal Design Meshify C', 'Meshify C', 'Fractal Design', 'Kućište'),
    
    -- Miševi
    ('Razer DeathAdder V2', 'DeathAdder V2', 'Razer', 'Miš'),
    ('Logitech G305 Lightspeed', 'G305 Lightspeed', 'Logitech', 'Miš'),
    ('SteelSeries Rival 3', 'Rival 3', 'SteelSeries', 'Miš'),
    
    -- Tipkovnice
    ('Corsair K95 RGB Platinum XT', 'K95 RGB Platinum XT', 'Corsair', 'Tipkovnica'),
    ('HyperX Alloy Origins Core', 'Alloy Origins Core', 'HyperX', 'Tipkovnica'),
    ('Ducky One 2 Mini', 'One 2 Mini', 'Ducky', 'Tipkovnica'),
    
    -- Slušalice
    ('Audio-Technica ATH-M50X', 'ATH-M50X', 'Audio-Technica', 'Slušalice'),
    ('Sennheiser HD 6'Dell S2721DGF'60 S', 'HD 660 S', 'Sennheiser', 'Slušalice'),
    ('Beyerdynamic DT 990 Pro', 'DT 990 Pro', 'Beyerdynamic', 'Slušalice'),
    
    -- Monitori
    (, 'S2721DGF', 'Dell', 'Monitor'),
    ('LG 27GN950-B', '27GN950-B', 'LG', 'Monitor'),
    ('ASUS TUF Gaming VG27AQ', 'VG27AQ', 'ASUS', 'Monitor'),
    
    -- Web kamere
    ('Logitech BRIO Ultra HD Pro', 'BRIO Ultra HD Pro', 'Logitech', 'Web kamera'),
    ('Razer Kiyo Pro', 'Kiyo Pro', 'Razer', 'Web kamera'),
    ('Microsoft LifeCam Studio', 'LifeCam Studio', 'Microsoft', 'Web kamera');

INSERT INTO Dobavljac (OIB, Naziv, Vlasnik, PostanskiBroj, Grad)
VALUES 
    ('123456789', 'TechGlob', 'Marko Petrović', '10000', 'Zagreb'),
    ('234567890', 'ComputerWarehouse', 'Ivan Anić', '21000', 'Split'),
    ('345678901', 'TechPro', 'Petar Jakelić', '31000', 'Osijek');

INSERT INTO Skladiste (OIB_Dobavljac, ID_Artikal, Cijena, DatumSkladistenja)
VALUES 
    ('123456789', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Razer DeathAdder V2'), 59.99, '2024-05-28'),
    ('234567890', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Corsair Vengeance RGB Pro 16GB (2x8GB) DDR4 3200MHz'), 99.99, '2024-05-29'),
    ('345678901', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'ASRock B550 Steel Legend'), 129.99, '2024-05-30'),
    ('123456789', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Samsung 980 PRO 1TB NVMe M.2 SSD'), 159.99, '2024-05-31'),
    ('234567890', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'SteelSeries Rival 3'), 39.99, '2024-06-01'),
    ('345678901', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Gigabyte X570 Aorus Elite'), 199.99, '2024-06-02'),
    ('123456789', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'WD Red Plus 6TB 3.5" SATA HDD'), 199.99, '2024-06-03'),
    ('234567890', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Phanteks Eclipse P400A'), 79.99, '2024-06-04'),
    ('345678901', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Logitech BRIO Ultra HD Pro'), 199.99, '2024-06-05'),
    ('123456789', (SELECT ID_Artikal FROM Artikal WHERE Naziv = 'Crucial MX500 1TB SATA 2.5" SSD'), 89.99, '2024-06-06');


-- UPITI I RADNJE NA BAZI

-- Kreiranje narudzbe
GO
CREATE PROCEDURE dbo.KreirajNarudzbu
(
	@OIB_Zaposlenik CHAR(9),
    @OIB_Klijent CHAR(9),
	@DatumIsporuke DATE
)
AS
BEGIN
	DECLARE @DatumZaprimanja DATE;
    SET @DatumZaprimanja = GETDATE();

    INSERT INTO Narudzba (OIB_Zaposlenik, OIB_Klijent, DatumZaprimanja, DatumIsporuke)
	VALUES (@OIB_Zaposlenik, @OIB_Klijent, @DatumZaprimanja, @DatumIsporuke)
END;
GO

--EXEC KreirajNarudzbu '123456789', '016537321', '2024-06-10'

-- Dobivanje svih narudžbi za određen datum
GO
CREATE FUNCTION dbo.NarudzbeZaDatum (@datum DATE)
RETURNS TABLE
AS
RETURN (
	SELECT * FROM Narudzba
	WHERE DatumZaprimanja = @datum
);
GO

-- Dobivanje svih narudžbi za određen datum
GO
CREATE FUNCTION dbo.NarudzbeUIntervalu 
(
	@datumOd DATE,
	@datumDo DATE
)
RETURNS TABLE
AS
RETURN (
	SELECT * FROM Narudzba
	WHERE DatumZaprimanja BETWEEN @datumOd AND @datumDo
);
GO

-- Dohvati artikle po tipu
GO
CREATE FUNCTION ArtikliPoTipu
(
	@Tip VARCHAR(40)
)
RETURNS TABLE
AS
RETURN (
	SELECT * FROM Artikal
	WHERE Tip = @Tip
);
GO

-- Dodavanje artikla na narudzbu
GO
CREATE PROCEDURE dodajNaNarudzbu
(
    @ID_Narudzba INT,
    @NazivArtikla VARCHAR(80),
    @Kolicina INT
)
AS
BEGIN
    DECLARE @ID_Artikal INT;

    BEGIN TRANSACTION;
    SAVE TRANSACTION noArtikal;

    SELECT @ID_Artikal = ID_Artikal
    FROM Artikal
    WHERE Naziv = @NazivArtikla;

    IF @ID_Artikal IS NOT NULL
    BEGIN
        INSERT INTO ArtikliNarudzbe (ID_Narudzba, ID_Artikal, Kolicina)
        VALUES (@ID_Narudzba, @ID_Artikal, @Kolicina);
        
        COMMIT TRANSACTION;
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION noArtikal;
        
        PRINT 'Artikal s nazivom ' + @NazivArtikla + ' ne postoji.';
    END;
END;

-- Dodavanje razlike tablica ArtikliNarudzbe i Skladiste kada se doda novi artikal u ArtikliNarudzbe
GO
CREATE TRIGGER trgUpdateStavkeZaNarudzbu
ON ArtikliNarudzbe
AFTER INSERT
AS
BEGIN
	INSERT INTO StavkeZaNarudzbu (ID_Artikal, Kolicina, DatumDodavanja)
	SELECT i.ID_Artikal, i.Kolicina, GETDATE()
	FROM INSERTED i
	LEFT JOIN Skladiste s ON i.ID_Artikal = s.ID_Artikal
	WHERE s.ID_Artikal IS NULL
END;
GO

-- izbrise stavke ArtikliNarudzbe s ID-em narudzbe koja se izbrisala
GO
CREATE TRIGGER trgDeleteArtikliNarudzbe
ON Narudzba
AFTER DELETE
AS
BEGIN
	DELETE FROM ArtikliNarudzbe
	WHERE ID_Narudzba IN (SELECT ID_Narudzba FROM deleted);
END;
GO

-- trigger koji daje error kada se izmjeni artikal koji se nalazi u StavkeZaNarudzbu
GO
CREATE TRIGGER trgUpdatedArtikal
ON Artikal
AFTER UPDATE
AS
BEGIN
	IF UPDATE(Naziv) OR UPDATE(Model)
		BEGIN
		IF EXISTS (
			SELECT 1
			FROM StavkeZaNarudzbu s JOIN INSERTED i
			ON s.ID_Artikal = i.ID_Artikal
			WHERE s.ID_Artikal = i.ID_Artikal
		)
		BEGIN
			RAISERROR('Artikal se nalazi u tablici StavkeZaNarudzbu', 16, 1)
		END;
	END;
END;
GO
