// IMPORTS --------------------------------------------------------------------

import react_gleam/element.{Element}

// TYPES ----------------------------------------------------------------------

pub external type Context

// GENERAL --------------------------------------------------------------------

pub external fn render(app: Element, root: String) -> Nil =
  "./ffi.mjs" "render"

// CONTEXT --------------------------------------------------------------------

pub external fn set_context(key: String, value: g) -> Nil =
  "./ffi.mjs" "setContext"

// COMPONENT ------------------------------------------------------------------

pub external fn component(element: fn() -> Element) -> Element =
  "./ffi.mjs" "component"
