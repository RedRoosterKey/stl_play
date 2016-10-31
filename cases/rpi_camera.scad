use <../modules/basicBox.scad>

$fn=50;
thickness=2;

overallX=25;
overallY=23.862;
overallZ=4;
distanceFromCameraToBottom=9.462;

difference() {
    basicBox(overallX, overallY, overallZ, thickness);
    union() {
        // camera hole
        translate([0, -overallY/2+distanceFromCameraToBottom, -1])
            cylinder(d=8, h=thickness+2);
        // cable slit
        translate([-8, -overallY/2-thickness-1, overallZ+thickness])
            cube([16, thickness+2, 1]);
        // lockBar Hole
        translate([-1.5, -overallY/2-thickness-1, overallZ+3*thickness-thickness/2*0.95-thickness/3])
            lockBarHole();
    }
}

// mounting pins
widthBetweenHoles=21;
translate([-widthBetweenHoles/2, -overallY/2+distanceFromCameraToBottom, thickness])
    2mmMountPoint();
translate([widthBetweenHoles/2, -overallY/2+distanceFromCameraToBottom, thickness])
    2mmMountPoint();
translate([-widthBetweenHoles/2, overallY/2-2, thickness])
    2mmMountPoint();
translate([widthBetweenHoles/2, overallY/2-2, thickness])
    2mmMountPoint();
    
module 2mmMountPoint() {
    cylinder(d=2, h=2);
}

module lockBar() {
    translate([-3+3*0.95/2, overallY+thickness*2, 0])
        cube([6, thickness, 2]);
    cube([3*0.95, overallY+2+thickness*2, thickness/2*0.95]);
}

module lockBarHole() {
    cube([3, overallY+2+thickness*2, thickness/2]);
}

module lockLid() {
    difference() {
        basicLid(overallX, overallY, overallZ, thickness);
        translate([-1.5, -overallY-overallY/2-4*thickness-1, thickness+thickness/3])
            lockBarHole();
    }
}

lockLid();

translate([overallX/2+thickness+3, -overallY/2-thickness, 0]) {
    lockBar();
}