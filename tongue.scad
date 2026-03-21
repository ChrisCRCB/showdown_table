include <table.scad>
;
include <joining_board_screw_holes.scad>
;

// The tongue which sticks out to match up with the other end of the table.
module tongue() {
  difference() {
    square([width, tongue_width]);
    joining_board_screw_holes();
  }
}

tongue();
