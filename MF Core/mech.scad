use <pulleys2.scad>
use <ySlide.scad>
use <nema17.scad>
rotate([0,0,90]) translate([0,-25.5,0]) ySlide();
translate([0,50,0]) doublePulley();

rotate([90,0,0]) translate([25.5,0,0]) cylinder(d=8, h=200, center=true);

translate([25.5,100,0])  
difference() {
	cube([60,60,10], center=true);
	rotate([0,0,-45]) nema17Holes(15, true, 10, -45);
}