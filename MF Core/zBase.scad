// test
use <nema17.scad>
use <extrusion.scad>
use <belt.scad>
include <constants.scad>

module mountBlock(width=extrusion*3) {
	difference() {
		cube([extrusion + wall*2,width,extrusion*3], center=true);

		// do the cutouts for the actual extrusions
	#	translate([0,0,extrusion]) cube([extrusion+extrusionFudge, extrusionLength, extrusion+extrusionFudge], center=true);
	#	translate([0,0,-extrusion]) cube([extrusion+extrusionFudge, extrusionLength, extrusion+extrusionFudge], center=true);
		translate([0, width/2 - 10, extrusion*3/2-extrusion/2]) rotate([0, 90, 0]) cylinder(d=3, h=extrusion*2+10, center=true);
		translate([0, width/2 - 10, -(extrusion*3/2-extrusion/2)]) rotate([0, 90, 0]) cylinder(d=3, h=extrusion*2+10, center=true);
		translate([0, -(width/2 - 10), extrusion*3/2-extrusion/2]) rotate([0, 90, 0]) cylinder(d=3, h=extrusion*2+10, center=true);
		translate([0, -(width/2 - 10), -(extrusion*3/2-extrusion/2)]) rotate([0, 90, 0]) cylinder(d=3, h=extrusion*2+10, center=true);
	}
}

module motorBlock() {
	difference() {
		cube([extrusion*2+wall*2,extrusion*3, extrusion*3], center=true);
		translate([0,0,extrusion-wall-wall/4]) cube([extrusion*2, extrusionLength, extrusion+wall/2], center=true);
		translate([0,0,-(extrusion-wall-wall/4)]) cube([extrusion*2, extrusionLength, extrusion+wall/2], center=true);
		translate([10, 0, 0]) rotate([0,90,0])nema17Holes(h=25, slot=true, slength=5);
		translate([0,0,extrusion*3/2-wall/2]) cube([bearingthickness*2, bearingod*3, 10], center=true);
	}

}

module topBlock() {
	difference() {
		union() {
			difference() {
				cube([extrusion*2+wall*2,extrusion*3, extrusion*3], center=true);
				translate([0,0,extrusion-wall-wall/4]) cube([extrusion*2, extrusionLength, extrusion+wall/2], center=true);
				translate([0,0,-(extrusion-wall-wall/4)]) cube([extrusion*2, extrusionLength, extrusion+wall/2], center=true);
				translate([0,0,extrusion*3/2-wall/2]) cube([bearingthickness*2, bearingod*3, 10], center=true);
				translate([0,0,-(extrusion*3/2-wall/2)]) cube([bearingthickness*2, bearingod*3, 10], center=true);
			}
			coneheight=extrusion-bearingthickness;

			translate([extrusion,0,0]) rotate([0,90,0]) hull() {
				translate([0,0,-coneheight]) cylinder(d=m3, h=.1, center=true);
				translate([0, 0, 0]) cube([extrusion*3, extrusion*3, .1], center=true);
			}
			
			translate([-(extrusion),0,0]) rotate([0,-90,0]) hull() {
				translate([0,0,-coneheight]) cylinder(d=m3, h=.1, center=true);
				translate([0, 0, 0]) cube([extrusion*3, extrusion*3, .1], center=true);
			}
		}
		rotate([0,90,0]) cylinder(d=m3, h=45, center=true);
		
	}

}

module xPiece(front=false, width) {
	armwidth=lmu8width+wall;
	
	difference() {
		union(){
			rotate([27.5,0,0]) /*translate([-beltwidth/2 - armwidth/2 , 0, 0])*/ cube([armwidth, zRodSpread-2*wall+5.2, wall*3], center=true);
			rotate([-27.5,0,0]) /*translate([-beltwidth/2 - armwidth/2 , 0, 0])*/ cube([armwidth, zRodSpread-2*wall+5.2, wall*3], center=true);
		}
		#	translate([0, bearingod/2+1.38/2, 0]) rotate([90,90,0]) gt2_belt(6,235);
			translate([0, bearingod/2+1.38+0, 0]) cube([6,.5,35], center=true);	
			translate([0, -bearingod/2, 0]) cube([10, 5,200], center=true);
			if(front == false)
				translate([armwidth/2,0,0]) cube([armwidth, zRodSpread-2*wall+5.2, wall*10], center=true);
			else
				translate([-armwidth/2,0,0]) cube([armwidth, zRodSpread-2*wall+5.2, wall*10], center=true);
	 		rotate([0,90,0]) translate([14,25,0]) cylinder(d=m3, h=200, center=true);
	 		rotate([0,90,0]) translate([14,-25,0]) cylinder(d=m3, h=200, center=true);
	 		rotate([0,90,0]) translate([-14,25,0]) cylinder(d=m3, h=200, center=true);		
	 		rotate([0,90,0]) translate([-14,-25,0]) cylinder(d=m3, h=200, center=true);	
	 		translate([0,width/2+10/2,0]) cube([50,10,50], center=true);
	 		translate([0,-(width/2+10/2),0]) cube([50,10,50], center=true);
			rotate([0,90,0]) translate([5,0,0]) cylinder(d=m3, h=200, center=true);	
	 		rotate([0,90,0]) translate([-5,0,0]) cylinder(d=m3, h=200, center=true);	
			
	}
}

