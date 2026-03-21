include <table.scad>
;
include <goal_pocket.scad>
;
include <horizontal_strut_positions.scad>
;
include <vertical_strut_positions.scad>
;
include <goal_line.scad>
;
include <peg_hole.scad>
;
include <joining_board_screw_holes.scad>
;

/// A single end of the playing deck.
//
// This is a flat rectangular piece (`length / 2` x `width`), with a `goal_radius` semicircle cut out of the middle of one of the short edges, and the corners of the same end rounded to `corner_radii`. The other short edge is square.
//
// The model is 2d, so it can be rendered to a DXF file and cut out of wood with a CNC router.
//
// The deck sits inside the walls.
module playing_deck_end() {
  // The main rectangle, with goal pocket and corner squares removed.
  difference() {
    union() {
      translate([corner_radii, corner_radii]) {
        offset(delta = corner_radii) {
          square([width - (corner_radii * 2), 1]);
        }
      }
      translate([0, corner_radii]) {
        square([width, (length / 2) - corner_radii]);
      }
    }
    translate([width / 2, 0])
      goal_pocket();
    translate([width / 2, 0])
      goal_line();
    // The holes that the horizontal strut pegs will marry up with.
    horizontal_strut_positions() {
      translate([screw_inset, 0])
        peg_hole();
      translate([width - screw_inset, 0])
        peg_hole();
    }
    // Make the holes that the pegs at the ends of the vertical struts will go through.
    vertical_strut_positions(wall_thickness) {
      translate([0, screw_inset])
        peg_hole();
    }
    translate([0, length - joining_board_width]) {
      joining_board_screw_holes();
    }
  }
}

// Render the model.
playing_deck_end();
