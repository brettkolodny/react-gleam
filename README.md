# react_gleam

React bindings for Gleam inspired by [Lustre](https://github.com/hayleigh-dot-dev/gleam-lustre/blob/main/src/lustre/attribute.gleam) and [ReasonReact](https://reasonml.github.io/reason-react/).

---

[![Package Version](https://img.shields.io/hexpm/v/react_gleam)](https://hex.pm/packages/react_gleam)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/react_gleam/)

```gleam
import gleam/int
import react_gleam.{component, render}
import react_gleam/element.{Element, div, text}
import react_gleam/hook.{use_state}
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

```

## Installation

If available on Hex this package can be added to your Gleam project:

```sh
gleam add react_gleam

yarn add react react-dom
```
