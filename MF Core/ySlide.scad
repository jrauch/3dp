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
yslideWidth=lmu8width+wall;
gt2pulleydia=10;

m8washerthickness=1.6;
yBlockLen=lmu8len*3+wall;

module ySlide() {
	difference() {
		translate([0,-5,0]) cube([yBlockLen, yslideWidth+10, yslideWidth], center=true);
		rotate([0,90,0]) cylinder(d=lmu8width, h=yBlockLen+.1, center=true, $fn=40);
		translate([608width/2+beltthickness/2,0,yslideWidth/2-wall/4]) cylinder(d=m3, h=wall, center=true);
		translate([(608width/2+beltthickness/2),0 ,(yslideWidth/2-wall/4)-wall/2]) cylinder(d=m3*2, h=wall/2, center=true);
		
		translate([-(608width/2+beltthickness/2),-gt2pulleydia/2+beltthickness/2,-(yslideWidth/2-wall/4)]) cylinder(d=m3, h=wall, center=true);
		translate([-(608width/2+beltthickness/2),-gt2pulleydia/2+beltthickness/2,-(yslideWidth/2-wall/4)+wall]) cylinder(d=m3*2, h=wall, center=true);
		#translate([yBlockLen/2-wall*2,-10-yslideWidth/2,0]) rotate([90,0,0]) cylinder(d=rodHole, h=20, center=true);
		#translate([-(yBlockLen/2-wall*2),-10-yslideWidth/2,0]) rotate([90,0,0]) cylinder(d=rodHole, h=20, center=true);

	}
}
difference() {
	union() {
ySlide();
//#translate([(yBlockLen/2-lmu8len/2),0,0]) rotate([0,90,0]) cylinder(d=lmu8width, h=lmu8len, center=true);

//#translate([-(yBlockLen/2-lmu8len/2),0,0]) rotate([0,90,0]) cylinder(d=lmu8width, h=lmu8len, center=true);
}
//translate([0,0,-yslideWidth/2]) cube([yBlockLen, yslideWidth, yslideWidth], center=true);
}