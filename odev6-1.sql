-- ALTER TABLE gercekmusteriler DROP CONSTRAINT fk_GerekMusteriId_Musteriler_Id;
-- ALTER TABLE tuzelmusteriler DROP CONSTRAINT fk_TuzelMusteriId_Musteriler_Id;
-- ALTER TABLE adresler DROP CONSTRAINT fk_Adresler_Musteriler_Id;
-- ALTER TABLE bilancolar DROP CONSTRAINT fk_Bilancolar_Musteriler_Id;
-- ALTER TABLE ticari_faliyetler DROP CONSTRAINT fk_ticarifaliyetler_gercekmusteriler;
-- ALTER TABLE Musteriler DROP CONSTRAINT fk_musteriler_kanalid_kanallarid;

DROP TABLE IF EXISTS Musteriler;
DROP TABLE IF EXISTS GercekMusteriler;
DROP TABLE IF EXISTS TuzelMusteriler;
DROP TABLE IF EXISTS adresler;
DROP TABLE IF EXISTS bilancolar;
DROP TABLE IF EXISTS ticari_faliyetler;
DROP TABLE IF EXISTS kanallar;


CREATE TABLE kanallar(
	id int NOT NULL,
	ad varchar(50) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Musteriler(
	id int NOT NULL,
	MüsteriNo varchar(10) UNIQUE NOT NULL,
	KanalId int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_musteriler_kanalid_kanallarid FOREIGN KEY (KanalId)
		REFERENCES kanallar(id)
);

CREATE TABLE GercekMusteriler(
	MusteriId int NOT NULL,
	Ad varchar(50) NOT NULL,
	Soyad varchar(50) NOT NULL,
	TcKimlikNo varchar(11) UNIQUE NOT NULL,
	PRIMARY KEY (MusteriId),
	CONSTRAINT fk_GerekMusteriId_Musteriler_Id FOREIGN KEY (musteriid)
		REFERENCES Musteriler(id)
);

CREATE TABLE TuzelMusteriler(
	MusteriId int NOT NULL,
	Unvan varchar(50) NOT NULL,
	VergiNo varchar(10) NOT NULL,
	PRIMARY KEY (MusteriId),
	CONSTRAINT fk_TuzelMusteriId_Musteriler_Id FOREIGN KEY (MusteriId)
		REFERENCES Musteriler(Id)
);

CREATE TABLE adresler(
	id int NOT NULL,
	MusteriId int NOT NULL,
	AdresDetay varchar(250) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_Adresler_Musteriler_Id FOREIGN KEY (MusteriId)
		REFERENCES Musteriler(Id)
	
);

CREATE TABLE bilancolar(
	id int NOT NULL,
	MusteriId int NOT NULL,
	Tarih date NOT NULL,
	Tutar money NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_Bilancolar_Musteriler_Id FOREIGN key (MusteriId)
		REFERENCES Musteriler(Id)
);

CREATE TABLE ticari_faliyetler(
	id int NOT NULL,
	gercek_musteri_id int UNIQUE NOT NULL,
	baslangıc_tarih date NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT fk_ticarifaliyetler_gercekmusteriler FOREIGN KEY(gercek_musteri_id)
		REFERENCES GercekMusteriler(MusteriId)
);


