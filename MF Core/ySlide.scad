include <constants.scad>

module ySlide() {
	difference() {
		union() {
		translate([0,0,0]) cube([yBlockLen, yslideWidth+15, yslideWidth], center=true);
		translate([xRodSpread/2,-(yslideWidth+15)/2,0]) cube([rodHole+11.8,yslideWidth,yslideWidth], center=true);
		translate([-xRodSpread/2,-(yslideWidth+15)/2,0]) cube([rodHole+11.8,yslideWidth,yslideWidth], center=true);

		}
	#	rotate([0,90,0]) cylinder(d=lmu8width, h=yBlockLen+.1, center=true, $fn=40);
	#	translate([-(608width/2+beltthickness/2),0,yslideWidth/2-wall/4]) cylinder(d=m3, h=wall, center=true);
		translate([-(608width/2+beltthickness/2),0 ,(yslideWidth/2-wall/4)-wall/2]) cylinder(d=m3*2, h=wall/2, center=true);
diff=(608width/2-gt2pulleydia/2);
echo(diff);
		#translate([(608width/2+beltthickness/2),-(gt2pulleydia/2+beltthickness/2+diff),0]) cylinder(d=m3, h=yslideWidth+10, center=true);
		//translate([(608width/2+beltthickness/2),-(gt2pulleydia/2+beltthickness/2),-(yslideWidth/2-wall/4)+wall]) cylinder(d=m3*2, h=wall, center=true);

		translate([xRodSpread/2,-10-yslideWidth/2,0]) rotate([90,0,0]) cylinder(d=rodHole, h=20, center=true);
		#translate([-(xRodSpread/2),-10-yslideWidth/2,0]) rotate([90,0,0]) cylinder(d=rodHole, h=20, center=true);
	#translate([0,(yslideWidth+15)/2,0]) cube([yBlockLen+1, 21, 1], center=true);
	translate([0,(yslideWidth+15)/2-5,0]) {
	cylinder(d=3, h=yslideWidth+5, center=true);
translate([0,0,yslideWidth/2]) nuttrap(h=5);
translate([0,0,-yslideWidth/2]) cylinder(d=m3bolthead, h=m3boltheight);

}
/////
translate([-(xRodSpread/2)-7,-7.5-yslideWidth/2-3,0]) rotate([0,90,0]) cylinder(d=3, h=160, center=true);

	translate([yBlockLen/2-10,(yslideWidth+15)/2-5,0]) {cylinder(d=3, h=yslideWidth+5, center=true);
translate([0,0,yslideWidth/2]) nuttrap(h=5);
translate([0,0,-yslideWidth/2]) cylinder(d=m3bolthead, h=m3boltheight);

}

	translate([-(yBlockLen/2-10),(yslideWidth+15)/2-5,0]) {
	cylinder(d=3, h=yslideWidth+5, center=true);
	translate([0,0,yslideWidth/2]) nuttrap(h=5);
	translate([0,0,-yslideWidth/2]) cylinder(d=m3bolthead, h=m3boltheight);
}


	}
	translate([0,-yslideWidth/2,0])
	difference() {
	hull() {
	translate([-(xRodSpread/2)-9.5,-7.5-yslideWidth/2 +5,-yslideWidth/2]) cube([1,10,.1], center=true);
  translate([-(xRodSpread/2),-7.5-yslideWidth/2 +5,-yslideWidth/2]) cube([3,10,10], center=true);
	translate([-(xRodSpread/2)+9.5,-7.5-yslideWidth/2 +5,-yslideWidth/2]) cube([1,10,.1], center=true);
	}
	translate([-(xRodSpread/2),-10-yslideWidth/2 +5,-yslideWidth/2+-10/4]) rotate([90,0,0]) cylinder(d=3, h=20, center=true);
	}
//	difference() {
//	translate([-(xRodSpread/2)-7.25,-7.5-yslideWidth/2,0]) cube([5.5,12,yslideWidth], center=true);
//	translate([-(xRodSpread/2)-7,-7.5-yslideWidth/2-3,0]) rotate([0,90,0]) cylinder(d=3, h=160, center=true);
	//}
}

rotate([0,180,0]) ySlide();
