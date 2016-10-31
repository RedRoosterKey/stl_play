use <../modules/hullBox.scad>

innerX=35;
innerY=18;
innerZ=5;
thickness=1;

usbFemaleX=15;
usbFemaleY=13.5;
usbFemaleZ=7;

usbMaleX=innerX+2+thickness*2;
usbMaleY=12;
usbMaleZ=5;

difference() {
    hullBoxClosed(innerX, innerY, innerZ, thickness);
    union() {
        translate([-innerX/2-thickness-1, -usbFemaleY/2, thickness+1])
            cube([usbFemaleX, usbFemaleY, usbFemaleZ]);
        translate([-innerX/2-thickness-1, -usbMaleY/2, thickness])
            cube([usbMaleX, usbMaleY, usbMaleZ]);
        translate([-innerX/2-2, -innerY/2, thickness+1])
            cube([innerX+1, innerY, 1]);
    }
}