import gleam/int
import react_gleam.{component}
import react_gleam/element.{div, text}
import react_gleam/event.{on_click}
import react_gleam/hook.{use_reducer}

type Action {
  Inc
  Dec
}

type CountState {
  Count(Int)
}

fn reducer(state: CountState, action: Action) -> CountState {
  let Count(current_count) = state

  case action {
    Inc -> Count(current_count + 1)
    Dec -> Count(current_count - 1)
  }
}

pub fn reducer_counter() {
  use <- component()

  let #(Count(count), dispatch) = use_reducer(reducer, Count(0))

  div([], [
    div([on_click(fn(_) { dispatch(Dec) })], [text("-")]),
    div([], [text(int.to_string(count))]),
    div([on_click(fn(_) { dispatch(Inc) })], [text("+")]),
  ])
}
