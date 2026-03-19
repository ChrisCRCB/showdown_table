include <table.scad>
;

// A module which provides the join (either additive or subtractive) for the struts which support the deck.
module strut_join() {
  square([strut_thickness, strut_width / 2]);
}
