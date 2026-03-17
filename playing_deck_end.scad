include <table.scad>
;
include <goal_line.scad>
;

/// A single end of the playing deck.
//
// This is a flat rectangular piece (`length / 2` x `width`), with a `goal_radius` semicircle cut out of the middle of one of the short edges, and the corners of the same end rounded to `corner_radii`. The other short edge is square.
//
// The model is 2d, so it can be rendered to a DXF file and cut out of wood with a CNC router.
//
// The deck sits beneath everything else, so it must be expanded by `wall_thickness`.
module playing_deck_end() {
  actual_corner_radii = corner_radii + wall_thickness;
  // The main rectangle, with goal pocket and corner squares removed.
  difference() {
    union() {
      translate([actual_corner_radii, actual_corner_radii]) {
        offset(delta = actual_corner_radii) {
          square([width - (corner_radii * 2), length / 2]);
        }
      }
      translate([0, actual_corner_radii]) {
        square([wall_thickness + width + wall_thickness, length / 2]);
      }
    }
    translate([0, wall_thickness + (length / 2)])
      square([wall_thickness + width + wall_thickness, length]);
    translate([(width / 2) + wall_thickness, wall_thickness])
      circle(goal_radius);
    translate([(width / 2) + wall_thickness, wall_thickness])
      goal_line();
    translate([(width / 2) - (end_hole_width / 2), 0])
      square([wall_thickness + end_hole_width + wall_thickness, wall_thickness]);
  }
}

// Render the model.
playing_deck_end();