module zCarrier() {
	difference() {
		union() {
			translate([0,zRodSpread/2, -lmu8len/2]) lmu8Block();
			translate([0,zRodSpread/2, lmu8len/2]) lmu8Block();
			
			translate([0,-zRodSpread/2, -lmu8len/2]) lmu8Block();
			translate([0,-zRodSpread/2, lmu8len/2]) lmu8Block();
			// make me wider - full width then cut out belt
		//	armwidth=lmu8width+wall;
		//	rotate([27.5,0,0]) /*translate([-beltwidth/2 - armwidth/2 , 0, 0])*/ cube([armwidth, zRodSpread-2*wall+5.2, wall*3], center=true);
		//	rotate([-27.5,0,0]) /*translate([-beltwidth/2 - armwidth/2 , 0, 0])*/ cube([armwidth, zRodSpread-2*wall+5.2, wall*3], center=true);
			xPiece(width=zRodSpread/2 + lmu8width+wall);
			difference() {
			hull() {
			translate([0,-(zRodSpread/2 + lmu8width+wall-.1)+(extrusion+wall)/2,lmu8len-.1/2]) cube([extrusion+wall+.2, .1, .1], center=true);
			translate([(extrusion+wall+.2)/2,-(zRodSpread/2 + lmu8width+wall-.1),0]) cube([(extrusion+wall+.2)*2, extrusion+wall, lmu8width], center=true);
			translate([0,-(zRodSpread/2 + lmu8width+wall-.1)+(extrusion+wall)/2,-lmu8len+.1/2]) cube([extrusion+wall+.2, .1, .1], center=true);
			}
		#	translate([80,-(zRodSpread/2 + lmu8width+wall-.1),0]) cube([200, extrusion+.2, extrusion+.2], center=true);
			
		}
		difference() {
		hull(){
			translate([0,(zRodSpread/2 + lmu8width+wall-.1)-(extrusion+wall)/2,lmu8len-.1/2]) cube([extrusion+wall+.2, .1, .1], center=true);
			translate([(extrusion+wall+.2)/2,(zRodSpread/2 + lmu8width+wall-.1),0]) cube([(extrusion+wall+.2)*2, extrusion+wall, lmu8width], center=true);
			translate([0,(zRodSpread/2 + lmu8width+wall-.1)-(extrusion+wall)/2,-lmu8len+.1/2]) cube([extrusion+wall+.2, .1, .1], center=true);
			}
		#	translate([80,(zRodSpread/2 + lmu8width+wall-.1),0]) cube([200, extrusion+.2, extrusion+.2], center=true);
			
		}
		}	
		translate([0,zRodSpread/2, -lmu8len/2]) lmu8();
		translate([0,zRodSpread/2, lmu8len/2]) lmu8();
		
		translate([0,-zRodSpread/2, -lmu8len/2]) lmu8();
		translate([0,-zRodSpread/2, lmu8len/2]) lmu8();		

#		translate([0,-zRodSpread/2, -lmu8len/2]) cylinder(d=m3, h=20, center=true);
#translate([(extrusion+wall+.2)/2-10,(zRodSpread/2 + lmu8width+wall-.1+5),0]) rotate([90,0,0]) cylinder(d=m3, h=20, center=true);
#translate([(extrusion+wall+.2)/2+10,(zRodSpread/2 + lmu8width+wall-.1),0]) rotate([90,0,0]) cylinder(d=m3, h=25, center=true);
#translate([(extrusion+wall+.2)/2-10,-(zRodSpread/2 + lmu8width+wall-.1+5),0]) rotate([90,0,0]) cylinder(d=m3, h=20, center=true);
#translate([(extrusion+wall+.2)/2+10,-(zRodSpread/2 + lmu8width+wall-.1),0]) rotate([90,0,0]) cylinder(d=m3, h=25, center=true);
	}
}

module zTop() {
	translate([-(extrusion*2+wall*2)/2-wall*1.5, 0, 0]) mountBlock();
	topBlock();
}

module zBase() {
	translate([-(extrusion*2+wall*2)/2-wall*1.5, 0, 0]) mountBlock();
	motorBlock();
}

module lmu8Block() {
	difference() {
		cube([lmu8width+wall, lmu8width+wall, lmu8len], center=true);
		lmu8();
	}
}
module lmu8() {
	cylinder(d=lmu8width, h=lmu8len, center=true);
}

//zTop();
module rodHolder() {
	translate([-(extrusion*2+wall*2)/2-wall*1.5, 0, extrusion+2.5]) mountBlock(width=20);
	difference() {
	cube([(extrusion*2+wall*2)-.2, 20, 10], center=true);
#	cylinder(d=rodHole, h=300, center=true);
	translate([2,0,0]) rotate([0,90,0]) cylinder(d=m3, h=42, center=true);
	}
}

//translate([0,0,0]) zBase();
/*translate([0,-zRodSpread/2,-45/2+5])rodHolder();
translate([0,zRodSpread/2,-45/2+5])rodHolder();*/
translate([0,0,+ 300]) zTop();/*
translate([0,-zRodSpread/2,-45/2+5 + 300])rodHolder();
translate([0,zRodSpread/2,-45/2+5 + 300])rodHolder();
translate([0, 0, 255]) zCarrier();*/
//xPiece(front=true, width=zRodSpread/2 + lmu8width+wall);
