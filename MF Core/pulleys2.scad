use <zBase.scad>
include <constants.scad>

module pulleyPlate() {
	difference() {
		union() {
			cube([pulleyWidth, pulleyWidth, pulleyHeight], center=true);
		}
translate([pulleyWidth/2, 0, 0]) cube([1, pulleyWidth+.5, pulleyHeight], center=true);
translate([0, pulleyWidth/2-.1, 0]) cube([pulleyWidth, 2, pulleyHeight], center=true);

		cylinder(d=m3, h=pulleyHeight+608thick/2, center=true);
		rotate([90,0,0]) cylinder(d=rodHole-.3, h=pulleyWidth, center=true);
	}
}

module doublePulley() {
	mountBlock();
	translate([pulleyWidth-5.6, 4.4, 0]) pulleyPlate();
}

module bearingCap() {
	bearingpost=608thick+m8washerthickness*2+.2;
	difference() {
		union() {
			cylinder(d=608width+5, h=wall, center=true, $fn=40);
			translate([0,0,wall/2+bearingpost/2]) cylinder(d=608hole-.3, h=bearingpost, center=true);
		}
		translate([0,0,(wall/2 + bearingpost)/2 - wall/4]) cylinder(d=m3, h=wall+bearingpost, center=true);
		translate([0,0,-wall/4]) cylinder(d=6.5, h=4, center=true);
		
	}
	echo(bearingpost*2+wall*2+wall);
}

//doublePulley();
bearingCap();
