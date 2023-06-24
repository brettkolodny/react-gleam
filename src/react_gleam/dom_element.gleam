// IMPORTS

import gleam/option.{Option}
import react_gleam.{DomElement}

// FUNCTIONS ------------------------------------------------------------------

pub external fn set_attribute(
  element: DomElement,
  name: String,
  value: String,
) -> Nil =
  "../ffi.mjs" "setAttribute"

pub external fn get_attribute(
  element: DomElement,
  name: String,
) -> Option(String) =
  "../ffi.mjs" "getAttribute"
