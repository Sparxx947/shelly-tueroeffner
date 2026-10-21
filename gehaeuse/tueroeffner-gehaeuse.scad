// Tueroeffner: Hutschienen-Gehaeuse 2 TE fuer Shelly 1 Mini Gen3 (Form wie ein Leitungsschutzschalter, DIN 43880)
// Stand 21.10.2026 — Repo shelly-tueroeffner.
//
// TEIL = "koerper" | "deckel" | "zusammen" | "schnitt" | "alle"
//      | "pruef_shelly" | "pruef_riegel" | "pruef_schiene"   (Kollisionspruefung: Ergebnis muss LEER sein)
//
// KOORDINATEN (Einbaulage): x = entlang der Schiene (Breite), y = Tiefe (0 = Rueckseite an der Schiene, + nach vorn),
//                            z = Hoehe (0 = unten, 90 = oben), Schienenmitte z = 45.
//
// AUFBAU
//   - Koerper offen nach RECHTS (+x), Deckel = rechte Seitenwand, 4 Blechschrauben 2,9 x 13 in Schraubsaeulen.
//   - Shelly liegt mit dem Ruecken an der linken Wand, Typenschild + Klemmschrauben zeigen zum Deckel,
//     Klemmleiste OBEN. Von vorn gesehen (Deckel ab) liegt SW hinten, N vorn (Reihenfolge SW O I L N).
//   - Trennung 230 V / Kleinspannung: Steg im Koerper ueber der Klemmleiste zwischen I und L, im Deckel ein Steg
//     an derselben Stelle neben dem Shelly bis zum Boden. Vorn (L, N) = Netz, Leitung kommt OBEN rein.
//     Hinten (SW, O, I) = Tueroeffnerkreis, Leitung kommt UNTEN rein.
//   - Rastung: oben fester Haken, unten federnder Riegel (Maeanderfeder, im Druck in der Ebene → PETG).
//     Abnehmen: Schraubendreher von vorn in den Schlitz der Lasche unten, nach unten ziehen.
//
// MASSE
//   Shelly 1 Mini Gen3 33,16 x 28,24 x 16,08 mm — GEMESSEN 21.10.2026 (Datenblatt 34 x 29 x 16)
//   Klemmen I–L Mitte–Mitte 5,0 mm, Rueckwand–Klemmenmitte 6,5 mm — GEMESSEN 21.10.2026.
//   SW-Kante → Mitte I/L 19,0 mm — GEMESSEN 21.10.2026 (Annahme "Leiste mittig" ergab 19,08)
//   Hutschiene TS35 x 7,5: 35 breit, Hut 27, Flansch 4 breit / 1,0 dick, 6,5 frei dahinter — EN 60715 (OBO-Datenblatt)
//   DIN 43880 Baugroesse 1: Kragen 45 mm hoch, Gesamthoehe 90, Tiefe bis Schulter 44, Gesamttiefe 55 — Normwerte,
//   am eigenen LS-Schalter nachmessen ★ (Kragen muss durch den Abdeckungsausschnitt passen)
//
// DRUCK: PETG (nicht PLA — die Feder braucht Zaehigkeit, im Verteiler wird es warm), 0,2 mm, 3 Waende, ohne Stuetzen.
//   Koerper liegt auf der LINKEN Seite (TEIL="koerper" dreht ihn so), Deckel mit der Aussenseite nach unten.
//   Netzleitung: Euro-Anschlussleitung 2 x 0,75 mm² (zweiadrig, kein PE noetig), Zugentlastung mit Kabelbinder.

TEIL = "alle";
$fn = 40;

// ---------- Normmasse ----------
te      = 17.5;
W       = 2*te - 0.4;   // Gesamtbreite inkl. Deckel (34,6)
H       = 90;           // Gesamthoehe
T_sch   = 44;           // Tiefe bis Schulter (Abdeckung)
T_ges   = 55;           // Gesamttiefe bis Front
H_krag  = 45;           // Kragenhoehe
zm      = H/2;          // Schienenmitte
schiene_b = 35.0;  flansch_t = 1.0;  flansch_b = 4.0;  steg_breite = 27;  schiene_h = 7.5;

