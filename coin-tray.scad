/*
	name: 		coin-tray.scad
	author:		Aymeric B.
	date:		20.06.2014
*/


/****** PARAMETERS ****/
$fn = 50;
print = 1;
thickness = 3;
clearance = 0.1;

// Coins dimensions array (5 cts, 50 cts, 10 cts, 20 cts, 1 chf, 2 chf, 5 chf)
coins_diameter = [17.15, 18.20, 19.15, 21.05, 23.20, 27.40, 31.45];
tray_height = [124, 62, 74, 84, 78, 108, 120];


/****** MODULES ****/
module Base(diameter) {
	cylinder(r=diameter/2+thickness, h=thickness);
	translate([0, -diameter/2-thickness, 0]) cube([diameter/2+thickness, diameter+2*thickness, thickness]);
}

module HalfPipe(diameter, height) {
	y_offset = -diameter/2-thickness;
	difference() {
		translate([0, y_offset, 0]) cube([diameter/2+thickness, diameter+2*thickness, height+diameter]);
		cylinder(r=diameter/2+clearance, h=height+diameter+2*thickness);
		translate([0, 0, height+thickness]) cylinder(r=diameter/2+1, h=1);
	}
}

module Tray(diameter, height) {
	union() {
		Base(diameter);
		HalfPipe(diameter, height);
	}
}

module Draw(index) {
	if (index>=0 && index<len(coins_diameter)) {
		echo ("Call Tray(x, y)");
		Tray(coins_diameter[index], tray_height[index]);
	} else {
		echo ("ERROR: index is out of the limits");
	}
}


/****** RENDERS ****/
Draw(print);