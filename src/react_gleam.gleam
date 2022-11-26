import react_gleam/element.{Element}

pub external fn render(app: Element, root: String) -> Nil =
  "./ffi.mjs" "render"
