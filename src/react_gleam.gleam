// IMPORTS --------------------------------------------------------------------

import react_gleam/element.{Element}

// GENERAL --------------------------------------------------------------------

pub external fn render(app: Element, root: String) -> Nil =
  "./ffi.mjs" "render"
