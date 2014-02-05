// bb608_mount_outer.scad
// 2014-02-05 Aristofor K
// Cadre de montage pour roulement à bille 608

$fn = 96;

// épaisseur de matière à ajouter à l'extérieur
sol_size = 3;

// dimensions du rebord
flange_height = 2;
flange_width = 2;

// espacement pour l'insertion du roulement irl
// (ajouté au diamètre intérieur du cadre)
gutter = 0.1;

// dimensions du roulement
bearing_diameter = 22;
bearing_height = 7;

// grips intérieurs : nombre de dents
nb_teeth = 30;
// dimensions des grips
grip_depth = 2;
grip_hole = 1;

///////////////////////////////////////////////////////////////////////////////

b_radius = bearing_diameter/2;
r_in = b_radius+gutter;
r_out = b_radius+sol_size;

module grip_subs(num, r1, r2, hole_w, height) {
	// z overhead : height+1
	wall = r1-r2;
	for (t=[0:num]) {
		rotate([0,0,t*360/num])
		translate([-hole_w/2,r2-wall-1,0])
		cube([hole_w,wall+grip_depth,height+1]);
	}
}

module bb608_mount_outer() {
	difference() {
	cylinder(r=r_out,h=bearing_height+flange_height);
	translate([0,0,flange_height])
		grip_subs(nb_teeth,r_out,r_in,grip_hole,bearing_height+1);
	translate([0,0,flange_height])
		cylinder(r=r_in,h=bearing_height+flange_height+1);
	translate([0,0,-1])
		cylinder(r=b_radius-flange_width,h=flange_height+2);
	}
}

// test
//bb608_mount_outer();

