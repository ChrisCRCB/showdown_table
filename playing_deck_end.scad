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
      circle(goal_radius);
    translate([width / 2, 0])
      goal_line();
    // Where the screw holes start.
    holes_start = tactile_line_radius + strut_width;
    for(y = [holes_start:500:length / 2]) {
      translate([screw_inset, y])
        circle(screw_thickness);
      translate([width - screw_inset, y])
        circle(screw_thickness);
    }
  }
}

// Render the model.
playing_deck_end();
