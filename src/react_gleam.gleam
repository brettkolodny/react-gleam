// IMPORTS --------------------------------------------------------------------

// TYPES ----------------------------------------------------------------------

pub external type Element
pub external type Context(a)


// GENERAL --------------------------------------------------------------------

pub external fn render(app: Element, root: String) -> Nil =
  "./ffi.mjs" "render"

// CONTEXT --------------------------------------------------------------------

// XXX not sure if this is useful
pub external fn set_context(key: String, value: g) -> Nil =
  "./ffi.mjs" "setContext"

