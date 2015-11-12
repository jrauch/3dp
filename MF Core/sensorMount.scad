include <constants.scad>

module tab() {
  difference() {
    cube([5.5,25,5], center=true);
    translate([0,-10,0]) cylinder(d=3.1, h=6, center=true);
    translate([0,10,0]) cylinder(d=3.1, h=6, center=true);
  }
  difference() {
#  translate([0,0,7.5]) cube([5.5,5,20], center=true);
    translate([0, 0, 15]) rotate([0,90,0]) cylinder(d=3.1, h=10, center=true);
}
}

module sensorMount() {
 difference() {
   union() {
  cylinder(d=20, h=5, center=true);
  translate([20/2, 0, 0]) cube([8, 9, 5], center=true);
  }
  union() {
  cylinder(d=12.5, h=5.1, center=true);
  translate([10,0,0])  rotate([0,90,0]) cylinder(d=3, h=20, center=true);

translate([20/2+2.5,0,0])
  cube([5.5, 5, 10], center=true);
}
 }



}

//sensorMount();
translate([-30, 0, 0]) rotate([0,90,0])  tab();
