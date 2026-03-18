include <table.scad>
;
include <peg.scad>
;

// The pieces of wood which go horizontally beneath the playing surface.
//
// These lengths must be long enough to encompass both the playing deck and the walls either side.
//
// The planks will be placed with their x axes vertically, so pegs will protrude up.
module horizontal_strut() {
  difference() {
    // First, create the plank.
    square([wall_thickness + width + wall_thickness, strut_width]);
    // The left side peg which the playing deck will be anchored to.
    translate([wall_thickness + screw_inset + peg_difference, strut_width])
      peg();
    // The right side peg hold which the playing deck will be anchored to.
    translate([wall_thickness + width - screw_inset - peg_difference, strut_width / 2])
      peg_hole();
    // The screw hole to the left of the goal to support the vertical struts.
    translate([wall_thickness + (width / 2) - tactile_line_radius - strut_width / 2, strut_width / 2])
      circle(screw_thickness);
    // The screw hole to the right of the goal to support the vertical struts.
    translate([wall_thickness + (width / 2) + tactile_line_radius + strut_width / 2, strut_width / 2])
      circle(screw_thickness);
  }
}

horizontal_strut();
