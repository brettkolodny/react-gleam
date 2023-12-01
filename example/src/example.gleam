import react_gleam.{render}
import react_gleam/element.{div, h1, h2, text}
import counter.{counter}

pub fn main() {
  render(app(), "#app")
}

fn app() {
  div(
    [],
    [
      h1([], [text("Welcome to Gleam React!")]),
      h2([], [text("A counter with use_state")]),
      counter(count: 6),
    ],
  )
}
