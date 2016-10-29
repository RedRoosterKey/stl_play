use <rightAnglePrism.scad>

// 
//        outerDiameter
//          --------
//          |      |\
//topHeight |      | \
//          |      |  \
//           --  --|   \
//            |  | |    \
//bottomHeight|  | |     \
//            |  | |      \
//    innerDiameter supportLength
//
module mountingPoint(outerDiameter, supportLength, innerDiameter, bottomHeight, topHeight) {
    translate([0, 0, bottomHeight])
        cylinder(h=topHeight, d=outerDiameter);
    hull() {
        cylinder(h=topHeight+bottomHeight, d=innerDiameter);
        translate([-innerDiameter/2, -outerDiameter/2-supportLength, 0]) {
            rightAnglePrism(innerDiameter, supportLength, topHeight+bottomHeight);
        }
    }
}

// example
mountingPoint(50, 40, 30, 20, 10);