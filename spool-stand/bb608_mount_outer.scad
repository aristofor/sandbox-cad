// bb608_mount_outer.scad
// 2014-02-08 Aristofor K
// Cadre de montage pour roulement à bille 608

$fn = 96;

// grips intérieurs : nombre de dents
nb_teeth = 30;
// dimensions des grips
grip_depth = 2;
grip_hole = 1;

///////////////////////////////////////////////////////////////////////////////

module grip_subs(num, r1, r2, hole_w, height) {
	wall = r1-r2;
	for (t=[0:num]) {
		rotate([0,0,t*360/num])
		translate([-hole_w/2,r2-wall-1,0])
		cube([hole_w,wall+grip_depth,height]);
	}
	cylinder(r=r2,h=height);
}

module bb608_mount_outer(ssize=3,gutter=0.1,flange_height=2) {
	// ssize: épaisseur de l'anneau de circonférence
	// gutter : espacement pour l'insertion du roulement irl
	//          (ajouté au diamètre intérieur du cadre)
	// dimensions du rebord
	// flange_height = hauteur du rebord
	flange_width = 2;
	
	// dimensions du roulement 608
	bearing_diameter = 22;
	bearing_height = 7;

	b_radius = bearing_diameter/2;
	r_in = b_radius+gutter;
	r_out = b_radius+ssize;
difference() {
	cylinder(r=r_out,h=bearing_height+flange_height);

	translate([0,0,flange_height>0?flange_height:-1])
		grip_subs(nb_teeth,r_out,r_in,grip_hole,bearing_height+2);
	if (flange_height>0) {
		translate([0,0,flange_height])
			cylinder(r=r_in,h=bearing_height+flange_height+1);
		translate([0,0,-1])
			cylinder(r=b_radius-flange_width,h=flange_height+2);
	}
}
}

// test
//bb608_mount_outer();
//bb608_mount_outer(ssize=2.6,flange_height=0);

