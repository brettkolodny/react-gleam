import gleam/int
import react_gleam.{component}
import react_gleam/element.{button, div, text}
import react_gleam/event.{on_click}
import react_gleam/hook.{use_state}

pub fn counter(count: Int) {
  use <- component()

  let #(count, set_count) = use_state(fn() { count })

  div(
    [],
    [
      button(
        [on_click(fn(_) { set_count(fn(prev) { prev + 1 }) })],
        [text("+")],
      ),
      div([], [text("the count is " <> int.to_string(count))]),
      button(
        [on_click(fn(_) { set_count(fn(prev) { prev - 1 }) })],
        [text("-")],
      ),
    ],
  )
}
