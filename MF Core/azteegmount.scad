shortside=2.53*25.4;
longside=4*25.4;
holesize=.15*25.4;
postheight=2;
screwsize=3;
platethickness=5;
offsetheight=5+platethickness;
armwidth=7;
$fn=25;
diaglen=sqrt(pow(shortside,2)+pow(longside,2));
angle=atan((shortside/2)/(longside/2));

  for(a=[angle, -angle]) {
    rotate([0,0,a]) {
      difference() {
        union() {
          cube([diaglen,armwidth,platethickness], center=true);
          translate([-diaglen/2,0,0]) rotate([0,0,90-a]) translate([15,0,0])
             difference() {
             cube([30,armwidth, platethickness], center=true);
             translate([12,0,0]) cylinder(d=screwsize, h=platethickness+1, center=true);
            }
          for(b=[diaglen/2, -diaglen/2]) {
            translate([b, 0, platethickness/2+offsetheight/2+postheight/2]) cylinder(d=holesize, h=postheight, center=true);
            translate([b, 0,platethickness/2])cylinder(d=armwidth, h=offsetheight, center=true);

          }
        }
        for(b=[diaglen/2, -diaglen/2]) {
          translate([b,0,0]) cylinder(d=screwsize, h=offsetheight*2, center=true);
        }
      }
    }
  }
