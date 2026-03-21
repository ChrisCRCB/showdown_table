include <table.scad>
;

// A module which places its children where the vertical struts will be.
module vertical_strut_positions(second_offset) {
  interval = width / 4;
  translate([interval, 0])
    children();
  translate([width - interval - second_offset, 0])
    children();
}
