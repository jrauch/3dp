use <zBase.scad>
include <constants.scad>

module pulleyPlate() {
	difference() {
		union() {
			cube([pulleyWidth, pulleyWidth, pulleyHeight], center=true);
		}

		cylinder(d=m3, h=pulleyHeight+608thick/2, center=true);
		rotate([90,0,0]) cylinder(d=rodHole, h=pulleyWidth, center=true);
	}
}

module doublePulley() {
	mountBlock();
	translate([pulleyWidth-.6, 9.4, 0]) pulleyPlate();
}

module bearingCap() {
	bearingpost=608thick+m8washerthickness*2+.2;
	difference() {
		union() {
			cylinder(d=pulleyWidth, h=wall, center=true, $fn=40);
			translate([0,0,wall/2+bearingpost/2]) cylinder(d=608hole, h=bearingpost, center=true);
		}
		translate([0,0,(wall/2 + bearingpost)/2 - wall/4]) cylinder(d=m3, h=wall+bearingpost, center=true);
	}
	echo(bearingpost*2+wall*2+wall);
}

doublePulley();
