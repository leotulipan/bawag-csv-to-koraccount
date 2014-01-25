bawag-csv-to-koraccount
=======================

Convert Austrian BAWAG/PSK .csv online banking files to korAccount Format

Files downloaded from https://ebanking.bawagpsk.com/InternetBanking/bawag.html

Converting for manual import into korAccount Freeware Software ( http://kornelius.org/koraccount/ )

## Input Format ##

The CSV has the following format.

Field Separator: ;

Acct#;Description;Date 1;Date 2;Value;Currency

### Acct# ###

This is the Austrian Bank Acct Number
Probably always without leading Zeros (if you can confirm this, open an issue on github please)
11 digits

### Description ###

Variable Length
- First 45 Characters are fixed 
-- "Bezahlung Maestro              13.57         "
-- "Auszahlung Maestro             09.13         " 
-- "Abbuchung Einzugsermächtigung                "
-- "Abbuchung Onlinebanking                      "
-- "YOUR TXT FIELD ON MANUAL ONLINE TRANSFER     "  
-- "Abbuchung Lastschrift                        "
-- "Gutschrift Überweisung                       "
-- EXCEPTION this line is complete: "BG/000001438 Entgelt für Kontoführung    " no leading 45chars
- Next 12 Charactes: 2 Letters Banking Code + running number
-- MC/000001463
-- VD/000001462     
--- Running# is a unique number!
--- Codes seen: MC, VD, OG, FE, BG, 
\ Replace Line Breaks(\n\r)


### Date 1 ###

Booking Date DD.MM.YYYY

### Date 1 ###

Value Date DD.MM.YYYY

### Value ###

Value formatted:

- Leading minus - if you paid for something
- Leading plus + if you got paid
- Number
-- Dot "." as a thousands separator
-- comma "," as decimal separator

### Currency ###

EUR

Three Letter Curreny Code

Most definitely EUR for most accounts