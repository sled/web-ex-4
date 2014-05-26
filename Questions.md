Questions
=========

1. Benutzer Registrieren => Sign Up Button
  * Wo geschieht die Validierung? => SERVERSEITIG im Modell z.b app/models/user.rb Zeile 9-11

2. Benutzer Bearbeiten => Oben Rechts auf Username klicken, im Dropdown auf Settings

3. Neue Gruppe anlegen => Oben auf "New Group" klicken
  * Datumsselektor mit Klick auf das Kalendericon öffnen
  * Benutzer können beim Erstellen hinzugefügt werden
  * Validierung geschieht ebenfalls auf der Serverseite (app/models/group.rb)

4. Benutzer hinzufügen nach dem Gruppe erstellt wurde:
  * Auf Community klicken, eine Person auswählen
  * Auf der Detailsseite ist oben eine Liste mit Links von deinen Gruppen, der Link hat ein (+) wenn die Person
    noch nicht in der Gruppe ist und ein (-) wenn die Person in der Gruppe ist. Mit Klick auf den Link kann die
    Mitgliedschaft in der Gruppe getoggled werden.
  * Mitglieder können auch auf der Gruppendetailseite im Menü "Members" entfernt, jedoch nicht hinzugefügt werden.

5. Wo sehe ich welche Gruppen ich Besitze und in welchen Gruppen ich Mitglied bin?
  * Oben auf Home Klicken, gibt dann zwei listen

6. Wo sehe ich in welchen Gruppen eine Person ist und welche Gruppen eine Person besitzt?
  * Auf Community gehen, dann eine Person auswählen, auf der Detailseite befinden sich zwei Listen
  * Man kann die Gruppen nur ansehen wenn man die Gruppe Besitzt oder Mitglied ist

7. Wie wird verhindert das eine Gruppe von fremden Bearbeitet wird?
  * Mittels dem Authority Gem, es werden Objekt-Bezogene Rechte vergeben, im Code z.B. so:
    `current_user.can_update?(@group_instance)`
    current_user ist hier der momentan eingeloggte user
  * Die Authorizer Definition für Gruppen findet sich unter app/authorizers/group_authorizer.rb
  * Die Methode updateable_by?(user) checkt folgende Bedingung resource.owner == user, wobei resource 
    die Gruppe ist und user der eingeloggte user

8. Wie funktioniert die Flickr Integration?
  * Ein Gem wird für die REST Schnittstelle verwendet, der FlickrController nimmt hierbei eine Anfrage entgegen,
    holt die Resultate von Flickr und gibt sie an den Browser zurück.
    Sieht so aus: Browser => MeetUp App => Flickr => MeetUp App => Browser
  * Wichtig: Die Bild-URL wird SERVERSEITIG zusammengesetzt mittels helper methoden siehe app/helpers/flickr_helper.rb

9. Das Implementierte Voting Schema ist wie bei Facebook, man kann etwas liken und dann wieder unliken.

10. Die Events in einer Gruppe werden nach Anzahl der Likes sortiert (hierzu evtl. Refresh klicken nach dem man auf Like   geklickt hat).

11. Wie funktioniert die Twitter Integration?
  * Man muss zuerst oben auf "Enable Twitter" klicken, hierbei wird man zu Twitter weitergeleitet (OAuth Request), auf Twitter
    muss man dann den Zugriff bestätigen und man wird von Twitter auf eine vordefinierte Callback-URL umgeleitet. Der Callback geht in der MeetUp App zum OmniauthCallbacksController (app/controllers/omniauth_callbacks_controller.rb)
  * Wenn der Callback zurückkommt, wird von Twitter das Token sowie ein Secret mitgegeben, dieses wird fest mit dem momentan 
    eingeloggten User verknüpft in der Tabelle "Identities". User haben also eine 1:1 Beziehung zu Ihrer Twitter Identity.
  * WICHTIG: Die Twitter Identity wird PERMANENT gespeichert, ist also bei einem erneuten Login immernoch da.
  * Wenn man bei einem Event auf "Confirm" klickt, wird über die Twitter API ein Tweet im Namen des Users getweetet.


