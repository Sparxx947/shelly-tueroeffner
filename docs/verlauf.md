🇬🇧 [English version](verlauf.en.md)

# Projektverlauf und Entscheidungen

| Datum | Schritt | Ergebnis / Entscheidung |
|---|---|---|
| 21.10.2026 | Ausgangslage | Wunsch: Türöffner der Haustür per Shelly oder Sonoff, **ohne Eingriff in die vorhandenen Taster**. Der Türöffnerkreis ist bis in den Verteiler verdrahtet (Klingeltrafo Hager ST303, 8 VA, 8 V / 12 V). Prinzip festgelegt: potentialfreier Kontakt **parallel** zum Taster, nur als Impuls (Auto-Off 2–3 s). |
| 21.10. | Erste Empfehlung | Shelly 1 Gen4 mit 12-V-DC-Steckernetzteil an der Verteiler-Steckdose – keine Netzspannung am Gerät. Versorgung 12 V DC laut Händlerangaben/Datenblatt, nicht an Shellys eigener Seite gegengeprüft. |
| 21.10. | Bestand gesichtet (Foto) | **Shelly 1 Mini Gen3** vorhanden: potentialfreier Kontakt O/I, 8 A @ 240 V AC / 5 A @ 30 V DC, Versorgung aber **nur 110–240 V AC** (Typenschild). Shelly PM Mini Gen3: kein Relais → ungeeignet. Unterputz-Relais mit geschaltetem L-Ausgang (vermutlich Sonoff MINI, Aufdruck nicht lesbar) → ungeeignet, würde Netzspannung in den Klingelkreis legen. |
| 21.10. | Entscheidung | **Shelly 1 Mini Gen3 aus dem Bestand**, versorgt über eine Schuko-Anschlussleitung aus der Verteiler-Steckdose. Shelly 1 Gen4 (12 V DC) bleibt der Ausweg, falls am Verteiler keine 230 V an den Shelly sollen. |
| 21.10. | Tasmota geprüft | mgos32-to-tasmota32: Mini1G3 getestet, aber nur ab Shelly-Firmware 1.3.x; ≥ 1.5.x nicht unterstützt, Entwicklung eingestellt, kein Rückweg. **Entscheidung: Shelly-Original-Firmware** (lokal, Cloud aus). |
| 21.10. | Gehäuse | Wunsch: aufrasten wie eine Sicherung. Eigenkonstruktion 2 TE nach DIN 43880 (OpenSCAD) mit festem Haken oben, Riegel mit Mäanderfeder unten, Trennsteg zwischen I und L (Netz vorn, Türöffner hinten), Zugentlastungen. Kollisionsprüfungen 0 mm³, Alarmpfad je Prüfung belegt. Flanschbreite nach Recherche 4 mm (nicht 5). Gekaufte Alternative mit UL94 V-0: CamdenBoss CNMB/2/KIT (8,15 €). Shelly-Maße und Klemmenlage noch nicht nachgemessen. |
| 21.10. | 3MF für P1S | Shelly gemessen (33,16 × 28,24 × 16,08 mm, I–L 5,0 mm, Klemmenmitte 6,5 mm ab Rückwand, SW-Kante → Mitte I/L 19,0 mm) → Modell angepasst, Steg 1,0 mm, 2 mm über der Leiste. Fertig voreingestellte Druckdatei (PETG Basic, Textured PEI, 0,20 mm, 3 Wände, Arachne): 1 h 55 min, 51,9 g; per erneutem Einlesen in Bambu Studio gegengeprüft. |
| 22.10. | Zweiter Druck vorbereitet | Erster Druck: Mäanderfeder (volle Breite 34,6 mm, Stränge 0,8 mm) hat sich im Druck von der Platte gelöst; Shelly hatte Luft (Länge 0,5 mm Spiel je Seite + Länge real 33,46 statt 33,16, Steg 2 mm über der Leiste, ein Druckzapfen mit 0,5 mm Luft). Slicer-Brim geprüft: legt Bahnen in die Federspalte → verworfen. Feder jetzt nur 12 mm breit, Stränge 1,2 mm (Steifigkeit etwa gleich), Spiel 0,25 mm, Steg 0,6 mm, zwei Zapfen mit 0,2 mm. 1 h 54 min, 51,3 g. |
| offen | Messung | Welche Ader der Türöffner-Taster gegen Pol 4 schaltet; Typenschild Türöffner. |
| offen | Home Assistant | Shelly-Integration, Knopf mit Bestätigung, Aktion „Tür öffnen“ in der Klingel-Benachrichtigung; keine Freigabe an Sprachassistenten. |
