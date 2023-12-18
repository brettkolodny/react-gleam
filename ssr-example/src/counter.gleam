import gleam/int
import react_gleam.{component}
import react_gleam/element.{button, div, text}
import react_gleam/event.{on_click}
import react_gleam/hook.{use_state}

// to get SSR working correctly, I had to create a custom type
pub type CountState {
  CountState(count: Int)
}

pub fn counter(props: CountState) {
  use <- component()

  // another issue with SSR is that the data is sent on the server and client as an object
  // so we need to use a named accessor(the .) to access the data we want from the object
  // otherwise the react state is shown in the dom [object Object] which is doesnt tell us much. 
  let count = props.count

  let #(count, set_count) = use_state(fn() { count })

  div(
    [],
    [
      button(
        [on_click(fn(_) { set_count(fn(count) { count + 1 }) })],
        [text("+")],
      ),
      div([], [text("the count is " <> int.to_string(count))]),
      button(
        [on_click(fn(_) { set_count(fn(count) { count - 1 }) })],
        [text("-")],
      ),
    ],
  )
}
