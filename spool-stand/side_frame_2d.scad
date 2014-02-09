// frame_2d.scad

$fn = 96;

base_width = 66;

sol_size = 2.6;
gutter = 0.1;
bearing_diameter = 22;
b_radius = bearing_diameter/2;
r_out = b_radius+sol_size;
bb_hole = r_out;

//drill = 1.6;
drill = 6+gutter;
module shape() {
	l1 = 140;
	l2 = 51;
	h = 160;
	corn = 3;
	translate([0,corn])	
	hull() {
		translate([-l1/2,0]) circle(r=corn);
		translate([l1/2,0]) circle(r=corn);
		translate([-l2/2,h]) circle(r=corn);
		translate([l2/2,h]) circle(r=corn);
	}
}

module side_frame() {
difference() {
	shape();
	translate([0,121,0])
	union() {
		circle(r=bb_hole+gutter,h=2,center=true);
		for(t=[0:2]) {
			rotate([0,0,t*120])
				translate([0,22,0])
				//circle(r=drill,center=true);
				circle(r=drill/2,center=true);
				//square([drill,drill],center=true);
		}
	}
	for(t=[0:2]) {
		translate([(1-t)*base_width/2,11,0])
		circle(r=drill/2,center=true);
	}
	translate([-base_width/2,-1])
		square([base_width+gutter,4]);
}
};

//test
//side_frame();