// ---------- Gehaeuse ----------
wd = 2.0;               // Wand
dt = 2.0;               // Deckel
xi0 = wd;  xi1 = W - dt;            // Innenraum in x
krag_z0 = zm - H_krag/2;  krag_z1 = zm + H_krag/2;

// ---------- Shelly ----------
sh_t = 16.08;  sh_l = 33.16;  sh_h = 28.24;  // Dicke (x), Laenge entlang Klemmleiste (y), Hoehe (z) — GEMESSEN 21.10.2026
sh_y0 = wd + 0.5;  sh_z0 = 37;
sh_y1 = sh_y0 + sh_l;  sh_z1 = sh_z0 + sh_h;
sh_x1 = xi0 + sh_t;
// Klemmen SW O I L N, I–L 5,0, SW-Kante → Mitte I/L 19,0 (beides gemessen) → Steg zwischen I (3.) und L (4.)
kl_teilung = 5.0;  sw_bis_il = 19.0;
steg_y = sh_y0 + sw_bis_il;  steg_t = 1.0;
steg_luft = 2.0;     // Steg beginnt so weit ueber der Klemmleiste → Adern fahren gerade ein

// ---------- Rueckblock mit Riegel ----------
rb_y  = 13.6;  rb_z = 32;           // Rueckblock y 0..rb_y, z 0..rb_z (volle Breite)
ta_y1 = 11.6;  ta_z1 = 30;          // Riegeltasche y ..ta_y1, z ..ta_z1
sp    = 0.6;                        // Spalt Feder/Riegel/Tasche (in der Druckebene)
r_y0 = 0;  r_y1 = 2.0;              // Riegelstange
r_top = 28.3;                       // Oberkante Riegelarm in Ruhe (0,65 mm Vorspannung gegen die Schiene)
nase_h = 1.8;  nase_y0 = -2.4;  nase_y1 = -1.15;
lasche_z0 = -5;  lasche_z1 = -1;  lasche_y1 = 8;
weg = 3.0;                          // Zugweg zum Loesen
// Maeanderfeder
f_y0 = r_y1 + sp;  f_y1 = ta_y1 - sp;  f_t = 0.8;  f_p = 2.0;  f_n = 7;  f_steg = 1.2;

// ---------- Oeffnungen, Saeulen ----------
netz_d = 6.5;   netz_y = 35.5;   // oben, vorn (Netz)
kl_d   = 5.5;   kl_y   = 17;     // unten, hinten (Tueroeffner)
loch_x = (sh_x1 + xi1)/2;
saeulen = [[6, 84], [16.5, 33.5], [50, 61.5], [50, 28.5]];   // (y, z)
saeule_d = 6.5;  vorbohr = 2.5;  deckel_loch = 3.2;

BESCHRIFTUNG = "Türöffner";

// ================= Teile =================

module profil_aussen() {    // y-z-Profil
  translate([0, 0]) square([T_sch, H]);
  translate([0, krag_z0]) square([T_ges, H_krag]);
}
module profil_innen() {
  translate([wd, wd]) square([T_sch - 2*wd, H - 2*wd]);
  translate([T_sch - wd - 0.01, krag_z0 + wd]) square([T_ges - T_sch + 0.01, H_krag - 2*wd]);
}
module yz(x0, x1) { translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(x1 - x0) children(); }

module haken_oben() {
  z_a = zm + schiene_b/2 + 0.15;   // Unterkante Arm = Schienenkante + Spiel
  yz(0, xi1) {
    translate([nase_y0, z_a]) square([-nase_y0 + 0.01, 2]);                       // Arm hinter dem Flansch
    polygon([[nase_y0, z_a + 0.01], [nase_y1, z_a + 0.01], [nase_y1, z_a - nase_h],  // Nase, untere hintere Ecke angefast
             [nase_y0 + 0.6, z_a - nase_h], [nase_y0, z_a - nase_h + 0.6]]);
  }
}

