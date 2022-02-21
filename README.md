# README

Das Stugen Informations System (StugIS) dient als Sammelstelle die (Kontakt-)Daten der [Stugen/Fachschaften](https://stugen.de) der [Universität Bremen](https://uni-bremen.de). Das Oberflächendesign wurde von der Universität Bremen in einer abgespeckten Version übernommen, so sind nur all jene Elemente umgesetzt die auch für die Darstellung in der Anwendung nützlich erschienen. Die Anwendung ist aktuell auf Deutsch und Englisch (unvollständig) verfügbar und ermittelt die Sprache anhand der Sprachpräferenz des Browsers sofern die Nutzer\*in nicht selbst die Anzeigesprache wählt. (*Hinweis: Es sind noch nicht alle Datenfelder mehrsprachig verfügbar, außerdem sind noch nicht alle statischen Texte übersetzt worden. Gerne werden hierfür Pull-Requests angenommen.*)

## Funktionsumfang
* Datenerfassung und -bereitstellung (v.A. Kontaktinformationen)
  * über Self-Service: Stugen (Hinweistext, Telefon, Gebäude, Raum, Homepage, diverse Social-Media-Profile (Facebook, Twitter, YouTube, Instagram, Pinterest, Snapchat, Tumblr und Discord))
  * als Administrator (zusätzlich zum Self-Service): Fachbereiche (Nummer, deutsche Bezeichnung, englische Bezeichnung), Stugen (Name, Kurzform, Fachbereich, E-Mailadresse)
* Self-Service über einen Verifikationstoken (keine Accounts notwendig)
* Administrationsschnittstelle (**Achtung:** Keine Authentifizierung implementiert, siehe [Administration](#administration))
* Benachrichtugung per E-Mail, dass Daten erneut überprüft werden sollten mit Links zur einfachen, niederschwelligen Abwicklung (*Geplant ist diese Nachrichten einmal pro Semester automatisch zu versenden, dies ist noch nicht umgesetzt.*)
* Bestätigung von Änderungen (im Self-Service oder durch Admin) per E-Mail, sofern sie Datenfelder betreffen, welche im Self-Service editierbar sind
* Unbestätigte bzw. lange nicht Überprüfte Einträge werden für die Besucher\*innen als solche hervorgehoben, sodass ein Anreiz für die Stugen besteht diese Daten wirklich aktuell zu halten

---

## Einrichten des Systems
Die nötigen Einstellungen sollten alle über Umgebungsvariablen möglich sein. Dies kann durch das verwendete [gem figaro](https://github.com/laserlemon/figaro) in einer YML-Datei `config/application.yml` ausgelagert oder über die Webserver-Konfiguration erfolgen. Alle möglichen/nötigen Variablen sind in den folgenden Abschnitten mit ggf. Standardwerten (wenn es solche gibt sind sie in Klammern angegeben) aufgelistet.

### Datenbank
Benötigt wird PostgreSQL mit pgcrypto-Extension. Je nach Rechten des PosgreSQL-Benutzers für StugIS muss die pgcrypto-Extension ggf. manuell über den Benutzer `postgres` für die Datenbank aktiviert werden (`CREATE EXTENSION pgcrypto;`).

Konfiguration:
* production: `STUGIS_DATABASE_HOST`, `STUGIS_DATABASE_PORT`, `STUGIS_DATABASE`, `STUGIS_DATABASE_USER`, `STUGIS_DATABASE_PASSWORD`
* develop (**FIXED VALUES** in [`config/database.yml`](config/database.yml)): database: "stugis_dev", username: "stugis_dev", password: "stugis_dev"
* test (**FIXED VALUES** in [`config/database.yml`](config/database.yml)): database: "stugis_test", username: "stugis_test", password: "stugis_test"

### E-Mail
Es gibt aktuell 2 Typen von E-Mails:
* Bestätigungsnachrichten über Änderungen an den (auch außerhalb der Admin-Schnittstelle editierbaren) Feldern der Stugendaten. 
  Diese Nachrichten werden automatisch an die hinterlegten E-Mail-Adressen der Stugen gesendet.  
  **Achtung:** Erzeugt in einer Testumgebung mit `RAILS_ENV=production` also (irreführenden) Spam. Es sollte daher der Mailversand (beispielsweise durch ungültige SMTP-Angaben) deaktiviert werden oder der Quellcode in [`app/mailers/stugen_mailer.rb`](app/mailers/stugen_mailer.rb) entsprechend angepasst werden.
* Benachrichtigungen bzw. Erinnerungen, dass die Daten wieder überprüft werden sollten. 
  Diese Nachrichten können aktuell nur über die `rails console` versandt werden, bspw. `StugenMailer.with(stuga: Stuga.first).notification.deliver_now`.  
  **Achtung:** Dies sendet die E-Mail an die hinterlegte E-Mailadresse des StugA - Erzeugt in einer Testumgebung mit `RAILS_ENV=production` also (irreführenden) Spam. Es sollte daher der Mailversand (beispielsweise durch ungültige SMTP-Angaben) deaktiviert werden oder der Quellcode in [`app/mailers/stugen_mailer.rb`](app/mailers/stugen_mailer.rb) entsprechend angepasst werden.

Konfiguration:
* `MAIL_HOST`, `MAIL_PORT`, `MAIL_FROM`, `MAIL_USER`, `MAIL_PASSWORD`

### URL-Erzeugung
In den View-/Layout-Templates sowie in den E-Mailtexten werden teilweise Links auf die Anwendung generiert. Damit diese korrekt aufgebaut sind können und sollten zwei Umgebungsvariablen gesetzt werden.

Konfiguration:
* `STUGIS_HOST` ("localhost"), `STUGIS_PROTOCOL` ("https")

### Administration
Die Administrationsschnittstelle (`/admin/..`, `/de/admin/..`, `/en/admin/..`) verfügt über keine in dieser Anwendung implementierte Authentifizierung. Daher wird empfohlen diese Schnitstelle auf Produktivsystemen anderweitig (direkt im Webserver) über IP-Adressfilter oder bspw. BasicAuth zu schützen. Dies könnte beim Einsatz von Apache2 folgendermaßen aussehen:
```apache
<LocationMatch ^(.*/admin(/.*)?)$>
    Deny from all
    Allow from 127.0.0.1/32
    Satisfy any
</LocationMatch>
```

### Up and Running
Die Installation von ruby, bundler, entsprechendes `bundle install`, ggf. Einrichtung von bspw. Passenger überlasse ich dem geneigten Leser zur Übung.
Weiterhin muss das Schema eingespielt werden `rails db:schema:load` (oder da nicht viele Migrations auch `rails db:migrate`). Sollte die pgcrypto-Extension noch nicht aktiviert sein wird versucht dies nachzuholen. Dabei könnte es zu einem Fehler aufgrund fehlender Rechte kommen, siehe [Datenbank](#datenbank).

Anschließend können die Seeds eingespielt werden (`rails db:seed`). Die Seeds entsprechen dem Stand der Live-Datenbank von Ende Juni 2020.  
**Achtung:** Aktuell fehlen in den Seeds noch die englischen Titel der Fachbereiche, diese müssten noch einmal nachgepflegt werden.  
**Achtung:** Das Einspielen der Seeds erzeugt aktuell ebenfalls die Bestätigungsnachrichten (siehe [E-Mail](#e-mail)), da es direkt am `save` der Stugendaten anhägt.



## Tests

Feel free to implement :)
