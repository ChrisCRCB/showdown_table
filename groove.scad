include <table.scad>
;
include <joining_board_screw_holes.scad>
;

// The recess that the tongue will stick into.
module groove() {
  difference() {
    square([width, groove_width]);
    joining_board_screw_holes();
  }
}

groove();
