targets=motorMount.stl rodHolder.stl zBase.stl zTop.stl zCarrier.stl zMountPiece.stl plateTie.stl ySlide.stl xCarriage.stl rodMount.stl motorMount.stl hotendRetainer.stl
openscad=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
source=mech.scad

%.stl:
	$(openscad) -o $@ -D 'target="$(basename $@)"' $(source)

all: $(targets)

clean:
	rm $(targets)
