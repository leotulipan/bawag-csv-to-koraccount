bawag-csv-to-koraccount
=======================

Convert Austrian BAWAG/PSK .csv online banking files to korAccount Format

Files downloaded from https://ebanking.bawagpsk.com/InternetBanking/bawag.html

Converting for manual import into korAccount Freeware Software ( http://kornelius.org/koraccount/ )

## Input Format 

The CSV has the following format:

ANSI encoding (ruby might default to UTF8?)

Field Separator: ;

Acct#;Description;Date 1;Date 2;Value;Currency

### Acct# 

This is the Austrian Bank Acct Number
Probably always without leading Zeros (if you can confirm this, open an issue on github please)
11 digits

### Description 

Variable Length

**First 45 Characters are fixed**

	"Bezahlung Maestro              13.57         "
	"Auszahlung Maestro             09.13         " 
	"Abbuchung Einzugsermächtigung                "
	"Abbuchung Onlinebanking                      "
	"YOUR TXT FIELD ON MANUAL ONLINE TRANSFER     "  
	"Abbuchung Lastschrift                        "
	"Gutschrift Überweisung                       "
	EXCEPTION this line is complete: "BG/000001438 Entgelt für Kontoführung    " no leading 45chars


**Next 12 Charactes: 2 Letters Banking Code + running number**

All Banking codes encountered so far

AT
BG
FE
IG
MC
OG
VB
VD

-- MC/000001463
-- VD/000001462     
--- Running# is a unique number!
--- Codes seen: MC, VD, OG, FE, BG, 
\ Replace Line Breaks(\n\r)


### Date 1 

Booking date DD.MM.YYYY

### Date 2

Value date DD.MM.YYYY

### Value 

Value formatted:

- Leading minus - if you paid for something
- Leading plus + if you got paid
- Number
-- Dot "." as a thousands separator
-- comma "," as decimal separator

### Currency 

EUR

Three letter curreny code

Most definitely EUR for most accounts

## Output Format (korAccount)

Prefers to have a header line
Field separator: ;
Value: No thousand separator

Possible fields (header names)
-Datum
-Empfänger/Auftraggeber
-Zweck
-Betrag
-Wertstellung
-Fahrzeug Stand
-Fahrzeug Menge
-Fahrzeug Preis
-Kategorie
-Fahrzeug
-Ausgabe
-Einnahme
-Bemerkungen
-Belegnummer