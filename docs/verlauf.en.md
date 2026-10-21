🇩🇪 [Deutsche Version](verlauf.md)

# Project history and decisions

| Date | Step | Result / decision |
|---|---|---|
| 2026-10-21 | Starting point | Goal: trigger the front-door strike via Shelly or Sonoff **without touching the existing buttons**. The door-opener circuit is wired all the way to the distribution cabinet (bell transformer Hager ST303, 8 VA, 8 V / 12 V). Principle: potential-free contact **in parallel** with the button, pulse only (auto-off 2–3 s). |
| 10-21 | First recommendation | Shelly 1 Gen4 with a 12 V DC plug-in PSU at the cabinet socket – no mains voltage at the device. 12 V DC supply per reseller data/datasheet, not cross-checked against Shelly's own page. |
| 10-21 | Inventory (photo) | **Shelly 1 Mini Gen3** on hand: potential-free contact O/I, 8 A @ 240 V AC / 5 A @ 30 V DC, but supply **110–240 V AC only** (rating plate). Shelly PM Mini Gen3: no relay → unsuitable. In-wall relay with switched L output (probably Sonoff MINI, label unreadable) → unsuitable, would put mains voltage into the bell circuit. |
| 10-21 | Decision | **Shelly 1 Mini Gen3 from stock**, powered via a Schuko power cord from the cabinet socket. Shelly 1 Gen4 (12 V DC) remains the fallback if no mains voltage should reach the Shelly. |
| open | Measurement | Which wire the door-opener button switches against pole 4; door-strike rating plate. |
| open | Home Assistant | Shelly integration, button with confirmation, "open door" action in the doorbell notification; not exposed to voice assistants. |
