use <roundedRect.scad>
tensionboltspread=12;
slotwidth=7;
slotheight=2;
$fn=25;

module nuttrap(d,h) { 
	#cylinder(d=d, h=h, center=true, $fn=6);
}


difference() {
   	roundedRect([20,12,12], 4, center=true);
	#rotate([90,0,90]) cube([slotwidth,12.5,slotheight], center=true);
	translate([tensionboltspread/2,0,0]) cylinder(d=3.3, h=100, center=true);
	translate([-tensionboltspread/2,0,0]) cylinder(d=3.3, h=100, center=true);

translate([-tensionboltspread/2,0,12/2-2]) nuttrap(d=5.5, h=4.01);

translate([tensionboltspread/2,0,12/2-2]) nuttrap(d=5.5, h=4.01);

}

