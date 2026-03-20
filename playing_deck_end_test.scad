include <table.scad>
;
include <playing_deck_end.scad>
;

// A smaller version of the playing deck, with only the goal and tactile line included.
module playing_deck_end_test() {
  difference() {
    playing_deck_end();
    half_way = width / 2;
    extra_x = tactile_line_radius + 20;
    extra_y = (tactile_line_radius / 2) + 20;
    square([half_way - extra_x, length]);
    translate([half_way + extra_x, 0])
      square([width, length]);
    translate([0, extra_y])
      square([width, length]);
  }
}

playing_deck_end_test();
