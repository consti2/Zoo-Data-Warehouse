CREATE TABLE Tier_Gattung(
Tier_Gattung_ID INTEGER NOT NULL,
Beschreibung TEXT(50),
PRIMARY KEY (Tier_Gattung_ID AUTOINCREMENT)
);

CREATE TABLE Person(
Person_ID INTEGER NOT NULL,
Anrede TEXT(4),
Titel TEXT(10),
Geschlecht TEXT(10),
Vorname TEXT(50),
Nachname TEXT(50),
Straße TEXT(10),
Hausnummer TEXT(50),
PLZ TEXT(10),
Ort TEXT(50),
Land TEXT(50),
[Telefon Festnetz] TEXT(15),
[Telefon Mobil] TEXT(15),
Faxnummer TEXT(50),
[E-Mail] TEXT(64),
Bemerkungen TEXT(255),
PRIMARY KEY (Person_ID AUTOINCREMENT)
);

CREATE TABLE Besucher_Kategorie(
Besucher_Kategorie_ID INTEGER NOT NULL,
Bezeichnung TEXT(50),
Beschreibung TEXT(50),
PRIMARY KEY (Besucher_Kategorie_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Art(
Tier_Art_ID INTEGER NOT NULL,
Tier_Gattung_ID INTEGER NOT NULL,
Beschreibung TEXT(255),
FOREIGN KEY (Tier_Gattung_ID) REFERENCES Tier_Gattung(Tier_Gattung_ID),
PRIMARY KEY (Tier_Art_ID AUTOINCREMENT)
);

CREATE TABLE Gehege_Kategorie(
Gehege_Kategorie_ID INTEGER NOT NULL,
Bezeichnung TEXT(255),
PRIMARY KEY (Gehege_Kategorie_ID AUTOINCREMENT)
);

CREATE TABLE Mitarbeiter(
Mitarbeiternummer INTEGER NOT NULL,
[Beschäftigung seit] Numeric,
Person_ID INTEGER NOT NULL,
Geburtsdatum Numeric,
Geburtsort TEXT(50),
Nationalität TEXT(50),
[soz. Status] TEXT(15),
Lohnsteuerklasse INTEGER,
FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
PRIMARY KEY (Mitarbeiternummer AUTOINCREMENT)
);

CREATE TABLE Futter_Arten(
Futter_Arten_ID INTEGER NOT NULL,
Beschreibung TEXT(255),
PRIMARY KEY (Futter_Arten_ID AUTOINCREMENT)
);

CREATE TABLE Besucher(
Besucher_ID INTEGER NOT NULL,
Person_ID INTEGER NOT NULL,
Besucher_Kategorie_ID INTEGER NOT NULL,
Bankverbindung TEXT(50),
FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
FOREIGN KEY (Besucher_Kategorie_ID) REFERENCES Besucher_Kategorie(Besucher_Kategorie_ID),
PRIMARY KEY (Besucher_ID AUTOINCREMENT)
);

CREATE TABLE Gebäude(
Gebäude_ID INTEGER NOT NULL,
Gebäudename TEXT(50),
Himmelsrichtung TEXT(50),
Beschreibung TEXT(255),
PRIMARY KEY (Gebäude_ID AUTOINCREMENT)
);

CREATE TABLE Lieferant(
Lieferant_ID INTEGER NOT NULL,
Person_ID INTEGER NOT NULL,
Firmenname TEXT(50),
Vorname_ASP TEXT(50),
Nachname_ASP TEXT(50),
[für Zoo tätig seit] Numeric,
Bankverbindung TEXT(25),
Umsatzsteuernummer TEXT(25),
FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
PRIMARY KEY (Lieferant_ID AUTOINCREMENT)
);

CREATE TABLE Tier(
Tier_ID INTEGER NOT NULL,
Tier_Art_ID INTEGER NOT NULL,
Tiername TEXT(50),
Geschlecht TEXT(10),
Groesse TEXT(2),
Groesse_Einheit TEXT(50),
Gewicht TEXT(2),
Gewicht_Einheit TEXT(50),
Geburtsdatum Numeric,
Sterbedatum Numeric,
Herkunft TEXT(50),
[im Zoo seit] Numeric,
[im Zoo geboren] Numeric,
Bemerkungen TEXT(255),
FOREIGN KEY (Tier_Art_ID) REFERENCES Tier_Art(Tier_Art_ID),
PRIMARY KEY (Tier_ID AUTOINCREMENT)
);

CREATE TABLE Tierpfleger(
Tierpfleger_ID INTEGER NOT NULL,
Mitarbeiternummer INTEGER NOT NULL,
FOREIGN KEY (Mitarbeiternummer) REFERENCES Mitarbeiter(Mitarbeiternummer),
PRIMARY KEY (Tierpfleger_ID AUTOINCREMENT)
);

CREATE TABLE Externe_ZooWildparks(
Externe_ZooPark_ID INTEGER NOT NULL,
Name TEXT(50),
Straße TEXT(50),
Hausnummer TEXT(10),
PLZ TEXT(10),
Ort TEXT(50),
Vorname_ASP TEXT(50),
Nachname_ASP TEXT(50),
Telephone TEXT(15),
[E-Mail] TEXT(64),
PRIMARY KEY (Externe_ZooPark_ID AUTOINCREMENT)
);

CREATE TABLE Gehege(
Gehege_ID INTEGER NOT NULL,
[Name des Geheges] TEXT(50),
Gehege_Kategorie_ID INTEGER NOT NULL,
Groesse Numeric,
Einheit TEXT(2),
Baujahr Numeric,
[Feld für weitere Bemerkungen] TEXT(255),
FOREIGN KEY (Gehege_Kategorie_ID) REFERENCES Gehege_Kategorie(Gehege_Kategorie_ID),
PRIMARY KEY (Gehege_ID AUTOINCREMENT)
);

CREATE TABLE Externe_Tierarzt(
Externe_Tierarzt_ID INTEGER NOT NULL,
Person_ID INTEGER NOT NULL,
Praxisname TEXT(50),
Vorname_ASP TEXT(50),
NAchname_ASP TEXT(50),
[für Zoo tätig seit] TEXT(50),
Bankverbindung TEXT(50),
FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
PRIMARY KEY (Externe_Tierarzt_ID AUTOINCREMENT)
);

CREATE TABLE Futtermischung(
Futtermischung_ID INTEGER NOT NULL,
Notiz TEXT(255),
PRIMARY KEY (Futtermischung_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Krankenakte(
Tier_Krankenakte_ID INTEGER NOT NULL,
Behandlungsgrund TEXT(255),
Behandlungsdatum Numeric,
Befund TEXT(255),
[Meldepflicht?] TEXT(50),
Medikation TEXT(50),
[Bemerkungen zur Behandlung] TEXT(255),
[Datum der abgeschlossenen Behandlung] Numeric,
PRIMARY KEY (Tier_Krankenakte_ID AUTOINCREMENT)
);

CREATE TABLE Besucher_Patenschaft_Art(
Besucher_Paten_Art_ID INTEGER NOT NULL,
Besucher_ID INTEGER NOT NULL,
Tier_Art_ID INTEGER NOT NULL,
Datum Numeric,
Notiz TEXT(50),
FOREIGN KEY (Besucher_ID) REFERENCES Besucher(Besucher_ID),
FOREIGN KEY (Tier_Art_ID) REFERENCES Tier_Art(Tier_Art_ID),
PRIMARY KEY (Besucher_Paten_Art_ID AUTOINCREMENT)
);

CREATE TABLE Besucher_Patenschaft_Tier(
Besucher_Paten_Tier_ID INTEGER NOT NULL,
Besucher_ID INTEGER NOT NULL,
Tier_Gattung_ID INTEGER NOT NULL,
Datum Numeric(50),
Notiz TEXT(255),
FOREIGN KEY (Besucher_ID) REFERENCES Besucher(Besucher_ID),
FOREIGN KEY (Tier_Gattung_ID) REFERENCES Tier_Gattung(Tier_Gattung_ID),
PRIMARY KEY (Besucher_Paten_Tier_ID AUTOINCREMENT)
);

CREATE TABLE Rundweg(
Rundweg_ID INTEGER NOT NULL,
Wegbezeichnung TEXT(255),
[Länge in Meter] Numeric,
[Gehdauer in Minuten] Numeric,
Barrierefreiheit TEXT(50),
PRIMARY KEY (Rundweg_ID AUTOINCREMENT)
);

CREATE TABLE Futterlager(
Futterlager_ID INTEGER NOT NULL,
Gebäude_ID INTEGER NOT NULL,
Beschreibung TEXT(255),
FOREIGN KEY (Gebäude_ID) REFERENCES Gebäude(Gebäude_ID),
PRIMARY KEY (Futterlager_ID AUTOINCREMENT)
);

CREATE TABLE Futter(
Futter_ID INTEGER NOT NULL,
Futter_Arten_ID INTEGER NOT NULL,
Meldebestände TEXT(50),
Einheit TEXT(10),
FOREIGN KEY (Futter_Arten_ID) REFERENCES Futter_Arten(Futter_Arten_ID),
PRIMARY KEY (Futter_ID AUTOINCREMENT)
);

CREATE TABLE Futter_Einkauf(
Futter_Einkauf_ID INTEGER NOT NULL,
Lieferant_ID INTEGER NOT NULL,
MwSt_Satz TEXT(20),
Orderdatum Numeric,
Lieferdatum Numeric,
FOREIGN KEY (Lieferant_ID) REFERENCES Lieferant(Lieferant_ID),
PRIMARY KEY (Futter_Einkauf_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Verwandschaft(
Tier_Verwandschaft_ID INTEGER NOT NULL,
[Tier_ID_(Kind)] INTEGER NOT NULL,
[Tier_ID_(Mutter)] INTEGER NOT NULL,
[Tier_ID_(Vater)] INTEGER NOT NULL,
Notiz TEXT(255),
FOREIGN KEY ([Tier_ID_(Kind)]) REFERENCES Tier([Tier_ID_(Kind)]),
FOREIGN KEY ([Tier_ID_(Mutter)]) REFERENCES Tier([Tier_ID_(Mutter)]),
FOREIGN KEY ([Tier_ID_(Vater)]) REFERENCES Tier([Tier_ID_(Vater)]),
PRIMARY KEY (Tier_Verwandschaft_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Betreuung(
Tier_Betreuung_ID INTEGER NOT NULL,
Tierpfleger_ID INTEGER NOT NULL,
Tier_ID INTEGER NOT NULL,
Beschreibung_Aufgaben TEXT(50),
FOREIGN KEY (Tierpfleger_ID) REFERENCES Tierpfleger(Tierpfleger_ID),
FOREIGN KEY (Tier_ID) REFERENCES Tier(Tier_ID),
PRIMARY KEY (Tier_Betreuung_ID AUTOINCREMENT)
);

CREATE TABLE Tierpfleger_Spezializierung(
Tierpfleger_Spez_ID INTEGER NOT NULL,
Tierpfleger_ID INTEGER NOT NULL,
Tier_Art_ID INTEGER NOT NULL,
Notiz TEXT(255),
FOREIGN KEY (Tierpfleger_ID) REFERENCES Tierpfleger(Tierpfleger_ID),
FOREIGN KEY (Tier_Art_ID) REFERENCES Tier_Art(Tier_Art_ID),
PRIMARY KEY (Tierpfleger_Spez_ID AUTOINCREMENT)
);

CREATE TABLE Tierpfleger_Vertretung(
Tierpfleger_Vertret_ID INTEGER NOT NULL,
[Tierpfleger_ID_(Vertretende)] INTEGER NOT NULL,
[Tierpfleger_ID_(Vertreter)] INTEGER NOT NULL,
Grund TEXT(20),
FOREIGN KEY ([Tierpfleger_ID_(Vertretende)]) REFERENCES Tierpfleger([Tierpfleger_ID_(Vertretende)]),
FOREIGN KEY ([Tierpfleger_ID_(Vertreter)]) REFERENCES Tierpfleger([Tierpfleger_ID_(Vertreter)]),
PRIMARY KEY (Tierpfleger_Vertret_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Unverträglichkeiten(
Tier_Unverträg_ID INTEGER NOT NULL,
[Tier_ID_(Aggressor)] INTEGER NOT NULL,
[Tier_ID_(Leidende)] INTEGER NOT NULL,
Notiz TEXT(255),
FOREIGN KEY ([Tier_ID_(Aggressor)]) REFERENCES Tier([Tier_ID_(Aggressor)]),
FOREIGN KEY ([Tier_ID_(Leidende)]) REFERENCES Tier([Tier_ID_(Leidende)]),
PRIMARY KEY (Tier_Unverträg_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Lebenslauf(
Tier_Lebenslauf_ID INTEGER NOT NULL,
Tier_ID INTEGER NOT NULL,
Externe_ZooPark_ID INTEGER NOT NULL,
Von Numeric,
Bis Numeric,
FOREIGN KEY (Tier_ID) REFERENCES Tier(Tier_ID),
FOREIGN KEY (Externe_ZooPark_ID) REFERENCES Externe_ZooWildparks(Externe_ZooPark_ID),
PRIMARY KEY (Tier_Lebenslauf_ID AUTOINCREMENT)
);

CREATE TABLE Gehegen_Lokalisation(
Gehegen_Lok_ID INTEGER NOT NULL,
Gehege_ID INTEGER NOT NULL,
Gebäude_ID INTEGER NOT NULL,
Position TEXT(50),
FOREIGN KEY (Gehege_ID) REFERENCES Gehege(Gehege_ID),
FOREIGN KEY (Gebäude_ID) REFERENCES Gebäude(Gebäude_ID),
PRIMARY KEY (Gehegen_Lok_ID AUTOINCREMENT)
);

CREATE TABLE Tierarzt_Spezializierung(
Tierarzt_Spez_ID INTEGER NOT NULL,
Externe_Tierarzt_ID INTEGER NOT NULL,
Tier_Art_ID INTEGER NOT NULL,
Notiz TEXT(255),
FOREIGN KEY (Externe_Tierarzt_ID) REFERENCES Externe_Tierarzt(Externe_Tierarzt_ID),
FOREIGN KEY (Tier_Art_ID) REFERENCES Tier_Art(Tier_Art_ID),
PRIMARY KEY (Tierarzt_Spez_ID AUTOINCREMENT)
);

CREATE TABLE Tierarzt_Vertretung(
Tierarzt_Vertretung_ID INTEGER NOT NULL,
[Externe_Tierarzt_ID_(Vertretende)] INTEGER NOT NULL,
[Externe_Tierarzt_ID_(Vertreter)] INTEGER NOT NULL,
Grund TEXT(20),
FOREIGN KEY ([Externe_Tierarzt_ID_(Vertretende)]) REFERENCES Externe_Tierarzt([Externe_Tierarzt_ID_(Vertretende)]),
FOREIGN KEY ([Externe_Tierarzt_ID_(Vertreter)]) REFERENCES Externe_Tierarzt([Externe_Tierarzt_ID_(Vertreter)]),
PRIMARY KEY (Tierarzt_Vertretung_ID AUTOINCREMENT)
);

CREATE TABLE Fütterung(
Fütterung_ID INTEGER NOT NULL,
Tier_ID INTEGER NOT NULL,
Futtermischung_ID INTEGER NOT NULL,
Datum Numeric,
Uhrzeit Numeric,
FOREIGN KEY (Tier_ID) REFERENCES Tier(Tier_ID),
FOREIGN KEY (Futtermischung_ID) REFERENCES Futtermischung(Futtermischung_ID),
PRIMARY KEY (Fütterung_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Information_Art(
Tier_Info_Art_ID INTEGER NOT NULL,
Tier_Art_ID INTEGER NOT NULL,
Info TEXT(255),
Beschreibung TEXT(50),
FOREIGN KEY (Tier_Art_ID) REFERENCES Tier_Art(Tier_Art_ID),
PRIMARY KEY (Tier_Info_Art_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Information_Gattung(
Tier_Info_Gattung_ID INTEGER NOT NULL,
Tier_Gattung_ID INTEGER NOT NULL,
Info TEXT(255),
Beschreibung TEXT(50),
FOREIGN KEY (Tier_Gattung_ID) REFERENCES Tier_Gattung(Tier_Gattung_ID),
PRIMARY KEY (Tier_Info_Gattung_ID AUTOINCREMENT)
);

CREATE TABLE Tierarzt_Betreuung(
Tierarzt_Betreuung_ID INTEGER NOT NULL,
Externe_Tierarzt_ID INTEGER NOT NULL,
Tier_ID INTEGER NOT NULL,
Tier_Krankenakte_ID INTEGER NOT NULL,
FOREIGN KEY (Externe_Tierarzt_ID) REFERENCES Externe_Tierarzt(Externe_Tierarzt_ID),
FOREIGN KEY (Tier_ID) REFERENCES Tier(Tier_ID),
FOREIGN KEY (Tier_Krankenakte_ID) REFERENCES Tier_Krankenakte(Tier_Krankenakte_ID),
PRIMARY KEY (Tierarzt_Betreuung_ID AUTOINCREMENT)
);

CREATE TABLE Spende_PatenArt_Einmalig(
Spende_PatenArt_Ein_ID INTEGER NOT NULL,
Besucher_Paten_Art_ID INTEGER NOT NULL,
Betrag Numeric,
Waehrung TEXT(20),
Datum Numeric,
FOREIGN KEY (Besucher_Paten_Art_ID) REFERENCES Besucher_Patenschaft_Art(Besucher_Paten_Art_ID),
PRIMARY KEY (Spende_PatenArt_Ein_ID AUTOINCREMENT)
);

CREATE TABLE Spende_PatenTier_Einmalig(
Spende_PatenTier_Ein_ID INTEGER NOT NULL,
Besucher_Paten_Tier_ID INTEGER NOT NULL,
Betrag Numeric,
Waehrung TEXT(20),
Datum Numeric,
FOREIGN KEY (Besucher_Paten_Tier_ID) REFERENCES Besucher_Patenschaft_Tier(Besucher_Paten_Tier_ID),
PRIMARY KEY (Spende_PatenTier_Ein_ID AUTOINCREMENT)
);

CREATE TABLE Rundweg_Lokalisation(
Rundweg_Lok_ID INTEGER NOT NULL,
Rundweg_ID INTEGER NOT NULL,
[Gehege_ID_(start)] INTEGER NOT NULL,
[Gehege_ID_(ende)] INTEGER NOT NULL,
Position TEXT(50),
FOREIGN KEY (Rundweg_ID) REFERENCES Rundweg(Rundweg_ID),
FOREIGN KEY ([Gehege_ID_(start)]) REFERENCES Gehege([Gehege_ID_(start)]),
FOREIGN KEY ([Gehege_ID_(ende)]) REFERENCES Gehege([Gehege_ID_(ende)]),
PRIMARY KEY (Rundweg_Lok_ID AUTOINCREMENT)
);

CREATE TABLE Rundweg_Information(
Rundweg_Info_ID INTEGER NOT NULL,
Rundweg_ID INTEGER NOT NULL,
Info TEXT(50),
Beschreibung TEXT(255),
FOREIGN KEY (Rundweg_ID) REFERENCES Rundweg(Rundweg_ID),
PRIMARY KEY (Rundweg_Info_ID AUTOINCREMENT)
);

CREATE TABLE Spende_PatenArt_Periodisch(
Spende_PatenArt_Per_ID INTEGER NOT NULL,
Besucher_Paten_Art_ID INTEGER NOT NULL,
Betrag Numeric,
Waehrung TEXT(50),
Datum Numeric,
Wiederholungszeitraum TEXT(50),
FOREIGN KEY (Besucher_Paten_Art_ID) REFERENCES Besucher_Patenschaft_Art(Besucher_Paten_Art_ID),
PRIMARY KEY (Spende_PatenArt_Per_ID AUTOINCREMENT)
);

CREATE TABLE Spende_PatenTier_Periodisch(
Spende_PatenTier_Per_ID INTEGER NOT NULL,
Besucher_Paten_Tier_ID INTEGER NOT NULL,
Betrag Numeric,
Waehrung TEXT(20),
Datum Numeric,
Wiederholungszeitraum Numeric,
FOREIGN KEY (Besucher_Paten_Tier_ID) REFERENCES Besucher_Patenschaft_Tier(Besucher_Paten_Tier_ID),
PRIMARY KEY (Spende_PatenTier_Per_ID AUTOINCREMENT)
);

CREATE TABLE Futterlagerbestand(
Futterlagerbestand_ID INTEGER NOT NULL,
Futterlager_ID INTEGER NOT NULL,
Futter_ID INTEGER NOT NULL,
Menge INTEGER,
Zugang_Abgang TEXT(50),
Menge_Einheit TEXT(20),
Datum Numeric,
Uhrzeit Numeric,
FOREIGN KEY (Futterlager_ID) REFERENCES Futterlager(Futterlager_ID),
FOREIGN KEY (Futter_ID) REFERENCES Futter(Futter_ID),
PRIMARY KEY (Futterlagerbestand_ID AUTOINCREMENT)
);

CREATE TABLE Futtermischung_Position(
Futtermischung_Pos_ID INTEGER NOT NULL,
Futtermischung_ID INTEGER NOT NULL,
Futter_ID INTEGER NOT NULL,
Menge Numeric,
Menge_Einheit TEXT(20),
FOREIGN KEY (Futtermischung_ID) REFERENCES Futtermischung(Futtermischung_ID),
FOREIGN KEY (Futter_ID) REFERENCES Futter(Futter_ID),
PRIMARY KEY (Futtermischung_Pos_ID AUTOINCREMENT)
);

CREATE TABLE Tier_Lokalisation(
Tier_Lok_ID INTEGER NOT NULL,
Tier_ID INTEGER NOT NULL,
Gehege_ID INTEGER NOT NULL,
Von TEXT(50),
Bis TEXT(50),
Notiz TEXT(255),
FOREIGN KEY (Tier_ID) REFERENCES Tier(Tier_ID),
FOREIGN KEY (Gehege_ID) REFERENCES Gehege(Gehege_ID),
PRIMARY KEY (Tier_Lok_ID AUTOINCREMENT)
);

CREATE TABLE ref_Gewicht(
Einheit TEXT(2),
Einheit_Gewicht_ID INTEGER NOT NULL,
PRIMARY KEY (Einheit_Gewicht_ID )
);

CREATE TABLE ref_Groesse(
Einheit_Groesse_ID INTEGER NOT NULL,
Einheit TEXT(2),
PRIMARY KEY (Einheit_Groesse_ID AUTOINCREMENT)
);

CREATE TABLE ref_Lagereinheit_Futter(
Lagereinheit_Futter_ID INTEGER NOT NULL,
Einheit TEXT(50),
PRIMARY KEY (Lagereinheit_Futter_ID AUTOINCREMENT)
);

CREATE TABLE ref_Groesseneinheit_Gehege(
Groesseneinheit_Gehege_ID INTEGER NOT NULL,
Einheit TEXT(4),
PRIMARY KEY (Groesseneinheit_Gehege_ID AUTOINCREMENT)
);

CREATE TABLE ref_Waehrung(
Waehrung_ID INTEGER NOT NULL,
Einheit TEXT(50),
PRIMARY KEY (Waehrung_ID AUTOINCREMENT)
);

CREATE TABLE ref_Anrede(
Anrede_ID INTEGER NOT NULL,
Anrede TEXT(4),
PRIMARY KEY (Anrede_ID AUTOINCREMENT)
);

CREATE TABLE ref_Titel(
Titel_ID INTEGER NOT NULL,
Titel TEXT(10),
PRIMARY KEY (Titel_ID AUTOINCREMENT)
);

CREATE TABLE ref_Vertretungsgruende(
Vertretungsgrund_ID INTEGER NOT NULL,
Vertretungsgrund TEXT(50),
PRIMARY KEY (Vertretungsgrund_ID AUTOINCREMENT)
);

CREATE TABLE ref_MwSt(
MwSt_ID INTEGER NOT NULL,
MwSt_Satz TEXT(50),
PRIMARY KEY (MwSt_ID AUTOINCREMENT)
);

CREATE TABLE ref_Bool(
Bool_ID Numeric NOT NULL,
ja_nein TEXT(50),
PRIMARY KEY (Bool_ID)
);

CREATE TABLE ref_aSex(
aSex_ID INTEGER NOT NULL,
aSex TEXT(10),
PRIMARY KEY (aSex_ID AUTOINCREMENT)
);

CREATE TABLE ref_hSex(
hSex_ID INTEGER NOT NULL,
hSex TEXT(10),
PRIMARY KEY (hSex_ID AUTOINCREMENT)
);

CREATE TABLE ref_Nation(
Nation_ID INTEGER NOT NULL,
Nation TEXT(50),
PRIMARY KEY (Nation_ID AUTOINCREMENT)
);

CREATE TABLE ref_Ort(
Ort_ID INTEGER NOT NULL,
PLZ TEXT(15),
Ort TEXT(50),
Ortsteil_1 TEXT(50),
Ortsteil_2 TEXT(50),
PRIMARY KEY (Ort_ID AUTOINCREMENT)
);

CREATE TABLE Futter_Einkauf_Position(
Futter_Einkauf_Pos_ID INTEGER NOT NULL,
Futter_ID INTEGER NOT NULL,
Futter_Einkauf_ID INTEGER NOT NULL,
Menge Numeric,
Menge_Einheit TEXT(20),
Konditionen TEXT(250),
Rabatt TEXT(20),
Preis_Netto Numeric,
Waehrung TEXT(20),
FOREIGN KEY (Futter_ID) REFERENCES Futter(Futter_ID),
FOREIGN KEY (Futter_Einkauf_ID) REFERENCES Futter_Einkauf(Futter_Einkauf_ID),
PRIMARY KEY (Futter_Einkauf_Pos_ID AUTOINCREMENT)
);

