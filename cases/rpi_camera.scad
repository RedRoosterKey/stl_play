use <../modules/basicBox.scad>

$fn=50;
thickness=4;

overallX=25+1;
overallY=23.862+1;
overallZ=4;
distanceFromCameraToBottom=9.462;

cableDistance=18;

difference() {
    basicBox(overallX, overallY, overallZ, thickness);
    union() {
        // camera hole
        translate([0, -overallY/2+distanceFromCameraToBottom, -1])
            cylinder(d=8, h=thickness+2);
        translate([0, -overallY/2+distanceFromCameraToBottom, thickness+2])
            cube([8, 8, 8], true);
        // cable slit
        translate([-cableDistance/2, -overallY/2-thickness-1, overallZ+thickness])
            cube([cableDistance, thickness+2, overallZ+2*thickness]);
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
    cylinder(d=1.5, h=2);
}

basicLid(overallX, overallY, overallZ, thickness);