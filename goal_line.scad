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
  for(i = [2:27]) {
    at_polar(distance, 180 - i * (180 / 29)) {
      circle(r);
    }
  }
}
