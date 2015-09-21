use <pulleys2.scad>
use <ySlide.scad>
use <nema17.scad>
use <zBase.scad>
use <joint2.scad>
include <constants.scad>
module rail() {
	//translate([25.5,0,0])  rotate([0,180,90]) ySlide();
	//translate([0,80,0]) doublePulley();

	//rotate([90,0,0]) translate([25.5,0,0]) cylinder(d=8, h=200, center=true);
	/*
	translate([25.5,0,25]) 
	difference() {
	union() {
	cube([60,60,5], center=true);
	translate([-20, 0, 0])cube([36,60,5], center=true);
	}
	rotate([0,0,-45]) nema17Holes(15, true, 6, -45);
	}
	*/
	//translate([0, 0, -25])cube([25,45,5], center=true);
	rotate([0,0,0])
	pulleyPlate();
}

//rail();
module motorMount(discs=true, noMount=false) {
	joint2();
	translate([20.6,20.6,0])
	difference() {
		if(noMount == false) {
			difference() {
				translate([0,-5,0]) 
				pulleyPlate();

				translate([0,12,0]) cube([36.5,12.5,25], center=true);
				translate([0,0,10]) cube([36.5,36.2,7.5], center=true);
			}
			} else
			pulleyPlate();


			translate([pulleyWidth/2-.6,-20.5,0]) cube([1.2,85,35], center=true);
			#translate([pulleyWidth/2-.6,9,9.5/2]) rotate([0,90,0]) cylinder(d=1.9, h=20, center=true);
			#translate([pulleyWidth/2-.6,9,-9.5/2]) rotate([0,90,0]) cylinder(d=1.9, h=20, center=true);

		}
		translate([20.6,17,25]){ 
		if(noMount == false){
				difference() {
					translate([1.5,5.5,0]) cube([49.2,50,5], center=true);
					cylinder(d=3, h=100, center=true);
					rotate([0,0,-45]) nema17Holes(15, true, 6, -45);
				}
			}
		
		
			if(discs == true)
			if(noMount == false) {
				translate([27.5,30.5,2.2]) cylinder(d=30, h=.6, center=true);
				translate([-18.5,30.5,2.2]) cylinder(d=30, h=.6, center=true);
				translate([27.5,-20.5,2.2]) cylinder(d=30, h=.6, center=true);
			} else {
			/*	translate([27.5,30.5,2.2]) cylinder(d=30, h=.6, center=true);
				translate([-18.5,30.5,2.2]) cylinder(d=30, h=.6, center=true);
				translate([27.5,-20.5,2.2]) cylinder(d=30, h=.6, center=true);*/
			}

		}
	
}
	motorMount(noMount=true);
	//translate([0,100,0]) 
	//motorMount(discs=true);