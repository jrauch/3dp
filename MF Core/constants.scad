nemaoffset=15;
nemaholedistance=31;
nemahole=22.8;
$fn=35;
m3=3;
zRodSpread=80;
m3borehole=2.7;
lmu8width=15.4;
lmu8len=24;
bearingthickness=8;
bearingod=10;
beltthickness=1.4;
beltwidth=6;
608width=22;
608thick=7;
608hole=8;
rodHole=8.2;
extrusion=15;
extrusionFudge=.3;
extrusionLength=400;
wall=5;
pulleyWidth=608width+beltthickness*3+10;
pulleyHeight=lmu8width+wall;
gt2pulleydia=10;
m8washerthickness=1.6;
yslideWidth=lmu8width+wall;
yBlockLen=lmu8len*3+wall;
xRodSpread=yBlockLen-wall*4;
xCarriageWidth=xRodSpread+wall+lmu8width+2*wall;
xCarriageLength=lmu8len*2.2;
hotendMount=16.3;
hotendMountHeight=3.7;
m3bolthead=5.7;
m3boltheight=3;
armwidth=lmu8width+wall;
mk2holes=209;
e3dheight=50; // roughly - not that important

module nuttrap(d=m3bolthead, h=2.4) {
	cylinder(d=d / cos(180 / 6) + 0.05, h=h, $fn=6, center=true);
}
