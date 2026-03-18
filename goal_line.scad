include <table.scad>
;
/// Converts polar coordinates (distance + angle in degrees) to an (X,Y) point.
/// OpenSCAD trig functions expect degrees, so no unit conversion is required.
function polar_point(distance, angle) =
  [distance * cos(angle), distance * sin(angle)];

/// Places passed children at the point defined by distance and angle (degrees).
module at_polar(distance, angle) {
  translate(polar_point(distance, angle))
    children();
}

// Create equidistant circles in a 180 degree arc.
//
// The circles should have a radius of 3mm and be centres 197mm from the origin.
//
// If you were drawing this yourself, you could use a compass. The holes - when connected - will draw a semicircle.
module goal_line() {
  r = 3;
  distance = tactile_line_radius - r;

  // Target a 3 mm edge-to-edge gap between neighbouring holes.
  target_edge_gap = 3;
  target_center_spacing = 2 * r + target_edge_gap;

  // Convert desired center spacing into an angular step on this arc.
  target_step = 2 * asin(target_center_spacing / (2 * distance));
  divisions = round(180 / target_step);

  // Keep the same style as before: skip two division points at each end.
  for(i = [2:divisions - 2]) {
    at_polar(distance, 180 - i * (180 / divisions)) {
      circle(r);
    }
  }
}
