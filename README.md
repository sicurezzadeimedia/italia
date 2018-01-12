## Introduzione
Questo progetto effettua una scansione ogni giorno di un elenco di siti web di:
* [Media Italiani](https://github.com/sicurezzadeimedia/italia/blob/master/media-risultati.csv)
* [Partiti Politici](https://github.com/sicurezzadeimedia/italia/blob/master/politica-risultati.csv)

I risultati sono disponibili come file in formato .csv, scaricabili e consultabili con una applicazione spreadsheet (es: excel, google spreadsheet, libreoffice).

I risultati di Mozilla HTTP Observatory (**TODO**) hanno un rating sintetico che va da F (assolutamente insicuro) fino a A+ (molto sicuro), così da consentire una comprensione sintetica dello stato della sicurezza.


I risultati di Pushing HTTP sono parametri tecnici, ma riassunti nei 3 parametri:
* **Domain Supports HTTPS**: Il sito supporta HTTPS ma non lo offre come opzione standard (e non necessariamente ben configurata)
* **Domain Enforces HTTPS**: Il sito obbliga l'uso nativo di HTTPS e rifiuta l'accesso insicuro
* **Domain Uses Strong HSTS**: Il sito obbliga l'uso nativo di HTTPS e obbliga al suo uso in futuro con le estensioni HSTS


## Contribuire
Qui è possibile accedere e contribuire all'[elenco dei siti web](https://docs.google.com/spreadsheets/d/13LgBSMgU4f268OLtVWqLqy3z3nbL--EWKuUetMTuD1E) posti sotto monitoraggio.

La scansione viene effettua ogni mattina tramite:
* Programma [Pushing HTTPS](https://github.com/dhs-ncats/pshtt) realizzato dal governo statunitense per mettere in sicurezza tutti i siti del governo federale (i famosi ".gov") .
* Servizio [Mozilla HTTP Observatory](https://observatory.mozilla.org) per monitoraggio della sicurezza del web

## TODO
* Estrai risultati sintetici scan mozilla e genera CSV con link di approfondimento
* Visualizzazione integrata in JS-client side
* Visualizzazione con bravi-cattivi e rating
* Ampliare elenchi di siti (Istituzioni Centrali, Telecomunicazioni, Utility Gas/Luce, Sanità, etc)
