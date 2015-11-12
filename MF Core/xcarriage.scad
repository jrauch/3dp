include <constants.scad>

echo(xCarriageWidth);
channel=xCarriageWidth-(lmu8width*2)-wall*2-2*wall;
echo(channel);

module hotendMount() {
	translate([0,0,-hotendMountHeight/2]) cylinder(d=hotendMount, h=hotendMountHeight, center=true);
	cylinder(d=10, h=60, center=true);
	for(i=[0:360/6:360]){
		rotate([0,0,i]) translate([hotendMount/2+4,0,0]) cylinder(d=3, h=100, center=true);
	}
}



module xCarriage() {

	difference() {
		cube([xCarriageLength, xCarriageWidth, lmu8width+wall], center=true);
		translate([0,-10,(lmu8width+wall)/2+12]) rotate([45,0,0]) cube([xCarriageLength, channel+.01, lmu8width+wall+.1], center=true);
		translate([0,10,(lmu8width+wall)/2+12]) rotate([-45,0,0]) cube([xCarriageLength, channel+.01, lmu8width+wall+.1], center=true);

		rotate([0,90,0]) translate([0,-xRodSpread/2,0]) cylinder(d=lmu8width, h=xCarriageLength+.1, center=true);
		rotate([0,90,0]) translate([0,xRodSpread/2,0]) cylinder(d=lmu8width, h=xCarriageLength+.1, center=true);
		//translate([0,0,-hotendMountHeight/2]) cylinder(d=hotendMount, h=hotendMountHeight, center=true);
		//cylinder(d=10, h=40, center=true);
		//	translate([0,15,0]) cylinder(d=5, h=40, center=true);
		//		translate([0,-15,0]) cylinder(d=5, h=40, center=true);
		//translate([-20,15,0]) cylinder(d=5, h=40, center=true);
		//		translate([0,-15,0]) cylinder(d=5, h=40, center=true);
	#	rotate([0,0,30]) translate([-20,0,0]) cylinder(d=12.2, h=40, center=true);

		//translate([20,0,0]) cylinder(d=5, h=40, center=true);
		rotate([0,0,-30]) translate([-20,0,0]) cylinder(d=12.2, h=40, center=true);
		//rotate([0,0,90]) translate([-14,0,0]) cylinder(d=12.2, h=40, center=true);
		//rotate([0,0,-90]) translate([-14,0,0]) cylinder(d=12.2, h=40, center=true);

	#	rotate([180,0,0]) translate([0,0,(lmu8width+wall)/2]) hotendMount();
		translate([0,0,0])
		for(i=[0:360/6:360]) {
			rotate([0,0,i]) translate([12,0,(lmu8width+wall)/2]) nuttrap(h=9);
		}
		// belt mounts
		translate([xCarriageLength/2-5,0,0]) cylinder(d=3, h=100, center=true);
		translate([-(xCarriageLength/2-5),0,0]) cylinder(d=3, h=100, center=true);


		translate([0,xCarriageWidth/2, 0]) cube([xCarriageLength, 20, 2], center=true);
		translate([0,-xCarriageWidth/2, 0]) cube([xCarriageLength, 20, 2], center=true);
		for(i=[-20:20:20]) {
			translate([i,(xCarriageWidth/2-5), 0]) {
		#		cylinder(d=3, h=50, center=true);
				translate([0,0,(lmu8width+wall)/2]) nuttrap(h=5);
			}
			translate([i,-(xCarriageWidth/2-5), 0]) {
				cylinder(d=3, h=50, center=true);
				translate([0,0,(lmu8width+wall)/2]) nuttrap(h=5);
			}
		}
	}
}

module hotendRetainer() {
	difference() {
		cylinder(r=hotendMount, h=hotendGrooveHeight, center=true, $fn=40);
		#translate([0,0,hotendGrooveHeight+10]) hotendMount();
		cylinder(d=hotendGrooveDiameter, h=hotendGrooveHeight+1, center=true, $fn=40);
		rotate([0,0,30]) translate([0, 10, 0]) cube([hotendGrooveDiameter, 20, hotendGrooveHeight+10], center=true);
	}
}
xCarriage();
rotate([0,0,60]) translate([0,0,-30]) hotendRetainer();
