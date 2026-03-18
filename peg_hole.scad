include <table.scad>
;

// A hole that a joining peg will go through.
module peg_hole() {
  square(peg_hole_size, center = true);
}
