include <table.scad>
;
include <joining_board_screw_holes.scad>
;

// The joining board.
module joining_board() {
  difference() {
    square([width, joining_board_width]);
    joining_board_screw_holes();
  }
}

joining_board();
