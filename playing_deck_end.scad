include <table.scad>;

/// A single end of the playing deck.
//
// This is a flat rectangular piece (`length / 2` x `width`), with a `goal_radius` semicircle cut out of the middle of one of the short edges, and the corners of the same end rounded to `corner_radii`. The other short edge is square.
//
// The model is 2d, so it can be rendered to a DXF file and cut out of wood with a CNC router.
module playing_deck_end() {
  // The main rectangle, with goal pocket and corner squares removed.
  union() {
    difference() {
      square([width, length / 2]);
      translate([width / 2, 0])
        circle(r=goal_radius);
      square(corner_radii - 2);
      translate([width - corner_radii + 2, 0])
        square(corner_radii - 2);
    }
    translate([corner_radii, corner_radii])
      circle(r=corner_radii);
    translate([width - corner_radii, corner_radii])
      circle(r=corner_radii);
  }
}

// Render the model.
playing_deck_end();
