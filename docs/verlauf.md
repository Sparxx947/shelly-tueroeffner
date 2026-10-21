🇬🇧 [English version](verlauf.en.md)

# Projektverlauf und Entscheidungen

| Datum | Schritt | Ergebnis / Entscheidung |
|---|---|---|
| 21.10.2026 | Ausgangslage | Wunsch: Türöffner der Haustür per Shelly oder Sonoff, **ohne Eingriff in die vorhandenen Taster**. Der Türöffnerkreis ist bis in den Verteiler verdrahtet (Klingeltrafo Hager ST303, 8 VA, 8 V / 12 V). Prinzip festgelegt: potentialfreier Kontakt **parallel** zum Taster, nur als Impuls (Auto-Off 2–3 s). |
| 21.10. | Erste Empfehlung | Shelly 1 Gen4 mit 12-V-DC-Steckernetzteil an der Verteiler-Steckdose – keine Netzspannung am Gerät. Versorgung 12 V DC laut Händlerangaben/Datenblatt, nicht an Shellys eigener Seite gegengeprüft. |
| 21.10. | Bestand gesichtet (Foto) | **Shelly 1 Mini Gen3** vorhanden: potentialfreier Kontakt O/I, 8 A @ 240 V AC / 5 A @ 30 V DC, Versorgung aber **nur 110–240 V AC** (Typenschild). Shelly PM Mini Gen3: kein Relais → ungeeignet. Unterputz-Relais mit geschaltetem L-Ausgang (vermutlich Sonoff MINI, Aufdruck nicht lesbar) → ungeeignet, würde Netzspannung in den Klingelkreis legen. |
| 21.10. | Entscheidung | **Shelly 1 Mini Gen3 aus dem Bestand**, versorgt über eine Schuko-Anschlussleitung aus der Verteiler-Steckdose. Shelly 1 Gen4 (12 V DC) bleibt der Ausweg, falls am Verteiler keine 230 V an den Shelly sollen. |
| offen | Messung | Welche Ader der Türöffner-Taster gegen Pol 4 schaltet; Typenschild Türöffner. |
| offen | Home Assistant | Shelly-Integration, Knopf mit Bestätigung, Aktion „Tür öffnen“ in der Klingel-Benachrichtigung; keine Freigabe an Sprachassistenten. |
