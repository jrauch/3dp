use <pulleys2.scad>
use <ySlide.scad>
use <nema17.scad>
use <zBase.scad>
include <constants.scad>
module rail() {
translate([25.5,0,0])  rotate([0,180,90]) ySlide();
translate([0,80,0]) doublePulley();

rotate([90,0,0]) translate([25.5,0,0]) cylinder(d=8, h=200, center=true);

translate([25.5,-92.5,25]) 
difference() {
	union() {
	cube([60,60,5], center=true);
	translate([-20, 0, 0])cube([36,60,5], center=true);
	}
	rotate([0,0,-45]) nema17Holes(15, true, 6, -45);
}
translate([0,-100,0]) rotate([180,0,0])
 doublePulley();
}

translate([-350/2,0,0]) rail();
translate([ 350/2,0,0]) rotate([0,180,0]) rail();

rotate([0,90,0]) translate([0,-xRodSpread/2,0]) cylinder(d=8, h=400, center=true);
rotate([0,90,0]) translate([0,xRodSpread/2,0]) cylinder(d=8, h=400, center=true);
