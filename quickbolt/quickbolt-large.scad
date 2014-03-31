$fn=50;
union() 
{
	difference() 
	{
		union() 
		{
			cylinder(h = 5, r = 9, center=true);
			translate([0,0,2.5]) cylinder(h=5, r=5.1, center=true);
		}

		translate ([0,0,2.5]) cylinder(h=5, r=4.2, center=true);

		for ( i = [0:36:359] ) rotate ([0,0,i])
		{
			translate([0, 9.5, -2.5])
				#cylinder(h=5.01, r = 1.5);
		}
	}

	cylinder(h=3.5, r=2.0);
}