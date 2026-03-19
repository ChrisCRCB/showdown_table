include <table.scad>
;

// A module which places its children where the horizontal struts will be placed.
module horizontal_strut_positions() {
  for(y = [holes_start:500:(length / 2) - narrowest_joining_board - strut_thickness]) {
    translate([0, y])
      children();
  }
}
