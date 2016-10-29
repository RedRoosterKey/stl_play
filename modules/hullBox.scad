module hullPlane(x, y, thickness) {
    translate([thickness/2, thickness/2, thickness/2])
        hull() {
            sphere(d=thickness);
            translate([x-thickness, 0, 0])
                sphere(d=thickness);
            translate([0, y-thickness, 0])
                sphere(d=thickness);
            translate([x-thickness, y-thickness, 0])
                sphere(d=thickness);
        }
}

module hullCube(x, y, z, thickness) {
    hull() {
        hullPlane(x, y, thickness);
        translate([0, 0, z])
            hullPlane(x, y, thickness);
    }
}

module hullBox(innerX, innerY, innerZ, thickness) {
    translate([-innerX/2-thickness, -innerY/2-thickness, 0]) {
        hullCube(innerX+2*thickness, innerY+2*thickness, thickness, thickness); // bottom
        hullCube(innerX+2*thickness, thickness, innerZ+3*thickness, thickness); //front
        hullCube(thickness, innerY+2*thickness, innerZ+3*thickness, thickness); // left
        translate([0, innerY+thickness, 0])
            hullCube(innerX+2*thickness, thickness, innerZ+3*thickness, thickness); // back
        translate([innerX+thickness, 0, 0])
            hullCube(thickness, innerY+2*thickness, innerZ+3*thickness, thickness); // right
    }
}

module hullLid(innerX, innerY, innerZ, thickness) {
    translate([-innerX/2-thickness, -innerY/2-thickness, 0]) {
        translate([0, -innerY-thickness-thickness-thickness, 0]) {
            hullCube(innerX+2*thickness, innerY+2*thickness, thickness, thickness);
            translate([thickness+1, thickness+1, 0])
                hullCube(innerX-2, innerY-2, thickness*2, thickness);
        }
    }
}

hullBox(30, 20, 10, 5);
hullLid(30, 20, 10, 5);