module riegel(dz = 0) {   // Riegelstange + Arm + Nase + Lasche, um dz verschoben
  translate([0, 0, dz]) yz(0, W) {
    union() {
      {
        translate([r_y0, lasche_z1]) square([r_y1 - r_y0, r_top - lasche_z1]);
        translate([nase_y0, r_top - 2]) square([r_y1 - nase_y0, 2]);
        polygon([[nase_y0, r_top], [nase_y1, r_top + nase_h], [nase_y1, r_top]]);
        translate([0, lasche_z0]) square([lasche_y1, lasche_z1 - lasche_z0]);
      }
    }
  }
}
module riegel_schlitz(dz = 0) {   // Schlitz fuer den Schraubendreher, von vorn
  translate([W/2 - 2, 2.5, lasche_z0 + 1.25 + dz]) cube([4, lasche_y1, 1.5]);
}

module feder() {
  yz(0, W) {
    // oberer Anker an der Taschendecke (hinteres Ende der Feder = hohes y)
    translate([f_y1 - f_t, ta_z1 - f_steg - 0.01]) square([f_t, f_steg + 0.02]);
    for (k = [0 : f_n - 1]) {
      zo = ta_z1 - f_steg - k*f_p;
      translate([f_y0, zo - f_t]) square([f_y1 - f_y0, f_t]);
      if (k < f_n - 1) {
        ey = (k % 2 == 0) ? f_y0 : f_y1 - f_t;
        translate([ey, zo - f_p - 0.01]) square([f_t, f_p - f_t + 0.02]);
      }
    }
    // unteres Ende → Riegelstange
    zu = ta_z1 - f_steg - (f_n - 1)*f_p - f_t;
    translate([r_y1 - 0.01, zu]) square([f_y0 - r_y1 + f_t, f_t]);
  }
}

module kabelbinder_steg(y0, z0, z1) {   // Steg senkrecht (entlang z) an der linken Wand, Kabelbinder darunter durch
  translate([xi0, y0, z0]) cube([4.5, 3, 2]);
  translate([xi0, y0, z1 - 2]) cube([4.5, 3, 2]);
  translate([xi0 + 2.5, y0, z0]) cube([2, 3, z1 - z0]);
}

module koerper(mit_riegel = true) {
  difference() {
    union() {
      difference() {
        yz(0, xi1) profil_aussen();
        translate([0, 0, 0]) yz(xi0, xi1 + 1) profil_innen();
      }
      // Rueckblock (volle Breite, auch unter dem Deckel)
      cube([W, rb_y, rb_z]);
      haken_oben();
      // Steg ueber der Klemmleiste zwischen I und L
      translate([xi0, steg_y - steg_t/2, sh_z1 + steg_luft]) cube([xi1 - xi0, steg_t, H - wd - sh_z1 - steg_luft + 0.01]);
      // Saeulen
      for (s = saeulen) translate([xi0 - 0.01, s[0], s[1]]) rotate([0, 90, 0]) cylinder(d = saeule_d, h = xi1 - xi0 + 0.01);
      // Shelly-Anschlaege: vorn, unten
      translate([xi0, sh_y1 + 0.5, sh_z0 + 3]) cube([8, 2, 6]);
      translate([xi0, 24, sh_z0 - 2.25]) cube([10, 6, 2.25]);
      // Zugentlastungen (Kabelbinder)
      kabelbinder_steg(33, 72, 82);   // Netz
      kabelbinder_steg(15, 6, 16);    // Tueroeffner
    }
    // Riegeltasche (durchgehend in x, hinten und unten offen)
    translate([-1, -1, -1]) cube([W + 2, ta_y1 + 1, ta_z1 + 1]);
    // Vorbohrungen
    for (s = saeulen) translate([xi1 - 12, s[0], s[1]]) rotate([0, 90, 0]) cylinder(d = vorbohr, h = 13);
    // Leitungseinfuehrungen
    translate([loch_x, netz_y, H - wd - 1]) cylinder(d = netz_d, h = wd + 2);
    translate([loch_x, kl_y, -1]) cylinder(d = kl_d, h = wd + 2);
    // Beschriftung Kragenfront
    translate([W/2 - dt/2, T_ges - 0.6, zm]) rotate([90, 0, 180]) rotate([0, 0, 0])
      linear_extrude(1) text(BESCHRIFTUNG, size = 3.6, halign = "center", valign = "center");
  }
  // Riegel + Feder (im Druck mit dem Koerper verbunden ueber die Feder)
  if (mit_riegel) { difference() { riegel(); riegel_schlitz(); } feder(); }
}

