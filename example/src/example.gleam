import gleam/int
import react_gleam.{render}
import react_gleam/element.{Element, component, div, text}
import react_gleam/hooks.{use_state}
import react_gleam/event.{on_click}

pub fn main() {
  render(app(), "#app")
}

fn app() -> Element {
  div(
    [],
    [
      div([], [text("Welcome to Gleam React!")]),
      greet(name: "Joe"),
      counter(count: 6),
    ],
  )
}

fn greet(name name: String) -> Element {
  div([], [text("Hello " <> name <> "!")])
}

fn counter(count init_count: Int) -> Element {
  use <- component()

  let #(count, set_count) = use_state(init_count)

  div(
    [],
    [
      div([on_click(fn(_) { set_count(count + 1) })], [text("+")]),
      div([], [text(int.to_string(count))]),
      div([on_click(fn(_) { set_count(count - 1) })], [text("-")]),
    ],
  )
}
