include <table.scad>
;
include <horizontal_strut_positions.scad>
;
include <strut_join.scad>
;
include <peg.scad>
;

// A vertical strut.
//
// These struts will lie either side of the goal, and travel from y = 0 to y = `(length / 2)`.
//
// They marry up with the `horizontal_strut` model by way of square cutouts in the struts which lock together.
module vertical_strut() {
  difference() {
    union() {
      // First, create the plank.
      square([strut_width, length / 2]);
      // Next, place the peg so that it marries up with the holes either side of the goal.
      translate([strut_width, screw_inset])
        peg();
    }
    // Now, add the joins to marry up with the horizontal struts.
    //
    // The cutouts will be in the opposite side of the model to the pegs, so they can sit atop the horizontal struts.
    horizontal_strut_positions()
      strut_join();
    // Finally, cut out a space for the joining boards to sit.
    translate([strut_width / 2, (length / 2) - narrowest_joining_board])
      square([strut_width / 2, narrowest_joining_board]);
  }
}

vertical_strut();
