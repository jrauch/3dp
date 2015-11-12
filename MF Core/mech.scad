use <pulleys2.scad>
use <ySlide.scad>
use <nema17.scad>
use <zBase.scad>
use <motormount.scad>
use <xcarriage.scad>
use <azteegmount.scad>
use <joint2.scad>
use <sensorMount.scad>
include <constants.scad>

target=0;
MODULE=target;

module rail() {
translate([25.5,0,0])  rotate([0,180,90]) ySlide();
translate([5,100,0]) rotate([180,0,0]) motorMount(noMount=true);

//translate([-5,100,0]) doublePulley();

color ("silver") rotate([90,0,0]) translate([25.5,0,10]) cylinder(d=8, h=220, center=true);
rotate([0, 0, 0]) translate([5,-110.5,0]) motorMount(discs=false);

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

if(MODULE=="mountPlate")
	mountPlate();
else
if(MODULE=="rodHolder")
	rodHolder();
else
if(MODULE == "zBase")
	zBase();
else
if(MODULE == "zTop")
	zTop();
else
if(MODULE == "zCarrier")
	zCarrier();
else
if(MODULE=="zMountPiece")
	zMountPiece();
else
if(MODULE == "plateTie")
	plateTie();
else
if(MODULE == "ySlide")
	ySlide();
else
if(MODULE == "xCarriage")
	xCarriage();
else
if(MODULE == "rodMount")
	motorMount(noMount=true);
else
if(MODULE == "motorMount")
		motorMount();
else
if(MODULE == "hotendRetainer")
	hotendRetainer();
else {
echo(xRodSpread);
translate([0, 0, 0]) xCarriage();

translate([-350/2,0,0]) rail();
translate([ 350/2,0,0]) rotate([0,180,0]) rail();

color ("silver") rotate([0,90,0]) translate([0,-xRodSpread/2,0]) cylinder(d=8, h=290, center=true);
color ("silver") rotate([0,90,0]) translate([0,xRodSpread/2,0]) cylinder(d=8, h=290, center=true);

rotate([0,0,-90]) translate([-83,0,0]) zTop();
//translate([0,-zRodSpread/2,-45/2+5 + 300])rodHolder();
//translate([0,zRodSpread/2,-45/2+5 + 300])rodHolder();
}
