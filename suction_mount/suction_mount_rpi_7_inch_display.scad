// This connects the official raspberry pi 7" display case to the suction cup mount rails

$fn=50;

use <../modules/mountingPoint.scad>
use <suction_mount_starter.scad>

externalX = 95;
externalY = 75;
externalDepth = 2;

thickness=5;

translate([0, externalY-5, externalDepth+thickness]) {
    distanceBetweenPoints = 75;
    translate([-distanceBetweenPoints/2, 0, 0]) {
        mountingPoint(7, 5, 4, 4, 2);
    }
    translate([distanceBetweenPoints/2, 0, 0]) {
        mountingPoint(7, 5, 4, 4, 2);
    }
}
difference() {
    translate([-externalX/2, 0, 0])
        cube([externalX, externalY, externalDepth+thickness]);
    rails(65);
}
