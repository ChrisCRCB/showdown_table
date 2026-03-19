include <table.scad>
;
include <peg.scad>
;
include <vertical_strut_positions.scad>
;
include <strut_join.scad>
;

// The pieces of wood which go horizontally beneath the playing surface.
//
// These lengths must be long enough to encompass both the playing deck and the walls either side.
//
// The planks will be placed with their x axes vertically, so pegs will protrude upwards.
module horizontal_strut() {
  difference() {
    union() {
      // First, create the plank.
      square([wall_thickness + width + wall_thickness, strut_width]);
      // The left side peg which the playing deck will be anchored to.
      translate([wall_thickness + screw_inset + peg_difference, strut_width])
        peg();
      // The right side peg hold which the playing deck will be anchored to.
      translate([wall_thickness + width - screw_inset - peg_difference, strut_width])
        peg();
    }
    // Cutouts for vertical struts.
    //
    // The cutouts will be on the same side of the model as the pegs, so that the vertical struts can rest atop them.
    vertical_strut_positions(wall_thickness) {
      translate([0, strut_width / 2])
        strut_join();
    }
  }
}

horizontal_strut();
