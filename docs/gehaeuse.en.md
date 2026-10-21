🇩🇪 [Deutsche Version](gehaeuse.md)

# DIN-rail enclosure (2 modules)

The Shelly sits in a custom enclosure shaped like a miniature circuit breaker: **2 modules wide (34.6 mm), 90 mm
high, 45 mm front collar, 44 mm to the shoulder, 55 mm overall depth** (DIN 43880 size 1). It snaps onto a TS35
rail like a breaker. Source: [`gehaeuse/tueroeffner-gehaeuse.scad`](../gehaeuse/tueroeffner-gehaeuse.scad),
ready to print: `tueroeffner_koerper.stl` (body), `tueroeffner_deckel.stl` (lid).

## Design

![View of the open side](../gehaeuse/ansicht-offen.png)

*Looking at the open side (lid removed): rail (grey) on the left, collar on the right. The Shelly is shown in orange.*

| Part | Purpose |
|---|---|
| Top hook (fixed) | grips behind the upper flange |
| Bottom latch with meander spring | snaps behind the lower flange, 0.65 mm preload. **Release:** insert a screwdriver from the front into the slot of the tab at the bottom and pull down (≈ 3 mm) |
| Shelly pocket | back against the left wall, label and terminal screws facing the lid, terminal strip on top. Front stop, bottom ledge, pressure pin in the lid (0.5 mm gap, add an adhesive pad if needed) |
| Divider | in the body above the terminal strip **between I and L**, in the lid beside the Shelly down to the floor → **front: mains (L, N), rear: door-opener circuit (SW, O, I)** |
| Entry top front, Ø 6.5 | mains cord (Euro power cord 2 × 0.75 mm²), cable-tie anchor below |
| Entry bottom rear, Ø 5.5 | door-opener wires, cable-tie anchor next to it |
| Lid | right side wall, 4 self-tapping screws 2.9 × 13 |

## Measure before printing ★

| Dimension | Assumed in the model | Parameter |
|---|---|---|
| Shelly 29 × 34 × 16 mm | Shelly datasheet (±0.5), not measured | `sh_h`, `sh_l`, `sh_t` |
| Position of terminals I and L along the strip | pitch 34/5 → divider 22.9 mm in front of the back wall | `steg_y` |
| Depth rail → cover on your own breaker | 44 mm (standard: ≤ 44) | `T_sch` |
| Collar fits through the cover cut-out | 45 mm (cut-out usually 46) | `H_krag` |

## Checks (OpenSCAD)

`openscad -D 'TEIL="pruef_shelly"' …` etc. Each check is an intersection and must be **empty or 0 mm³**.

| Check | Result 2026-10-21 | Alarm path proven with |
|---|---|---|
| `pruef_shelly` – Shelly vs body + lid | 0 mm³ (contact face only) | Shelly 3 mm lower → 212.7 mm³ |
| `pruef_riegel` – latch pulled 3 mm vs body | empty | latch 3 mm up → 90.0 mm³ |
| `pruef_schiene` – latched rail vs enclosure | 0 mm³ (contact only) | nose 0.65 mm too thick → 56.4 mm³ |

## Printing

- **PETG**, 0.2 mm, 3 walls, no supports. PLA is unsuitable: the spring needs toughness, and it gets warm in the cabinet.
- Print the body on its **left side** (`TEIL="koerper"` rotates it). The spring and hooks then lie in the print plane
  and do not flex against layer adhesion. Print the lid outer face down.
- After printing, pull the latch once by hand to free the 0.6 mm gaps.

## Fire safety – an honest assessment

Printed PETG is **not flame-retardant**. Commercial DIN-rail enclosures are polycarbonate UL94 V-0. The Shelly has
its own closed housing; the printed part is an additional shell. If you want it by the book, print in a V-0
filament (PC-FR, PETG-V0) or use an empty enclosure:

| Enclosure | Size | Material | Price (reichelt, 2026-10-21) |
|---|---|---|---|
| CamdenBoss CNMB/2/KIT ("CB HUTKIT 2") | 36 × 90 × 58 mm, floor 86.5 × 33 | PC, UL94 V-0 (grey lid) | €8.15 |
| apra-norm apraRail DB 2 | 36 × 90 × 58 mm | PC, UL94 V-0 | €7.30 |

Both are 58 mm deep (size 2) and fit common small distribution boards, but have no divider and no strain relief.
