// side_bracket.scad
// 2014-02-08 Aristofor K

include <bb608_mount_outer.scad>

$fn = 96;

// grip intérieur : nombre de dents
nb_tooth = 30;
// espacement pour l'assemblage
gutter = 0.1;

// rayon intérieur (accroches)
bearing_radius = 11;

// profondeur des grips
grip_size = 2;

// hauteur roulement
bearing_height = 7;


module mount_claw(radius=3,ssize=3,height=1) {
	intersection() {
		hull() {
			translate([sol_size,0,0])
				cylinder(r=ssize/2,h=ssize);
			cylinder(r1=ssize,r2=ssize*0.75,h=ssize);
		}
		cylinder(r1=radius*1.1,r2=radius,h=height);
	}
}

module mount_unit(ssize,plate_thickness=3) {
	d = 11;
	translate([0,0,0])
		hull() {
			translate([-1,-d/2,0])
				cube([1,d,ssize]);
			translate([d*2,0,0])
				cylinder(r=3,h=ssize);
		}
	translate([d*2,0,0])
		cylinder(r=3,h=ssize+plate_thickness);
	translate([d*2,0,ssize+plate_thickness])
		rotate([0,0,180])
		mount_claw();
}

module mounts(radius_out,ssize=3,plate_thickness=3) {
	difference() {
		for (t=[0:2]) {
			rotate([0,0,t*120])
				mount_unit(ssize,plate_thickness);
		}
		translate([0,0,-1])
		cylinder(r=radius_out-0.5,h=12);
	}
}

module side_bracket(ssize=3) {
	mounts(bearing_radius+ssize,ssize=ssize);
	bb608_mount_outer(ssize=ssize,flange_height=ssize/2);
}


// tests
//ssize = 2.6;
//mount_claw();
//mount_unit(ssize);
//mounts(bearing_radius+ssize,ssize=ssize);
//bb608_mount_outer(ssize=ssize,flange_height=ssize/2);
//side_bracket(ssize);