module deckel() {
  difference() {
    union() {
      yz(xi1, W) difference() { profil_aussen(); square([rb_y, rb_z]); }
      // Steg neben dem Shelly (Fortsetzung des Koerperstegs nach unten)
      translate([sh_x1 + 0.8, steg_y - steg_t/2, wd - 0.01]) cube([xi1 - sh_x1 - 0.8 + 0.01, steg_t, sh_z1 + steg_luft - wd + 0.01]);
      // Druckzapfen auf das Typenschild
      translate([sh_x1 + 0.5, 32, 44]) rotate([0, 90, 0]) cylinder(d = 5, h = xi1 - sh_x1 - 0.5 + 0.01);
    }
    for (s = saeulen) translate([xi1 - 1, s[0], s[1]]) rotate([0, 90, 0]) cylinder(d = deckel_loch, h = dt + 2);
  }
}

module shelly() { translate([xi0, sh_y0, sh_z0]) cube([sh_t, sh_l, sh_h]); }

module schiene(dz = 0) {   // TS35 x 7,5, an den oberen Haken gezogen
  z_o = zm + schiene_b/2 + 0.15;  z_u = z_o - schiene_b;
  translate([0, 0, 0]) yz(-5, W + 5) {
    translate([-flansch_t, z_u]) square([flansch_t, flansch_b]);
    translate([-flansch_t, z_o - flansch_b]) square([flansch_t, flansch_b]);
    translate([-schiene_h, z_u + flansch_b - 1]) square([schiene_h, 1]);
    translate([-schiene_h, z_o - flansch_b]) square([schiene_h, 1]);
    translate([-flansch_t - 0.01, z_u + flansch_b - 1]) square([0.02, 0.01]);
  }
}

// ================= Ausgabe =================

if (TEIL == "koerper") rotate([0, -90, 0]) koerper();
if (TEIL == "deckel")  translate([0, 0, W]) rotate([0, 90, 0]) deckel();
if (TEIL == "zusammen") { koerper(); deckel(); %shelly(); %schiene(); }
if (TEIL == "schnitt") intersection() { union() { koerper(); deckel(); %shelly(); } translate([W/2 - 0.1, -10, -10]) cube([0.2, 80, 110]); }
if (TEIL == "alle") { koerper(); translate([W + 10, 0, 0]) deckel(); }

// Pruefungen — jede muss ein LEERES Objekt ergeben
if (TEIL == "pruef_shelly") intersection() { shelly(); union() { koerper(); deckel(); } }
// Riegel nach unten gezogen (Loesen) darf den Koerper nicht treffen; Koerper hier OHNE Riegel/Feder
module koerper_ohne_riegel() { koerper(mit_riegel = false); }
if (TEIL == "pruef_riegel") intersection() { riegel(-weg); union() { koerper_ohne_riegel(); deckel(); } }
// Schiene eingerastet: Riegel um die Vorspannung gedrueckt; nichts darf die Schiene durchdringen
if (TEIL == "pruef_schiene") intersection() {
  schiene();
  union() { koerper_ohne_riegel(); riegel(-(r_top - (zm - schiene_b/2 + 0.15))); }
}
