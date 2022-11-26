// Much of this code was lifted from 
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

// IMPORTS --------------------------------------------------------------------

import react_gleam/attribute.{Attribute}

// TYPES ----------------------------------------------------------------------

pub external type Element

// CONSTRUCTORS ---------------------------------------------------------------

pub external fn node(
  tag: String,
  attributes: List(Attribute(action)),
  children: List(Element),
) -> Element =
  "../ffi.mjs" "node"

// COMMON ELEMENTS ------------------------------------------------------------

pub external fn text(content: String) -> Element =
  "../ffi.mjs" "text"

pub fn div(
  attributes: List(Attribute(action)),
  children: List(Element),
) -> Element {
  node("div", attributes, children)
}

// CALLBACKS ------------------------------------------------------------------

// This needs to be called at the top of a custom component 
// to allow for hooks to work
// EXAMPLE:
// pub fn counter() {
//   use <- component()
//
//   let #(count, set_count) = use_state(0)
//
//   div([], int.to_string(count))
// }
pub external fn component(element: fn() -> Element) -> Element =
  "../ffi.mjs" "component"
