//
// Creates a right angle triangular prism with the parameters provided.
//
//    side view            front view
//
//           |             -----------
//          /|             |         |
//         / |             |         |
//        /  |             |         |
//       /   |  height     |         |
//      /    |             |         |
//     /     |             |         |
//    /      |             |         |
//   /--------             -----------
//   baseLength               width
//

module rightAnglePrism(width, baseLength, height){
   polyhedron(
           points=[[0,0,0], [width,0,0], [width,baseLength,0], [0,baseLength,0], [0,baseLength,height], [width,baseLength,height]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}


// examples
rightAnglePrism(10, 10, 10);
translate([11, 0, 0])
    rightAnglePrism(10, 20, 10);
translate([22, 0, 0])
    rightAnglePrism(10, 30, 10);
translate([33, 0, 0])
    rightAnglePrism(10, 40, 10);

translate([-11, 0, 0])
    rightAnglePrism(10, 10, 20);
translate([-22, 0, 0])
    rightAnglePrism(10, 10, 30);
translate([-33, 0, 0])
    rightAnglePrism(10, 10, 40);

translate([0, -11, 0])
    rightAnglePrism(10, 10, 10);
translate([0, -22, 0])
    rightAnglePrism(20, 10, 10);
translate([0, -33, 0])
    rightAnglePrism(30, 10, 10);