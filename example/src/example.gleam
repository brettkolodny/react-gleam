import react_gleam.{render}
import react_gleam/element.{div, h1, h2, text}
// import greeter.{greet}
import counter.{counter}
import reducer_counter.{reducer_counter}

pub fn main() {
  render(app(), "#app")
}

fn app() {
  div(
    [],
    [
      h1([], [text("Welcome to Gleam React!")]),
      // h2([], [text("A greeter with use_effect")]),
      // greet(world: "world"),
      h2([], [text("A counter with use_state")]),
      counter(count: 6),
      h2([], [text("A counter with use_reducer")]),
      reducer_counter(),
    ],
  )
}
