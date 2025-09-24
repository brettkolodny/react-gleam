// IMPORTS

import gleam/option.{type Option}

// TYPES ----------------------------------------------------------------------

pub type DomElement

// FUNCTIONS ------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "setAttribute")
pub fn set_attribute(element: DomElement, name: String, value: String) -> Nil

@external(javascript, "../ffi.mjs", "getAttribute")
pub fn get_attribute(element: DomElement, name: String) -> Option(String)
