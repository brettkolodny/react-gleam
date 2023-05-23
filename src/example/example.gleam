import react_gleam.{render}
import react_gleam/element.{create_element, div, h1, h2, text}
import example/greeter.{greet}
import example/counter.{counter}
import example/reducer_counter.{reducer_counter}

pub fn main() {
  render(app(), "#app")
}

fn app() {
  div(
    [],
    [
      h1([], [text("Welcome to Gleam React! FOO")]),
      h2([], [text("A greeter with use_effect")]),
      create_element(greet, "World"),
      h2([], [text("A counter with use_state")]),
      counter(count: 6),
      h2([], [text("A counter with use_reducer")]),
      reducer_counter(),
    ],
  )
}
