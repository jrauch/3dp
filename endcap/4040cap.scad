pad = 0.1;	// Padding to maintain manifold
box_l = 47;	// Length
box_w = 47;	// Width
box_h = 15;	// Height
round_r = 2;	// Radius of round
smooth = 45;	// Number of facets of rounding cylinder

extrusion_hw = 40.5; // size of extrusion, plus margin
slot_width = 8.2; // size of slot
cap_height = 20;

// To fix the corners cut the main cube with smaller cubes with spheres removed
difference() {
	cube([box_l, box_w, box_h], center = true);

	translate([0, -box_w/2+round_r, box_h/2-round_r]) {
		difference() {
			translate([0,-round_r-pad,round_r+pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([0, box_w/2-round_r, box_h/2-round_r]) {
		difference() {
			translate([0,round_r+pad,round_r+pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([0, -box_w/2+round_r, -box_h/2+round_r]) {
		difference() {
			translate([0,-round_r-pad,-round_r-pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([0, box_w/2-round_r, -box_h/2+round_r]) {
		difference() {
			translate([0,round_r+pad,-round_r-pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

// ----

	translate([-box_l/2+round_r, box_w/2-round_r, 0]) {
		difference() {
			translate([-round_r-pad,round_r+pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, box_w/2-round_r, 0]) {
		difference() {
			translate([round_r+pad,round_r+pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

	translate([-box_l/2+round_r, -box_w/2+round_r, 0]) {
		difference() {
			translate([-round_r-pad,-round_r-pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, -box_w/2+round_r, 0]) {
		difference() {
			translate([round_r+pad,-round_r-pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

// ----

	translate([-box_l/2+round_r, 0, box_h/2-round_r]) {
		difference() {
			translate([-round_r-pad, 0, round_r+pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, 0, box_h/2-round_r]) {
		difference() {
			translate([round_r+pad, 0, round_r+pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([-box_l/2+round_r, 0, -box_h/2+round_r]) {
		difference() {
			translate([-round_r-pad, 0, -round_r-pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, 0, -box_h/2+round_r]) {
		difference() {
			translate([round_r+pad, 0, -round_r-pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

// ----

	translate([box_l/2-round_r, box_w/2-round_r, box_h/2-round_r]) {
		difference() {
			translate([round_r+pad, round_r+pad, round_r+pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	translate([-box_l/2+round_r, box_w/2-round_r, box_h/2-round_r]) {
		difference() {
			translate([-round_r-pad, round_r+pad, round_r+pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, -box_w/2+round_r, box_h/2-round_r]) {
		difference() {
			translate([round_r+pad, -round_r-pad, round_r+pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	translate([-box_l/2+round_r, -box_w/2+round_r, box_h/2-round_r]) {
		difference() {
			translate([-round_r-pad, -round_r-pad, round_r+pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}

	translate([box_l/2-round_r, box_w/2-round_r, -box_h/2+round_r]) {
		difference() {
			translate([round_r+pad, round_r+pad, -round_r-pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	translate([-box_l/2+round_r, box_w/2-round_r, -box_h/2+round_r]) {
		difference() {
			translate([-round_r-pad, round_r+pad, -round_r-pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, -box_w/2+round_r, -box_h/2+round_r]) {
		difference() {
			translate([round_r+pad, -round_r-pad, -round_r-pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	translate([-box_l/2+round_r, -box_w/2+round_r, -box_h/2+round_r]) {
		difference() {
			translate([-round_r-pad, -round_r-pad, -round_r-pad])
				cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
			sphere(round_r,center=true,$fn=smooth);
		}
	}
	difference() {
		translate([0,0,5]) cube([40.5,40.5,20], center=true);
		translate([extrusion_hw/2 - slot_width/2,0,5]) color("red") cube([slot_width, slot_width,20], center=true);
		translate([-(extrusion_hw/2 - slot_width/2),0,5]) cube([slot_width,slot_width,20], center=true);
		translate([0, extrusion_hw/2 - slot_width/2,5]) cube([slot_width,slot_width,20], center=true);
		translate([0, -(extrusion_hw/2 - slot_width/2),5]) cube([slot_width,slot_width,20], center=true);
	}
}
