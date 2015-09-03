use <roundedRect.scad>
use <constants.scad>
difference() {
union() {
difference() {
union() {
cube([35,35,45], center=true);
translate([35/2+10,0,0]) cube([20,5,45], center=true);
    translate([0, 35/2+10,0]) cube([5,20,45], center=true);
    rotate([0,0,45]) translate([10,0, 0]) cube([5,25,45], center=true);

}


/*
#translate([20,-10,15]) cube([35,15,15], center=true);
    
#translate([-10,20,-15]) cube([15,35,15], center=true);
#translate([-10,20,15]) cube([15,35,15], center=true);
   */ 
translate([-10, -10, 0]) cube([15,15,50], center=true);
translate([10, 10, 0]) cube([15,15,50], center=true);
translate([10, -10, 0]) cube([15,15,50], center=true);
translate([-10, 10, 0]) cube([15,15,50], center=true);

}
   rotate([0,0,45]) translate([15,0, 0]) cube([3,30,10], center=true);

   #translate([-10,-2.5, 0]) cube([3.1,1.5,45], center=true);

   #translate([-2.5,-10, 0]) cube([1.5,3.1,45], center=true);

   #translate([20,-2.5, 15]) cube([30,1.5,3.1], center=true);
   #translate([20,-2.5, -15]) cube([30,1.5,3.1], center=true);

}
$fn=20;
#translate([0,-10,0]) rotate([0,90,0]) cylinder(d=3, h=20, center=true);

#translate([-10, 0, 0]) rotate([90,0,0]) cylinder(d=3, h=20, center=true);

// screw holes for dual bars
translate([10, 0, 15]) rotate([90,0,0]) cylinder(d=3, h=200, center=true);



translate([30, 0, 15]) rotate([90,0,0]) cylinder(d=3, h=200, center=true);
translate([10, 0, -15]) rotate([90,0,0]) cylinder(d=3, h=200, center=true);
translate([30, 0, -15]) rotate([90,0,0]) cylinder(d=3, h=200, center=true);

#translate([0, 10, 15]) rotate([90,0,90]) cylinder(d=3, h=200, center=true);
#translate([0, 30, 15]) rotate([90,0,90]) cylinder(d=3, h=200, center=true);
#translate([0, 10, -15]) rotate([90,0,90]) cylinder(d=3, h=200, center=true);
#translate([0, 30, -15]) rotate([90,0,90]) cylinder(d=3, h=200, center=true);

}
