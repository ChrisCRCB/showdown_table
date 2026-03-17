include <table.scad>
;

// The pieces of wood which go horizontally beneath the playing surface.
//
// These lengths must be wide enough to encompass both the playing deck, and the walls which they will support.
module horizontal_strut() {
  difference() {
    // First, create the plank.
    square([wall_thickness + width + wall_thickness, strut_width]);
    // The left side screw hole which the wall will be anchored to.
    translate([wall_thickness / 2, strut_width / 2])
      circle(screw_thickness);
    // The right side screw hole which the wall will be anchored to.
    translate([wall_thickness + width + (wall_thickness / 2), strut_width / 2])
      circle(screw_thickness);
    // The left side screw hold which the playing deck will be anchored to.
    translate([wall_thickness + screw_inset, strut_width / 2])
      circle(screw_thickness);
    // The right side screw hold which the playing deck will be anchored to.
    translate([wall_thickness + width - screw_inset, strut_width / 2])
      circle(screw_thickness);
    // The screw hole to the left of the goal to support the vertical struts.
    translate([wall_thickness + (width / 2) - tactile_line_radius - strut_width / 2, strut_width / 2])
      circle(screw_thickness);
    // The screw hole to the right of the goal to support the vertical struts.
    translate([wall_thickness + (width / 2) + tactile_line_radius + strut_width / 2, strut_width / 2])
      circle(screw_thickness);
  }
}

horizontal_strut();
