// assembly.scad
// 2014-02-09 Aristofor K

include <spool.scad>
include <side_frame_2d.scad>
include <bottom_frame_2d.scad>
include <side_bracket.scad>

ssize=2.6;

inner_width = spool_thickness+12;
plate_thickness = 3;

module side_frame_3d() {
color("indigo",0.75)
	rotate([90,0,90])
		linear_extrude(height=plate_thickness) side_frame();
color("coral")
	translate([plate_thickness+ssize,0,121])
		rotate([0,-90,0])
		side_bracket(ssize);
}

module bottom_frame_3d() {
	color("indigo",0.75)
		linear_extrude(height=plate_thickness)
		bottom_frame_2d(inner_width,66);
}

translate([inner_width/2,0,0])
	side_frame_3d();

mirror([1,0,0])
translate([inner_width/2,0,0])
	side_frame_3d();

translate([0,0,ssize])
	bottom_frame_3d();

color("Black",0.5)
	translate([-spool_thickness/2,0,121])
	rotate([0,90,0])
	spool();

