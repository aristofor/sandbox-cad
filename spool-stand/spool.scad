// spool.scad
// 2014-02-09 Aristofir K

// taille de la bobine mesurée
spool_thickness = 72;
spool_diameter = 204;

module spool() {
	difference() {
		cylinder(r=spool_diameter/2,h=spool_thickness);
		translate([0,0,-1])
			cylinder(r=50,h=spool_thickness+2);
	}
}

// test
// spool();

