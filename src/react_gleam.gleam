// IMPORTS --------------------------------------------------------------------

import react_gleam/element.{type Element}

// TYPES ----------------------------------------------------------------------

pub type Context

// GENERAL --------------------------------------------------------------------

@external(javascript, "./ffi.mjs", "render")
pub fn render(app: Element, root: String) -> Nil

// CONTEXT --------------------------------------------------------------------

@external(javascript, "./ffi.mjs", "setContext")
pub fn set_context(key: String, value: g) -> Nil

// COMPONENT ------------------------------------------------------------------

@external(javascript, "./ffi.mjs", "component")
pub fn component(element: fn() -> Element) -> Element
