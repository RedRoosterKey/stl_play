use <../modules/basicBox.scad>

$fn=50;
thickness=4;

difference() {
    basicBox(25, 24, 4, thickness);
    union() {
        // camera hole
        translate([0, 24/2-2-12.5, -1])
            cylinder(d=8, h=thickness+2);
        // cable slit
        translate([-8, -24/2-thickness-1, 4+thickness])
            cube([16, thickness+2, 1]);
        // lockBar Hole
        translate([-1.5, -24/2-thickness-1, 4+3*thickness-2-(thickness-2)/2])
            lockBarHole();
    }
}

// mounting pins
translate([-21/2, 24/2-2-12.5, thickness])
    2mmMountPoint();
translate([21/2, 24/2-2-12.5, thickness])
    2mmMountPoint();
translate([-21/2, 24/2-2, thickness])
    2mmMountPoint();
translate([21/2, 24/2-2, thickness])
    2mmMountPoint();
    
module 2mmMountPoint() {
    cylinder(d=2, h=2);
}

module lockBar() {
    translate([-2, 24+thickness*2, 0])
        cube([6, 2, 2]);
    cube([2, 24+2+thickness*2, 1]);
}

module lockBarHole() {
    cube([3, 24+2+thickness*2, 2]);
}

module lockLid() {
    difference() {
        basicLid(25, 24, 4, thickness);
        translate([-1.5, -24-12-4*thickness, thickness+(thickness-2)/2])
            %lockBarHole();
    }
}

lockLid();

translate([25/2+thickness+3, -24/2-thickness, 0]) {
    lockBar();
}