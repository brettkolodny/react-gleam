import react_gleam.{component}
import react_gleam/element.{div, text}

pub fn app(name: String) {
  use <- component()

  div([], [div([], [text("hello " <> name)])])
}
