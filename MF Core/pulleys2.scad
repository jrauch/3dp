use <zBase.scad>

$fn=25;
zRodSpread=80;
m3borehole=2.7;
lmu8width=15.4;
lmu8len=24;
bearingthickness=8;
bearingod=10;
beltthickness=1.4;
beltwidth=6;
608width=22;
608thick=7;
608hole=8.2;
m3=3;
rodHole=8.2;
extrusion=15;
extrusionFudge=.2;
extrusionLength=400;
wall=5;

pulleyWidth=608width+beltthickness*3;
pulleyHeight=lmu8width+wall;
gt2pulleydia=10;

m8washerthickness=1.6;

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
	#	translate([0,0,(wall/2 + bearingpost)/2 - wall/4]) cylinder(d=m3, h=wall+bearingpost, center=true);
	}
	echo(bearingpost*2+wall*2+wall);
}

doublePulley();
//translate([pulleyWidth, 10.1, -36/2+wall]) bearingCap();