🇩🇪 [Deutsche Version](verlauf.md)

# Project history and decisions

| Date | Step | Result / decision |
|---|---|---|
| 2026-10-21 | Starting point | Goal: trigger the front-door strike via Shelly or Sonoff **without touching the existing buttons**. The door-opener circuit is wired all the way to the distribution cabinet (bell transformer Hager ST303, 8 VA, 8 V / 12 V). Principle: potential-free contact **in parallel** with the button, pulse only (auto-off 2–3 s). |
| 10-21 | First recommendation | Shelly 1 Gen4 with a 12 V DC plug-in PSU at the cabinet socket – no mains voltage at the device. 12 V DC supply per reseller data/datasheet, not cross-checked against Shelly's own page. |
| 10-21 | Inventory (photo) | **Shelly 1 Mini Gen3** on hand: potential-free contact O/I, 8 A @ 240 V AC / 5 A @ 30 V DC, but supply **110–240 V AC only** (rating plate). Shelly PM Mini Gen3: no relay → unsuitable. In-wall relay with switched L output (probably Sonoff MINI, label unreadable) → unsuitable, would put mains voltage into the bell circuit. |
| 10-21 | Decision | **Shelly 1 Mini Gen3 from stock**, powered via a Schuko power cord from the cabinet socket. Shelly 1 Gen4 (12 V DC) remains the fallback if no mains voltage should reach the Shelly. |
| 10-21 | Tasmota checked | mgos32-to-tasmota32: Mini1G3 tested, but only from Shelly firmware 1.3.x; ≥ 1.5.x unsupported, development stopped, no way back. **Decision: stock Shelly firmware** (local, cloud off). |
| 10-21 | Enclosure | Goal: snap on like a breaker. Custom 2-module design per DIN 43880 (OpenSCAD) with fixed top hook, meander-spring latch at the bottom, divider between I and L (mains front, door opener rear), strain reliefs. Collision checks 0 mm³, alarm path proven for each check. Flange width corrected to 4 mm (not 5) after research. Commercial UL94 V-0 alternative: CamdenBoss CNMB/2/KIT (€8.15). Shelly dimensions and terminal positions not yet measured. |
| 10-21 | 3MF for P1S | Pre-configured print file (PETG Basic, textured PEI, 0.20 mm, 3 walls, Arachne): 1 h 57 min, 52.3 g; verified by re-loading it in Bambu Studio. |
| open | Measurement | Which wire the door-opener button switches against pole 4; door-strike rating plate. |
| open | Home Assistant | Shelly integration, button with confirmation, "open door" action in the doorbell notification; not exposed to voice assistants. |
