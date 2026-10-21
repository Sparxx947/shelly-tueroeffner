🇩🇪 [Deutsche Version](einbau.md)

# Installation

## 1. Measure the terminals

We need the **two points the door-opener button connects**. One of them is very likely transformer pole 4 (the
5-way WAGO in the junction box where all button wires meet) – **not verified**.

0. **Check the meter range at a known anchor:** set the multimeter to **V~** (AC), transformer terminals 2–4 → about 8 V.
   (On the doorbell project, measuring in the wrong range cost two hours.)
1. One probe on pole 4 / the 5-way WAGO, search the candidate wires with the other.
2. Looking for: a wire at **~8 V (or ~12 V) at rest** that drops to **~0 V** while someone holds the door-opener
   button and the door buzzes.
3. **Cross-check:** bridge pole 4 and that wire with a piece of wire for 1–2 s. If the door buzzes → these are O and I.

| Measurement | Rest | Button pressed |
|---|---|---|
| Transformer 2–4 (anchor) | | – |
| Pole 4 ↔ candidate ___ | | |
| Pole 4 ↔ candidate ___ | | |
| Bridge pole 4 ↔ ___ buzzes? | | |

Also from the door strike's rating plate (strike plate in the front door): rated voltage, current if given.

## 2. Configure the Shelly on the bench first

- Wi-Fi, fixed IP in the router
- **Output → Auto Off: 2–3 s**
- Cloud off, MQTT off, own Wi-Fi AP off, time zone Europe/Berlin (like the other Shellys in the house)
- Input SW: unused (input type "button", detached from the output)

## 3. Wiring

```
Schuko plug (socket in the left distribution board)
   L (brown)   ──► L
   N (blue)    ──► N
   PE (green/yellow) ──► not on the Shelly; insulate and terminate

Door-opener circuit (8/12 V~ from the ST303)
   Transformer pole 4 (5-way WAGO) ──► I
   Door-opener wire (from step 1)  ──► O

SW ──► unused
```

Polarity on O/I does not matter (plain contact). **Wire everything and close the enclosure first, then plug in.**

## 4. Acceptance test

- Switch from the Shelly web UI → door buzzes for 2–3 s, output turns off by itself
- All three buttons on the floors still work
- Unplug → buttons still work
