include <table.scad>
;

// A vertical strut.
//
// These struts will lie either side of the goal, and travel from y = 0 to y = `(length / 2)`.
//
// They marry up with the `horizontal_strut` model by way of square cutouts in the struts which lock together.
module vertical_strut() {
  // Translate to the points where the horizontal struts will intersect.
  for(y = [holes_start:500:length / 2]) {
    translate([screw_inset, y])
      peg_hole();
    translate([width - screw_inset, y])
      peg_hole();
  }
}
