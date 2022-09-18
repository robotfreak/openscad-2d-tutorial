// OpenSCAD 2D Tutorial
//  badge-creator.scad
// (c) berlincreators.de

/* [global] */
textheight=0.2;  // [0.1:.1:0.4]
extrude3d=false;
/* [1. text line] */
txt1="<Organization>";
txt1_font="Ubuntu";
txt1_fontsize=8;
txt1_offset=[0.0,15.0];  // [-120:.1:120]
txt1_rotate=0; // [-180:1:180]

/* [2. text line] */
txt2="<Name>";
txt2_font="Ubuntu";
txt2_fontsize=8;
txt2_offset=[-17.0,3.0];   // [-120:.1:120]
txt2_rotate=0; // [-180:1:180]

/* [3. text line] */
txt3="<Info>";
txt3_font="Ubuntu";
txt3_fontsize=8;
txt3_offset=[-10.0,-15.0];   // [-120:.1:120]
txt3_rotate=0; // [-180:1:180]

/* [4. text line] */
txt4="";
txt4_font="font awesome 6 brands";
txt4_fontsize=8;
txt4_offset=[-32.0,-15.0];  // [-120:.1:120]
txt4_rotate=0; // [-180:1:180]

/* [Hidden] */
$fn=30;

module labeling() {
    if (txt1 != "") {
        translate(txt1_offset) rotate(txt1_rotate) color("black") text(txt1, font=txt1_font, size=txt1_fontsize, halign = "center", valign="center");
    }
    if (txt2 != "") {
        translate(txt2_offset) rotate(txt2_rotate) color("black") text(txt2, font=txt2_font, size=txt2_fontsize, halign = "center", valign="center");
    }
    if (txt3!="") {
        translate(txt3_offset) rotate(txt3_rotate) color("black") text(txt3, font=txt3_font, size=txt3_fontsize, halign = "center", valign="center");
    }
    if (txt4 != "") {
        translate(txt4_offset) rotate(txt4_rotate) color("black") text(txt4, font=txt4_font, size=txt4_fontsize, halign = "center", valign="center");
    }
}

if (extrude3d == true) {
    linear_extrude(textheight) labeling();
}
else {
    labeling();
}


