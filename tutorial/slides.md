---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
---

![bg left:40% 80%](berlincreators.svg)

# **OpenSCAD 2D Tutorial**

Ein 2D Workshop mit OpenSCAD, dem etwas anderen 3D Design Tool

von Peter Recktenwald 

https://www.berlincreators.de

---

![bg left:40% 80%](Openscad.svg)

# Was ist OpenSCAD?

OpenSCAD ist eine freie Software um 2D und 3D CAD Objekte zu designen. Im Gegensatz zu vielen anderen CAD Programmen werden in OpenSCAD die Objekte mit einer textbasierten Skriptsprache erstellt.
Die Objekte bestehen aus einfachen Grundkörpern die zu komplexen 3D Modellen kombiniert werden. 

---

# Was wird benötigt?

* OpenSCAD http://openscad.org/downloads.html
* OpenSCAD 2D Tutorial https://github.com/robotfreak/openscad-2d-tutorial
* FontAwesome brand und free Font https://github.com/FortAwesome/Font-Awesome
* Baumans Font https://www.1001fonts.com/baumans-font.html

---

# Installation von OpenSCAD

OpenSCAD läuft auf Linux, Mac und Windows Platformen (auch auf dem Raspberry Pi, siehe https://github.com/koendv/openscad-raspberrypi/releases). 

Das OpenSCAD 2D Tutorial kann als Zip Datei heruntergeladen werden und in einem beliebigen Ordner ausgepackt werden. 

Die Fonts werden je nach OS entsprechend installiert und stehen dann unter OpenSCAD nach einem Neustart der Anwendung zur Verfügung.

---

# Start von OpenSCAD

---


# Navigation in der Vorschau

Die Vorschau des Modells kann mit dem Scrollrad der Maus vergrößert/verkleinert werden.

Bei gedrückter linker Maustaste lässt sich das Modell in den Raumachsen bewegen.

Bei gedrückter rechter Maustaste lässt sich die Kameraposition, der Blick auf das Modell, ändern.

Zudem gibt es eine Iconleiste unter dem Vorschau Fenster, um die Ansicht zu ändern. 

---

# Tastaturbefehle

Die wichtigsten Tastaturbefehle in OpenSCAD sind:

* F4 Modell neu laden und Vorschau aktualisieren
* F5 Vorschau aktualisieren
* F6 Modell rendern
* F7 Modell als STL speichern

---

# OpenSCAD Programmierung

Kommen wir zum eigentlichen Thema die Programmierung von SCAD. Die Befehlsübersicht von OpenSCAD findet man unter dem Menüpunkt 'Help | Cheat Sheet'. 

Dahinter verbirgt sich ein Link auf: 
https://openscad.org/cheatsheet/

---

# Syntax



---

# 2D Objekte 

OpenSCAD kann auch zum erzeugen von 2D Objekte verwendet werden, so gibt es u.a:

* Kreis - circle 
* Quadrat - square
* Polygon - polygon
* Text - text

---

# circle - Kreis

Syntax: circle(d=10); circle(r=5);

Zeichnet einen Kreis. ALs Parameter kann der Durchmesser (d) oder der Radius (r) angegeben werden. 

---

# square - quadrat

Syntax: square(10); square([10,20]);

Gibt man Parameter nur einen Wert an erhält man ein Quadrat. So erzeugt der Befehl  **square(10);**  ein Quadrat mit 10mm Kantenlänge. 

---


# text - Text 

Syntax: text(text="<text>", size=10);

Texte sind ein wichtiger Baustein, für die es in der 3D Welt keinen entsprechenden Befehl gibt. 

![width:300px](text.png) 

---

# polygon - Polygon

---


# Bewegen von Objekten

Zum Bewegen eines Objektes im 2-dimensionalen Raum gibt es die beiden Befehle:
* translate - zum Positionieren des Objekts in x, und y-Richtung
* rotate - zum Drehen eines Objektes um die z-Achse. 

Die Parameter für x, y bzw. z werden jeweils in eckigen Klammern mit Komma getrennt angegeben.

---

# Verschieben - translate

Syntax: translate([x,y]) object();
 
Der Befehl **translate** bewegt ein Objekt in x- bzw. y-Richtung.

---

# Beispiel translate

Der folgende Befehl verschiebt einen Quadrat um 10mm in x-Richtung und 20mm in y-Richtung.

translate([10,20]) square(10);

![width:400px](square-translate.png)

---

# Rotate 

Syntax rotate(z) object();

Der Befehl **rotate** rotiert ein Objekt um die  z-Achse.

---

# Beispiel rotate

Der folgende Befehle rotiert einen Quadrat um 45° um die z-Achse. 

rotate(45) square(10, true);

Beachte hier, dass der Würfel zentriert ist (center=true). Dann liegt die Rotations-Achse im Mittelpunkt des Würfels.

![width:400px](square-rotate.png)

---

# Mengenoperationen

Zu den Mengenoperationen (boolsche Operationen) in OpenSCAD zählen:

* Zusammenfassen - union
* Differenz - difference
* Schnittmenge - intersection

---

# union

Syntax: union() { object1(); object2(); }

Der Befehl **union** fasst mehrere Objekte zu einem Objekt zusammen. Auf das zusammengefasste Objekt können dann andere OPerationen wie verschieben (translate), rotieren (rotate) etc. angewandt werden.

![width:300px](union.png)

---

# difference

Syntax: difference() { object1(); object2(); }

Der Befehl **difference** zieht vom ersten angegebenen Objekt die folgenden Objekte ab.

![width:300px](difference.png) ![width:300px](difference-hollow.png)

---

# intersection

Syntax: intersection() { object1(); object2(); }

Der Befehl **intersection** bildet die Schnittmenge von Objekten.

![width:300px](intersection.png) 

---

# 2D Objekte in 3D wandeln

Um 2D Objekte in der 3D Welt nutzen zu können müssen diese in die Höhe "gezogen" werden, dazu gibt es die beiden Befehle:

* linear_extrude()
* rotate_extrude()

---

# linear_extrude

Syntax: linear_extrude(height) object(); 

Um Text in 3D zu wandeln reicht es dem text Befehl ein **linear_extrude** voranzutellen. Die Höhe ist der einzige Parameter, den linear_extrude erwartet. 

linear_extrude(1) text("Hello", size=10, font="Ubuntu");

---

# rotate_extrude

Syntax: rotate_extrude(height) object(); 

Mit **rotate_extrude** kann ein 2D Objekt kreisförmig extrudiert werden. Folgendes Beispeil erstellt einen Donut.
rotate_extrude(angle=360) translate([20, 0])circle(d=5, $fn=30);

![width:300px](donut.png) 

---

# import

Syntax: import("...ext")

Mit **import** lassen sich 2D Objekte wie z.B: SVG Files in OpenSCAD importieren. 
Auch 3D Objekte wie STL Files lassen sich mit import importieren. Anhand der Datei Extension erkennt OpenSCAD das Format der Datei.

---

# scale

Syntax scale([x,y]) object();

Mit **scale** kann ein 2D Ojekt in der x und y Achse skaliert werden. Das ist insbesondere bei importierten Objekten wichtig.

---

# Variablen

Syntax: variable = wert;

Variablen in OpenSCAD können global oder lokal verwendet werden. Globale Variablen stehen ausserhalb von Modulen, lokale Variablen innerhalb von Modulen.

---

# For Schleifen

Syntax: for (i = [start:step:end]) { … }

Mit **for** Schleifen werden alle Befehle wiederholt ausgeführt. Der Startwert **start** der Schleife, Die Schrittweite **step** und der Endwert **end** bestimmen die Anzahl der Wiederholungen.

---

# if / else Abfragen

Syntax: if (test) { … } else { … }

Mit **if** bzw **else** Abfragen können Bedingungen getestet werden. Trifft die Bedingung zu, werden die folgenden Befehle ausgeführt. 

Trifft die Bedingung nicht zu werden die Befehle aus dem else Zweig ausgeführt. 

---

# Module

Syntax: module name( parameter ) { action }

OpenSCAD lässt sich mit eigenen Befehlen erweitern. Dazu wird der Befehl **module** benutzt. Module können Parameter besitzen 

Aufrufen lässt sich ein Modul mit: 
name( parameter values );

---

# Include 

Syntax: include <....scad>

Mit dem Befehl **include** lassen sich Bibliotheken in eigene Skripte einbinden. Bibliotheken sind nichts anderes als SCAD Skripte. Es gibt diverse Bibliotheken zu allen möglichen Schwerpunkten wie z.B.:
Gewinde, Gehäuse, Round Anything, etc.

Nähere Infos zu Bibliotheken finden sich unter https://openscad.org/libraries.html

---

# Use

Syntax: use <....scad>

Mit dem Befehl **use** lassen sich ähnlich wie mit include Bibliotheken in eigene Skripte einbinden. Der einzige Unterschied zu include ist:
Bei use werden nur Module und Funktionen aus der Bibliothek übernommen. Include übernimmt alles.

--- 

# Bibliotheken

Einige OpenSCAD Beispiel Bibliotheken:

* https://github.com/openscad/MCAD 
* https://github.com/openscad/scad-utils
* https://github.com/revarbat/BOSL
* https://github.com/JustinSDK/dotSCAD

---

# Schnellstart mit dem Customizer 

Anfangen wollen wir mit dem Customizer. Da sich OpenSCAD Modelle sehr gut parametrisieren lassen ist dies ein einfacher Einstieg, der ohne Programmierkenntnisse auskommt.

Dazu öffnen wir OpenSCAD  und laden das Skript **badge-creator.scad** aus dem Basis Tutorial Ordner.

Den Editor links im Bild schliessen wir zunächst (klick auf das x). Statt dessen benötigen wir den Customizer (Im Menü 'Windows' den Haken vor 'Hide customizer' entfernen).

---

![width:1000px](openscad1.png)


# Der Customizer

Über den Customizer lassen sich Parameter des Modells ändern, sofern der Schöpfer des Modells dies vorgesehen hat. 

In unserem Beispiel, dem badge-creator können die globalen Parameter u.a Form, Breite und Höhe des Badge. Der Text, Position, Font und Fontgröße kann für maximal 5 Textzeilen geändert werden. Zudem kann ein beliebiges SVG Logo oder ein QR Code platziert werden.

Damit lassen sich Badges für viele Anwendungszwecke individuell anpassen, ohne auch nur einzige Zeile zu programmieren.   

---

# globale Einstellungen

Zu den globalen Einstellungen zählen:
* die Form des Badge (rund, eckig oder ein SVG Bild),
* Die Abmessungen, 
* die Rundung der Ecken (bei der eckigen Form),
* Die Höhe des Textes,
* Ob der Text in die Höhe ragt oder nach unten (Gravur), 
* ein Loch für Schlüsselanhänger 
* oder Vertiefungen für Magnete (zum Einkleben)

---

# Text Einstellungen

Für jede der 5 Textzeilen kann:
* der anzuzeigende Text,
* der verwendete Font,
* die Fontgröße,
* die Position des Textes,
* die Text Rotation

eingestellt werden.

---

# Icons als Text

Auch Icons aus Icon Fonts können als Text verwendet und dargestellt werden. Der entsprechende Font muss dazu auf dem Rechner installiert werden. Sehr beliebt ist z.B. der Fontawesome Font (https://fontawesome.com/). 
Zum Einfügen der Icons ist das Cheat Sheet hilfreich (https://fontawesome.com/v5/cheatsheet/free/solid). Einfach das gewünschte Icon auswählen und per copy & paste einfügen. 

---

# Logo Einstellungen

![bg left:40% 80%](bone.svg) Als Logo können SVG Files oder Orcodes eingebunden werden. Das Logo kann ebenso frei positioniert, in der Größe skaliert und rotiert werden. 

---

# SVG als Logo

Ein SVG File als Logo sollte möglichst einfach gestaltet sein. Inkscape oder OpenSCAD können zum Erzeugen von SVG Dateien verwendet werden
Das SVG File muss im selben Ordner liegen wie das Skript.
Vorlagen zu frei verwendbaren SVG Files findet man z.B. unter:

* https://freesvg.org/

---

# Qrcode als Logo

![bg left:40% 80%](qr-code.svg) Als Logo kann auch ein QR Code eingebunden werden. Leider klappt das nicht mit SVG Files. Der Qrcode kann online unter https://ridercz.github.io/OpenSCAD-QR/ erzeugt werden. Die Daten unter qr_data werden dann per copy & paste an die entsprechende Stelle in der Datei **qrcode.scad** eingefügt. 

---

# OpenSCAD Customizer

Wie kommen nun die Parameter in das Customizer Fenster, um damit ein Modell zu parametrisieren? Ganz einfach: Sie werden am Anfang des Skripts vor dem ersten Modul als globale Variablen definiert und tauchen dadurch automatisch im Customizer auf.

---

# Customizer Syntax

Das Aussehen der Customizer Variablen kann mit Kommentaren hinter der Variable beeinflusst werden:
* combo box:  value = 0; // [0,1,2,3,4]
* slider: value = 1; // [start:step:end]
* checkbox: value = true;
* spinbox: value = 1.0; // .1
* vector: value = [0,90,-90];    

---

![bg left:40% 80%](Openscad.svg)

# Thats all folks ...


* http://www.knopper.net/bw/gdi/OpenScad-Tutorial.pdf
* https://openscad.org/documentation-articles.html#makerbot-blog
* https://www.youtube.com/watch?v=10uErKRSe8E&list=PLZ89Fw0KZGPzrNtcVRDutvuOsVAHZNa20