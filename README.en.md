🇩🇪 [Deutsche Version](README.md)

# Front-door opener → Home Assistant (Shelly 1 Mini Gen3)

The existing door strike ("buzzer") of the front door should additionally be triggerable from Home Assistant – for
example straight from the doorbell notification with the camera image. A **Shelly 1 Mini Gen3** in the distribution
cabinet puts its **potential-free relay contact in parallel with the existing door-opener push buttons**. **Nothing**
changes at the buttons on the floors; if the Shelly fails, they keep working as before.

> **🟡 Status 2026-10-21: planning.** Device is on hand, connection method decided. **Open:** measuring which wire the
> door-opener button switches against the transformer (see [installation](docs/einbau.en.md#1-measure-the-terminals)).
> History and decisions: [docs/verlauf.en.md](docs/verlauf.en.md).

| | |
|---|---|
| Device | Shelly 1 Mini Gen3 (terminals SW · O · I · L · N) – supply **110–240 V AC**, contact max. 8 A @ 240 V AC / 5 A @ 30 V DC |
| Contact | **O / I**, potential-free, in parallel with the door-opener button |
| Door-opener circuit | Bell transformer Hager ST303, 8 VA, SEC 8 V (2–4) / 12 V (2–8); pole 4 runs to a 5-way WAGO in the junction box above the left sub-distribution board |
| Shelly supply | Schuko power cord into the socket in the left distribution board – no change to the fixed wiring |
| Control | **pulse only**: auto-off after 2–3 s |
| Enclosure | custom 2-module DIN-rail enclosure (breaker-shaped) with snap latch and mains / extra-low-voltage divider – [docs/gehaeuse.en.md](docs/gehaeuse.en.md) |
| Firmware | **stock Shelly** (local, cloud off) – Tasmota practically not possible, see below |
| Related project | [esphome-klingel](https://github.com/Sparxx947/esphome-klingel) – detects on which floor the bell was rung |

## Principle

```
Bell transformer (8/12 V~)
   │
   ├── Door strike (front door)
   │
   └── Button GF ─┐
       Button 1F ─┼── in parallel back to the transformer
       Button 2F ─┘
       Shelly O/I ─┘   ← additional "button"
```

Each button simply closes the door-opener circuit. The Shelly's relay contact does the same; it is potential-free,
so the transformer's extra-low voltage never touches the Shelly's supply.

## Why this device

| Device (on hand) | Output | Suitable |
|---|---|---|
| **Shelly 1 Mini Gen3** | potential-free contact O/I | **yes** |
| Shelly PM Mini Gen3 | no relay, metering only | no |
| In-wall relay with switched L output (Sonoff MINI style) | puts mains voltage on the output | **no – 230 V in the bell circuit** |

Alternative without 230 V: **Shelly 1 Gen4**, which according to its datasheet also runs on 12 V DC (plug-in PSU).

## Tasmota?

No. The OTA converter [mgos32-to-tasmota32](https://github.com/tasmota/mgos32-to-tasmota32) lists the Shelly 1
Mini Gen3 as tested, but requires Shelly firmware **1.3.x** (for devices without 1.4.x); from **1.5.x nothing is
supported any more and development has stopped**. There is no way back to Shelly firmware, and a failed convert
needs serial flashing (open the housing, solder). The stock firmware works locally, Home Assistant integrates it
directly and auto-off is built in – Tasmota would bring no benefit here.

## Safety

- **Wire first, then plug in.** Mains and low-voltage terminals share one terminal strip.
- Bring the mains cable and the bell wires into the enclosure from different sides, with strain relief; no open terminal-block box.
- Whether the isolation between L/N and O/I meets SELV requirements has **not been verified**.
- Do **not** expose the door opener to voice assistants; trigger it in HA only with confirmation.

## Contents

| Path | Contents |
|---|---|
| [docs/einbau.en.md](docs/einbau.en.md) | Measuring the terminals, wiring, Shelly settings |
| [docs/gehaeuse.en.md](docs/gehaeuse.en.md) | DIN-rail enclosure: design, dimensions, checks, printing, fire safety |
| `gehaeuse/` | OpenSCAD source, STL (body, lid), view |
| [docs/verlauf.en.md](docs/verlauf.en.md) | Project history and decisions |
| `ha/` | Home Assistant parts (after installation) |

## License

MIT – see [LICENSE](LICENSE).
