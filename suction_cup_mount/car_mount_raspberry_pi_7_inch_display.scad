// This connects the official raspberry pi 7" display case to the suction cup mount rails

$fn=50;

internalWidth = 18;
internalHeight = 25;
internalDepth = 2;

externalX = 95;
externalY = 75;
externalDepth = 2;

// V2 with .2 mm leeway

thickness=5;

translate([externalX/2, externalY-5, externalDepth+thickness]) {
    translate([-75/2, 0, 0]) {
        mountingPoint();
    }
    translate([75/2, 0, 0]) {
        mountingPoint();
    }
}
difference() {
    translate([0, 0, 0]) {
        cube([externalX, externalY, externalDepth+thickness]);
    }
    union() {
        translate([externalX/2, -5, 0]) {
            rails(thickness);
        }
    } 
}

module rail() {
	difference() {
		translate([0, 0, -1]) {
			cube([5.2, externalY, 6.2]);
		}
		translate([2.7, -1, -0.7]) {
			cube([3, externalY+2, 3]);
		}
	}
}

module rails(thickness) {
	translate([-12, -1, 0]) {
		rail();
		translate([23, 0, 0]) {
			mirror([1, 0, 0]) {
				rail();
			}
		}
	}
}

module mountingPoint() {
    difference() {
        cylinder(6, 3.5, 3.5);
        difference() {
            translate([0, 0, -1]) {
                cylinder(5, 7, 7);
            }
            cylinder(4, 2, 2);
        }
    }
    hull() {
        cylinder(6, 2, 2);
        translate([-2, -9, 0]) {
            triangularPrism(4, 5, 6);
        }
    }
}

module triangularPrism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}
