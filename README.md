## Introduzione
Questo progetto effettua una scansione ogni giorno di un elenco di siti web di:
* [Media Italiani](https://github.com/sicurezzadeimedia/italia/blob/master/media-risultati.csv)
* [Partiti Politici](https://github.com/sicurezzadeimedia/italia/blob/master/politica-risultati.csv)

I risultati sono disponibili come file in formato .csv, scaricabili e consultabili con una applicazione spreadsheet (es: excel, google spreadsheet, libreoffice).

I risultati sono parametri tecnici, ma riassunti nei 3 parametri:
* Domain Supports HTTPS: Il sito supporta HTTPS ma non lo offre come opzione standard (e non necessariamente ben configurata)
* Domain Enforces HTTPS: Il sito obbliga l'uso nativo di HTTPS e rifiuta l'accesso insicuro
* Domain Uses Strong HSTS: Il sito obbliga l'uso nativo di HTTPS e obbliga al suo uso in futuro con le estensioni HSTS


## Contribuire
Qui è possibile accedere e contribuire all'[elenco dei siti web](https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E) posti sotto monitoraggio.
L'elenco dei siti è consultabile all'indirizzo  .

La scansione viene effettua tramite il programma [Pushing HTTPS](https://github.com/dhs-ncats/pshtt) realizzato dal governo statunitense per mettere in sicurezza tutti i siti del governo federale (i famosi ".gov") .


## TODO
* Visualizzazione integrata in JS-client side
* Visualizzazione con bravi-cattivi e rating
* Ampliare elenchi di siti (Istituzioni Centrali, Telecomunicazioni, Utility Gas/Luce, Sanità, etc)
