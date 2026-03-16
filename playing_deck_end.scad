include <table.scad>
;
include <goal_line.scad>
;

/// A single end of the playing deck.
//
// This is a flat rectangular piece (`length / 2` x `width`), with a `goal_radius` semicircle cut out of the middle of one of the short edges, and the corners of the same end rounded to `corner_radii`. The other short edge is square.
//
// The model is 2d, so it can be rendered to a DXF file and cut out of wood with a CNC router.
module playing_deck_end() {
  // The main rectangle, with goal pocket and corner squares removed.
  difference() {
    union() {
      translate([corner_radii, corner_radii]) {
        offset(delta = corner_radii) {
          square([width - (corner_radii * 2), (length / 2) - (corner_radii * 2)]);
        }
      }
      translate([0, (length / 2) - (corner_radii * 2)]) {
        square([width, corner_radii * 2]);
      }
    }
    translate([width / 2, 0])
      circle(goal_radius);
    translate([width / 2, 0])
      goal_line();
  }
}

// Render the model.
playing_deck_end();
