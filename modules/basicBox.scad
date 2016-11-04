module basicBox(innerX, innerY, innerZ, thickness) {
    translate([-innerX/2-thickness, -innerY/2-thickness, 0]) {
        cube([innerX+2*thickness, innerY+2*thickness, thickness]); // bottom
        cube([innerX+2*thickness, thickness, innerZ+3*thickness]); //front
        cube([thickness, innerY+2*thickness, innerZ+3*thickness]); // left
        translate([0, innerY+thickness, 0])
            cube([innerX+2*thickness, thickness, innerZ+3*thickness]); // back
        translate([innerX+thickness, 0, 0])
            cube([thickness, innerY+2*thickness, innerZ+3*thickness]); // right
    }
}

module basicLid(innerX, innerY, innerZ, thickness) {
    translate([-innerX/2-thickness, -innerY/2-thickness, 0]) {
        translate([0, -innerY-thickness-thickness-thickness, 0]) {
            cube([innerX+2*thickness, innerY+2*thickness, thickness]);
            translate([thickness, thickness, 0])
                cube([innerX, innerY, thickness*2]);
        }
    }
}

basicBox(30, 20, 10, 2);
basicLid(30, 20, 10, 2);

translate([30/2+5, -20/2, 0])
    cube([30, 20, 10]);