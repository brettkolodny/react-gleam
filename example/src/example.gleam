import react_gleam.{render}
import react_gleam/element.{div, text}
import greeter.{greet}
import counter.{counter}

pub fn main() {
  render(app(), "#app")
}

fn app() {
  div(
    [],
    [
      div([], [text("Welcome to Gleam React!")]),
      div([], [text("A greeter with use_effect")]),
      greet(world: "world"),
      div([], [text("A counter with use_state")]),
      counter(count: 6),
    ],
  )
}
