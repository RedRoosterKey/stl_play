// This is the basic starter file for the rails on the suction cup mount
// You can add other objects to this to bridge them to the mount

internalWidth = 18;
internalHeight = 25;
internalDepth = 2;

externalWidth = 23;
externalHeight = 36;
externalDepth = 5;

thickness=5;
difference() {
    translate([-externalWidth/2-thickness, 0, 0])
        cube([externalWidth+thickness+thickness, externalHeight+thickness+thickness, externalDepth+thickness]);
    rails(40);	
}

// provides mounting for a single rail
module rail(length) {
	difference() {
		translate([0, -1, -1])
			cube([5.2, length+1, 6.2]);
		translate([2.7, -1, -0.7])
			cube([3, length+2, 3]);
	}
}

// provides mounting for a pair of rails, separated correctly
module rails(length) {
    distanceBetweenRails = 23;
    translate([-distanceBetweenRails/2, 0, 0])
        rail(length);
    translate([distanceBetweenRails/2, 0, 0])
        mirror([1, 0, 0])
			rail(length);
}
