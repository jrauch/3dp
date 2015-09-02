nemaoffset=15;
nemaholedistance=31;
nemahole=22.8;
$fn=25;
m3=3;

module roundedslot(length, width, h) {
	translate([length/2, 0, 0]) cylinder(d=width, h=h, center=true);
	cube([length, width, h], center=true);
	translate([-length/2, 0, 0]) cylinder(d=width, h=h, center=true);
}

module nema17Holes(h=15, slot=false, slength=10, angle=0)
{
	if(slot == true) {
	//	rotate([0,0,angle]) translate([slength/2,0,0]) cylinder(d=nemahole, h=h, center=true);
	//	rotate([0,0,angle]) cube([slength, nemahole, h], center=true);
	//	rotate([0,0,angle]) translate([-(slength/2),0,0]) cylinder(d=nemahole, h=h, center=true);
		rotate([0,0,angle]) roundedslot(slength,nemahole,90);
		for(shiftx=[nemaholedistance/2, -nemaholedistance/2], shifty=[nemaholedistance/2, -nemaholedistance/2]) {
		/*translate([shiftx+slength/2, shifty, 0]) rotate([0,0,angle]) cylinder(d=m3, h=h, center=true);
		translate([shiftx, shifty, 0]) rotate([0,0,angle]) cube([slength,m3,h], center=true);
		translate([shiftx-slength/2, shifty, 0]) rotate([0,0,angle]) cylinder(d=m3, h=h, center=true);*/
		translate([shiftx, shifty, 0]) rotate([0,0,angle]) roundedslot(slength, m3, h);
		}			
	} else {
		cylinder(d=nemahole, h=h, center=true);
		for(shiftx=[nemaholedistance/2, -nemaholedistance/2], shifty=[nemaholedistance/2, -nemaholedistance/2]) {
			translate([shiftx, shifty, 0]) cylinder(d=3, h=h, center=true);
		}
	}
}

module nema17faceplate(x,y,z, slot=false)
{
	xoffset = (x-nemaholedistance)/2;
	yoffset=(y-nemaholedistance)/2;
	echo (xoffset);
	echo (yoffset);
	difference() {
		cube([x, y, z]);
		if(slot == true) {
			translate([x/2 -3, y/2, -5]) cylinder(d=nemahole, h=15);
			# translate([x/2, y/2, z/2]) cube([6,nemahole, 15], center=true);
			#translate([x/2 +3, y/2, -5]) cylinder(d=nemahole, h=15);

			} else
			#translate([x/2, y/2, -5]) cylinder(d=nemahole, h=15);

			for(shiftx=[xoffset, x-xoffset], shifty=[yoffset,y-yoffset]) {
				if(slot == true) {
					translate([shiftx-3, shifty, -5]) cylinder(r=1.6, h=20, $fn=20);
					translate([shiftx+3, shifty, -5]) cylinder(r=1.6, h=20, $fn=20);
					#translate([shiftx, shifty, 0]) cube([6, 1.6*2, z+10], center=true);
				}
				else
				#translate([shiftx, shifty, -5]) cylinder(r=1.6, h=20, $fn=20);
			} 
		}
	}
	nema17Holes(20, true);