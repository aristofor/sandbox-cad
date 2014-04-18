// y_endstop_holder.scad
// 2014-04-18 Aristofor K
// reprap asimov : support pour y-endstop

d1=1;
d2=2;

$fn=24;

module gliziere() {
	hull() {
		translate([0,8,-d1])
			cylinder(r=3.3/2,h=4.7+d2);
		cylinder(r=3.3/2,h=4.7+d2);
	}
}

module base() {
	difference() {
		cube([20,25+17.8,4.7]);
		translate([20,25,-d1])
			rotate([0,0,15])
			cube([20,25+17.8,4.7+d2]);

		translate([5.5,5.5,0]) {
			gliziere();
			translate([9,0,0])
				gliziere();
		}
	}
}

module holder() {
	difference() {

		union() {
			cube([5.5,17.8,27.5]);
			translate([5.5,0,0])
				cube([3.3,5.5,27.5]);
		}

		translate([-d1,9,11])
			rotate([90,0,90])
			cylinder(r=2.7/2,h=5.5+d2);
		translate([-d1,9,20])
			rotate([90,0,90])
			cylinder(r=2.7/2,h=5.5+d2);

	}	
}


base();
translate([5.5,25,0])
	holder();

