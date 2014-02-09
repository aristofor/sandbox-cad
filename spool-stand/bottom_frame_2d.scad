// bottom_frame_2d.scad
// 2014-02-09 Aristofor K

include <spool.scad>

$fn = 96;

module bottom_frame_2d(sx,sy,gutter=0.1) {
	drill=6+gutter;
difference() {
	square([sx-gutter*2,sy],center=true);
	for(t=[0:2]) {
		translate([11-sx/2,(1-t)*sy/2])
			circle(r=drill/2,center=true);
		mirror([1,0])
		translate([11-sx/2,(1-t)*sy/2])
			circle(r=drill/2,center=true);

	}
}
}

// test
//bottom_frame_2d(111,66);

