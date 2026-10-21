🇬🇧 [English version](einbau.en.md)

# Einbau

## 1. Klemmpunkte messen

Gesucht sind die **zwei Punkte, die der Türöffner-Taster verbindet**. Einer davon ist sehr wahrscheinlich
Trafo-Pol 4 (die 5er-WAGO in der Abzweigdose, an der alle Taster-Leitungen zusammenlaufen) – **ungeprüft**.

0. **Messbereich am bekannten Anker prüfen:** Multimeter auf **V~** (AC), Trafo Klemme 2–4 → etwa 8 V.
   (Bei der Klingel kosteten Messungen im falschen Bereich zwei Stunden.)
1. Eine Spitze an Pol 4 / 5er-WAGO, mit der anderen die Kandidaten-Adern absuchen.
2. Gesucht: Ader mit **~8 V (bzw. ~12 V) in Ruhe**, die auf **~0 V** fällt, solange jemand den Türöffner-Taster
   drückt und die Tür summt.
3. **Gegenprobe:** Pol 4 und diese Ader 1–2 s mit einem Draht überbrücken. Summt die Tür → das sind O und I.

| Messung | Ruhe | Taster gedrückt |
|---|---|---|
| Trafo Kl. 2–4 (Anker) | | – |
| Pol 4 ↔ Kandidat ___ | | |
| Pol 4 ↔ Kandidat ___ | | |
| Drahtbrücke Pol 4 ↔ ___ summt? | | |

Außerdem vom Typenschild des Türöffners (Schließblech in der Haustür): Nennspannung, ggf. Stromaufnahme.

## 2. Shelly vorher am Tisch einrichten

- WLAN, feste IP im Router
- **Output → Auto Off: 2–3 s**
- Cloud aus, MQTT aus, eigener WLAN-AP aus, Zeitzone Europe/Berlin (wie bei den übrigen Shellys im Haus)
- Eingang SW: unbenutzt (Eingangstyp „Taster“, vom Ausgang entkoppelt)

## 3. Anschluss

```
Schuko-Stecker (Steckdose linker Verteiler)
   L (braun)   ──► L
   N (blau)    ──► N
   PE (grün/gelb) ──► nicht am Shelly; isoliert abschließen

Türöffnerkreis (8/12 V~ vom ST303)
   Trafo-Pol 4 (5er-WAGO) ──► I
   Türöffner-Ader (aus Schritt 1) ──► O

SW ──► frei
```

Polung an O/I ist egal (reiner Kontakt). **Erst alles verdrahten und das Gehäuse schließen, dann einstecken.**

## 4. Abnahme

- Schalten aus der Shelly-Oberfläche → Tür summt 2–3 s, Ausgang geht von selbst aus
- Alle drei Taster in den Etagen funktionieren weiter
- Stecker ziehen → Taster funktionieren weiter
