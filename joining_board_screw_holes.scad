include <table.scad>
;
include <screw_hole.scad>
;

// The screw holes which attach the playing deck to the joining boards.
module joining_board_screw_holes() {
  // The bottom left screw hole.
  translate([screw_inset, screw_inset])
    screw_hole();
  // The top left screw hole.
  translate([screw_inset, joining_board_width - screw_inset])
    screw_hole();
  // The top right screw hole.
  translate([width - screw_inset, joining_board_width - screw_inset])
    screw_hole();
  // The bottom right screw hole.
  translate([width - screw_inset, screw_inset])
    screw_hole();
}
