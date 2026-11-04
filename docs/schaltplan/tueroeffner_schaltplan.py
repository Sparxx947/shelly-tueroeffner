import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, Circle

fig = plt.figure(figsize=(11.69, 8.27))  # A4 quer
ax = fig.add_axes((0.0, 0.0, 1.0, 1.0)); ax.set_xlim(0, 297); ax.set_ylim(0, 210); ax.axis("off")

def box(x, y, w, h, titel, farbe="#f2f2f2", rand="#333", fs=10):
    ax.add_patch(FancyBboxPatch((x, y), w, h, boxstyle="round,pad=0.6", fc=farbe, ec=rand, lw=1.5))
    ax.text(x + w / 2, y + h - 4, titel, ha="center", va="top", fontsize=fs, weight="bold")

def klemme(x, y, name, links=True):
    ax.add_patch(Circle((x, y), 1.6, fc="white", ec="#333", lw=1.2))
    ax.text(x + (-3 if links else 3), y, name, ha="right" if links else "left", va="center", fontsize=9, weight="bold")

def linie(pts, farbe, lw=2.4, ls="-"):
    xs, ys = zip(*pts); ax.plot(xs, ys, color=farbe, lw=lw, ls=ls, solid_capstyle="round")

ax.text(148.5, 203, "Türöffner-Shelly – Anschlussplan", ha="center", fontsize=17, weight="bold")
ax.text(148.5, 196, "Shelly 1 Mini Gen3 (.78) parallel zum Türöffner-Taster · Stand 04.11.2026", ha="center", fontsize=10, color="#444")

# --- 230-V-Seite links ---
box(12, 118, 52, 55, "Schuko-Stecker\n(Steckdose linker Verteiler)", "#fde9e7", "#b03a2e", 9)
for y, n in [(150, "L braun"), (140, "N blau"), (128, "PE grün/gelb")]:
    klemme(58, y, n)
ax.text(38, 121, "PE NICHT an den Shelly –\nisoliert abschließen", ha="center", fontsize=7.5, color="#b03a2e")

# Shelly
box(108, 100, 70, 80, "Shelly 1 Mini Gen3", "#e8f1fb", "#1f5fa8", 12)
for y, n in [(150, "L"), (140, "N"), (128, "SW")]:
    klemme(112, y, n, links=False)
for y, n in [(150, "O"), (140, "I")]:
    klemme(174, y, n)
ax.text(143, 112, "O–I = potentialfreier Kontakt\nAuto-Off 5 s · nur Impuls\nPolung O/I egal", ha="center", fontsize=8.5, color="#1f5fa8")
ax.text(122, 125, "SW: frei lassen", fontsize=8, color="#555", va="center")
linie([(59.6, 150), (110.4, 150)], "#8b4513")
linie([(59.6, 140), (110.4, 140)], "#1f5fa8")
ax.text(85, 153, "230 V~", ha="center", fontsize=9, color="#b03a2e", weight="bold")

# Trennlinie Netz / Kleinspannung
ax.plot([95, 95], [20, 185], color="#b03a2e", lw=1, ls=(0, (4, 3)))
ax.text(93, 22, "← 230 V", ha="right", fontsize=8, color="#b03a2e")
ax.text(97, 22, "Kleinspannung 8/12 V~ →", ha="left", fontsize=8, color="#2e7d32")

# --- Klingeltrafo ---
box(12, 30, 52, 70, "Klingeltrafo\nHager ST303", "#eef6ee", "#2e7d32", 10)
ax.text(38, 70, "Netzseite: nicht anfassen", ha="center", fontsize=7.5, color="#b03a2e")
for y, n in [(58, "Kl. 4"), (46, "Kl. 2"), (36, "Kl. 8")]:
    klemme(58, y, n)
ax.text(30, 82, "2–4 = 8 V~\n2–8 = 12 V~", ha="center", fontsize=8)

# WAGO Pol 4
box(205, 128, 40, 30, "5er-WAGO\n= Pol 4", "#fff8dc", "#9a7d0a", 10)
klemme(209, 136, "", links=False)
linie([(59.6, 58), (80, 58), (80, 88), (225, 88), (225, 126)], "#9a7d0a")
ax.text(150, 91, "Trafo Kl. 4 → WAGO (vorhanden)", ha="center", fontsize=8, color="#9a7d0a")
# Shelly I -> WAGO
linie([(172.4, 140), (207.4, 140), (207.4, 137.6)], "#9a7d0a", lw=3)
ax.text(190, 143, "NEU: I → WAGO", ha="center", fontsize=9, weight="bold", color="#9a7d0a")

# Taster
box(255, 120, 32, 60, "Türöffner-\nTaster", "#f7f7f7", "#555", 9)
ax.text(271, 158, "EG / E1 / E2\n(je einer,\nparallel)", ha="center", fontsize=7.5, va="top")
linie([(245.6, 145), (258, 145)], "#9a7d0a")
ax.plot([258, 262], [145, 149], color="#333", lw=1.5); ax.plot([262, 266], [145, 145], color="#333", lw=1.5)
linie([(266, 145), (280, 145), (280, 70), (240, 70)], "#7f7f7f")

# Türöffner-Ader grau
ax.text(258, 66, "Türöffner-Ader\n„grau EG“", ha="center", fontsize=9, weight="bold", color="#555", va="top")
klemme(238, 70, "", links=True)
linie([(175.6, 150), (192, 150), (192, 70), (236.4, 70)], "#7f7f7f", lw=3)
ax.text(194, 110, "NEU: O → grau EG", ha="left", fontsize=9, weight="bold", color="#555", rotation=90, va="center")

# Türöffner
box(205, 30, 60, 26, "Türöffner (Schließblech)", "#f7f7f7", "#555", 9)
linie([(238, 68.4), (238, 56.6)], "#7f7f7f")
linie([(205, 46), (59.6, 46)], "#2e7d32")
ax.text(130, 48.5, "Türöffner zurück zu Trafo Kl. 2 (vorhanden)", ha="center", fontsize=8, color="#2e7d32")

# Warnkasten
ax.add_patch(FancyBboxPatch((108, 3), 182, 22, boxstyle="round,pad=0.6", fc="#fff3cd", ec="#c9a227", lw=1.5))
ax.text(110, 21, "⚠ VOR DEM ANKLEMMEN:", fontsize=9.5, weight="bold", va="top")
ax.text(110, 15.5,
        "1. Gegenprobe: WAGO ↔ grau EG 1–2 s mit Draht brücken → summt die Tür? Nur dann ist „grau EG“ richtig.\n"
        "2. Erst alles verdrahten + Gehäuse schließen, DANN Stecker einstecken.\n"
        "3. Abnahme: Shelly schaltet → summt 2–5 s; alle 3 Taster gehen weiter; Stecker raus → Taster gehen weiter.",
        fontsize=8, va="top")
ax.text(12, 10, "Legende: neu zu verlegen = dicke Linie\nvorhanden = dünne Linie", fontsize=8, color="#444", va="center")

import os; out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "tueroeffner_schaltplan")
fig.savefig(out + ".pdf"); fig.savefig(out + ".png", dpi=110)
print(out + ".pdf")
