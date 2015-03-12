module roundedCube(size, radius, center=false) {
	x = size[0];
	y = size[1];
	z = size[2];

	xtrans=(center==true)?-x/2:0;
	ytrans=(center==true)?-y/2:0;
	ztrans=(center==true)?-z/2:0;


	translate([xtrans, ytrans, ztrans])
	hull() {
		translate([radius, radius, radius])
			sphere(r=radius, center=center);

		translate([radius, radius, z-radius])
			sphere(r=radius, center=center);


		translate([x - radius, radius, radius])
			sphere(r=radius, center=center);
		translate([x - radius, radius, z-radius])
			sphere(r=radius, center=center);

		translate([x - radius, y - radius, radius])
			sphere(r=radius, center=center);
		translate([x - radius, y - radius, z-radius])
			sphere(r=radius, center=center);

		translate([radius, y - radius, radius])
			sphere(r=radius, center=center);
		translate([radius, y - radius, z-radius])
			sphere(r=radius, center=center);
	}
}

module roundedRect(size, radius, center=false) {
	x = size[0];
	y = size[1];
	z = size[2];

	xtrans=(center==true)?-x/2:0;
	ytrans=(center==true)?-y/2:0;
	ztrans=(center==true)?-z/2:0;


	translate([xtrans, ytrans, ztrans])
	linear_extrude(height=z)

	hull() {
		translate([radius, radius, 0])
			circle(r=radius, center=center);

		translate([x - radius, radius, 0])
			circle(r=radius, center=center);

		translate([x - radius, y - radius, 0])
			circle(r=radius, center=center);

		translate([radius, y - radius, 0])
			circle(r=radius, center=center);
	}
}

//$fn=50;
//roundedCube([10,10,10], 1, center=false);

//translate([-10, -10, 0]) roundedRect([10,10,10], 1, center=false);