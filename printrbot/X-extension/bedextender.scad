// 62 mm rod center to center

// 104 hole spread

// 128 bar size
use <roundedRect.scad>

bar=146;
holes=103;
rodcenter=62;
roddia=8.2;
shelf=32;
thickness=7;

slotwidth=7;
slotheight=2;

m3bolt=3;
m3boltclearance=3.2;

tensionboltspread=12;

module bedextender(side="right") {
difference() {
union() {

// main horizontal
cube([bar, thickness, thickness], center=true);

// rod holders
translate([rodcenter/2, 0, 20/2]) rotate([90,0,0]) roundedRect([15, 23, thickness], 4, center=true);

translate([-rodcenter/2, 0, 20/2]) rotate([90,0,0]) roundedRect([15, 23, thickness], 4, center=true);

// endswitch trigger mount
if (side == "left")
translate([rodcenter/2 - 25, -1, 20/2]) rotate([90,0,0]) roundedRect([15, 23, 5], 4, center=true);


//translate([-rodcenter/2, 0, 20/2]) cube([15, 10, 23], center=true);
// 25 mm from left

// slot post
if(side == "left")
translate([bar/2 - slotwidth + 1 , 0, 10]) cube([12,7,20], center=true);
else
translate([-(bar/2 - slotwidth + 1) , 0, 10]) cube([12,7,20], center=true);

}

// rod holes
rotate([90,0,0]) translate([rodcenter/2, 12.5, 0]) cylinder(d=roddia, h=90, center=true, $fn=20);

rotate([90,0,0]) translate([-rodcenter/2, 12.5, 0]) cylinder(d=roddia, h=90, center=true, $fn=20);

// end switch trigger screw hole
rotate([90,0,0]) translate([rodcenter/2 - 25, 16.5, 0]) cylinder(d=2.5, h=90, center=true, $fn=20);


// splits for clamp on 8mm rod
translate([rodcenter/2, 0, 20]) cube([2, 12, 12], center=true);

translate([-rodcenter/2, 0, 20]) cube([2, 12, 12], center=true);

// clamp holes
translate([rodcenter/2, 0, 19]) rotate([90,0,90])  cylinder(d=2.5, h=20, center=true, $fn=20);

translate([-rodcenter/2, 0, 19]) rotate([90,0,90])  cylinder(d=2.5, h=20, center=true, $fn=20);


// slots
translate([bar/2 - slotwidth + 1 , 0, 7.5]) cube([slotwidth,12,slotheight], center=true);

translate([-(bar/2 - slotwidth + 1) , 0, 7.5]) cube([slotwidth,12,slotheight], center=true);

// divots for the tensioner bolts to ride in

// left
translate([bar/2 - slotwidth + 1 , -7+1, 7.5+tensionboltspread/2]) rotate([90,0,0]) cylinder(d=m3boltclearance, h=8, $fn=20, center=true);
translate([bar/2 - slotwidth + 1 , -7+1, 7.5-tensionboltspread/2]) rotate([90,0,0]) cylinder(d=m3boltclearance, h=8, $fn=20, center=true);

// right
translate([-(bar/2 - slotwidth + 1) , -7+1, 7.5+tensionboltspread/2]) rotate([90,0,0]) cylinder(d=m3boltclearance, h=8, $fn=20, center=true);
translate([-(bar/2 - slotwidth + 1) , -7+1, 7.5-tensionboltspread/2]) rotate([90,0,0]) cylinder(d=m3boltclearance, h=8, $fn=20, center=true);


// lop off ears for posts
if(side == "left")
translate([-(bar/2 - slotwidth + 1) , 0, 0]) cube([16,11,20], center=true);
else
translate([(bar/2 - slotwidth + 1) , 0, 0]) cube([16,11,20], center=true);

}

difference() {
translate([0,20, 0]) cube([bar-28, 40, thickness], center=true);

// trim these in and butt the plate against a solid portion
translate([0,shelf, -4]) cube([bar+.1, 18, 4.1], center=true);
translate([0,shelf, 0]) cube([bar-80, 18, 10.1], center=true);
    
// clip the corners
translate([-29,shelf+3.3, 0]) rotate([0,0,25]) cube([18,18.9,10], center=true);
translate([29,shelf+3.3, 0]) rotate([0,0,-25]) cube([18,18.9,10], center=true);

// bed mounting holes
translate([holes/2, shelf, 0]) cylinder(d=2.5, h=20, center=true, $fn=20);
translate([-holes/2, shelf, 0]) cylinder(d=2.5, h=20, center=true, $fn=20);

}

}

rotate([90,0,0]) bedextender("left");