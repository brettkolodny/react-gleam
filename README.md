# react_gleam

React bindings for Gleam inspired by [Lustre](https://github.com/hayleigh-dot-dev/gleam-lustre/blob/main/src/lustre/attribute.gleam) and [ReasonReact](https://reasonml.github.io/reason-react/).

---

```gleam
import gleam/int
import react_gleam.{render}
import react_gleam/element.{Element, component, div, h1}
import react_gleam/hooks.{use_state}
import react_gleam/event.{on_click}

pub fn main() {
  render(app)
}

fn app() -> Element {
  div([], [
    h1([], [text("Welcome to Gleam React!")]),
    greet(name: "Joe"),
    counter(count: 6)
  ])
}

fn greet(name name: String) -> Element {
  div([], [text("Hello " <> name <> "!")])
}

fn counter(count init_count: Int) -> Element {
  use <- component()

  let #(count, set_count) = use_state(init_count)

  div([], [
    div(
      [on_click(fn(_) { set_count(count + 1) })], 
      [text("+")]),
    div(
      [], 
      [int.to_string(count)]),
    div(
      [on_click(fn(_) { set_count(count - 1) })], 
      [text("-")]),
  ])
}
```

## Installation

If available on Hex this package can be added to your Gleam project:

```sh
gleam add react_gleam

yarn add react react-dom
```
