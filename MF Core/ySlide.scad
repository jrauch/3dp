include <constants.scad>

module ySlide() {
	difference() {
		translate([0,-5,0]) cube([yBlockLen, yslideWidth+10, yslideWidth], center=true);
		rotate([0,90,0]) cylinder(d=lmu8width, h=yBlockLen+.1, center=true, $fn=40);
		translate([608width/2+beltthickness/2,0,yslideWidth/2-wall/4]) cylinder(d=m3, h=wall, center=true);
		translate([(608width/2+beltthickness/2),0 ,(yslideWidth/2-wall/4)-wall/2]) cylinder(d=m3*2, h=wall/2, center=true);

		translate([-(608width/2+beltthickness/2),-gt2pulleydia/2+beltthickness/2,-(yslideWidth/2-wall/4)]) cylinder(d=m3, h=wall, center=true);
		translate([-(608width/2+beltthickness/2),-gt2pulleydia/2+beltthickness/2,-(yslideWidth/2-wall/4)+wall]) cylinder(d=m3*2, h=wall, center=true);
		#translate([xRodSpread/2,-10-yslideWidth/2,0]) rotate([90,0,0]) cylinder(d=rodHole, h=20, center=true);
		#translate([-(xRodSpread/2),-10-yslideWidth/2,0]) rotate([90,0,0]) cylinder(d=rodHole, h=20, center=true);

	}
}

ySlide();