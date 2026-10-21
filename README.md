🇬🇧 [English version](README.en.md)

# Haustür-Türöffner → Home Assistant (Shelly 1 Mini Gen3)

Der vorhandene Türöffner („Summer“) der Haustür soll sich zusätzlich aus Home Assistant auslösen lassen – etwa
direkt aus der Klingel-Benachrichtigung mit Kamerabild. Ein **Shelly 1 Mini Gen3** sitzt dafür im Verteiler und
legt seinen **potentialfreien Relaiskontakt parallel zu den vorhandenen Türöffner-Tastern**. An den Tastern in
den Etagen wird **nichts** verändert; fällt der Shelly aus, funktionieren sie wie bisher.

> **🟡 Stand 21.10.2026: Planung.** Gerät ist vorhanden (Bestand), Anschlussweg festgelegt. **Offen:** Messung,
> welche Ader der Türöffner-Taster gegen den Trafo schaltet (siehe [Einbau](docs/einbau.md#1-klemmpunkte-messen)).
> Verlauf und Entscheidungen: [docs/verlauf.md](docs/verlauf.md).

| | |
|---|---|
| Gerät | Shelly 1 Mini Gen3 (Klemmen SW · O · I · L · N) – Versorgung **110–240 V AC**, Kontakt max. 8 A @ 240 V AC / 5 A @ 30 V DC |
| Kontakt | **O / I**, potentialfrei, parallel zum Türöffner-Taster |
| Türöffnerkreis | Klingeltrafo Hager ST303, 8 VA, SEC 8 V (Kl. 2–4) / 12 V (Kl. 2–8); Pol 4 läuft auf eine 5er-WAGO in der Abzweigdose über dem linken Kleinverteiler |
| Versorgung Shelly | Schuko-Anschlussleitung an der Steckdose im linken Verteiler – kein Eingriff in die feste Installation |
| Ansteuerung | nur als **Impuls**: Auto-Off nach 2–3 s |
| Gehäuse | eigenes Hutschienengehäuse 2 TE (wie ein LS-Schalter), mit Rastriegel, Trennsteg 230 V / Kleinspannung – [docs/gehaeuse.md](docs/gehaeuse.md) |
| Firmware | **Shelly-Original** (lokal, Cloud aus) – Tasmota praktisch nicht möglich, siehe unten |
| Verwandtes Projekt | [esphome-klingel](https://github.com/Sparxx947/esphome-klingel) – erkennt, auf welcher Etage geklingelt wird |

## Prinzip

```
Klingeltrafo (8/12 V~)
   │
   ├── Türöffner (Haustür)
   │
   └── Taster EG ─┐
       Taster E1 ─┼── parallel zurück zum Trafo
       Taster E2 ─┘
       Shelly O/I ─┘   ← zusätzlicher „Taster“
```

Jeder Taster schließt nur den Türöffnerkreis. Der Relaiskontakt des Shelly tut dasselbe; er ist potentialfrei,
die Kleinspannung des Trafos kommt also nicht mit der Versorgung des Shelly in Berührung.

## Warum dieses Gerät

| Gerät (Bestand) | Ausgang | Geeignet |
|---|---|---|
| **Shelly 1 Mini Gen3** | potentialfreier Kontakt O/I | **ja** |
| Shelly PM Mini Gen3 | kein Relais, nur Messung | nein |
| Unterputz-Relais mit geschaltetem L-Ausgang (Sonoff-MINI-Bauart) | führt Netzspannung an den Ausgang | **nein – 230 V im Klingelkreis** |

Alternative ohne 230 V: **Shelly 1 Gen4**, der laut Datenblatt auch mit 12 V DC läuft (Steckernetzteil).

## Tasmota?

Nein. Die OTA-Umstellung [mgos32-to-tasmota32](https://github.com/tasmota/mgos32-to-tasmota32) führt den
Shelly 1 Mini Gen3 zwar als getestet, verlangt aber Shelly-Firmware **1.3.x** (für Geräte ohne 1.4.x); ab **1.5.x
wird nichts mehr unterstützt, die Entwicklung ist eingestellt**. Rückweg zur Shelly-Firmware gibt es nicht, ein
Fehlschlag braucht serielles Flashen (Gehäuse öffnen, löten). Die Original-Firmware arbeitet lokal, Home Assistant
bindet sie direkt ein, Auto-Off ist eingebaut – Tasmota brächte hier keinen Vorteil.

## Sicherheit

- **Erst verdrahten, dann einstecken.** Netz- und Kleinspannungsklemmen liegen auf einer Leiste.
- Netzleitung und Klingeladern von verschiedenen Seiten ins Gehäuse, Zugentlastung, keine offene Lüsterklemmen-Dose.
- Ob die Trennung zwischen L/N und O/I den Anforderungen an Schutzkleinspannung (SELV) genügt, ist **nicht geprüft**.
- Türöffner **nicht** an Sprachassistenten freigeben; in HA nur mit Bestätigung auslösen.

## Inhalt

| Pfad | Inhalt |
|---|---|
| [docs/einbau.md](docs/einbau.md) | Messung der Klemmpunkte, Anschluss, Shelly-Einstellungen |
| [docs/gehaeuse.md](docs/gehaeuse.md) | Hutschienengehäuse: Aufbau, Maße, Prüfungen, Druck, Brandschutz |
| `gehaeuse/` | OpenSCAD-Quelle, STL (Körper, Deckel), Ansicht |
| [docs/verlauf.md](docs/verlauf.md) | Projektverlauf und Entscheidungen |
| `ha/` | Home-Assistant-Teile (folgen nach dem Einbau) |

## Lizenz

MIT – siehe [LICENSE](LICENSE).
