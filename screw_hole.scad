include <table.scad>
;

// A module which represents a screw hole.
//
// This module must be added with `difference`.
module screw_hole() {
  circle(screw_radius);
}
