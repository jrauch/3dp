use <pulleys2.scad>
use <ySlide.scad>
use <nema17.scad>
use <zBase.scad>
use <motormount.scad>
use <xcarriage.scad>
include <constants.scad>
module rail() {
translate([25.5,0,0])  rotate([0,180,90]) ySlide();
translate([0,80,0]) doublePulley();

rotate([90,0,0]) translate([25.5,0,0]) cylinder(d=8, h=200, center=true);
rotate([0, 0, 0]) translate([10,-92.5,0]) motorMount(discs=false);

/*
translate([25.5,-92.5,25]) 
difference() {
	union() {
	cube([60,60,5], center=true);
	translate([-20, 0, 0])cube([36,60,5], center=true);
	}
	rotate([0,0,-45]) nema17Holes(15, true, 6, -45);
}
translate([0, -100, -25])cube([25,45,5], center=true);
translate([0,-100,0]) rotate([180,0,0])
 doublePulley();*/

}
echo(xRodSpread);
translate([0, 0, 0]) xCarriage();

translate([-350/2,0,0]) rail();
translate([ 350/2,0,0]) rotate([0,180,0]) rail();

rotate([0,90,0]) translate([0,-xRodSpread/2,0]) cylinder(d=8, h=400, center=true);
rotate([0,90,0]) translate([0,xRodSpread/2,0]) cylinder(d=8, h=400, center=true);
