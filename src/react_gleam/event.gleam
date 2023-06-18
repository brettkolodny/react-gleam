// Much of this code was lifted from 
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

// IMPORTS ---------------------------------------------------------------------

import gleam/dynamic
import react_gleam.{Event}
import react_gleam/attribute.{Attribute}

// CONSTRUCTORS ----------------------------------------------------------------

///
pub fn on(
  name: String,
  handler: fn (Event) -> Nil,
) -> Attribute(g, action) {
  attribute.event(name, handler)
}

///
pub fn dispatch(action: action) -> fn(fn(action) -> Nil) -> Nil {
  fn(dispatch) { dispatch(action) }
}

// MOUSE EVENTS ----------------------------------------------------------------

///
pub fn on_click(handler: fn(Event) -> Nil) -> Attribute(g, action) {
  on("click", handler)
}

///
pub fn on_mouse_down(
  handler: fn(Event) -> Nil,
) -> Attribute(g, action) {
  on("mouseDown", handler)
}

///
pub fn on_mouse_up(
  handler: fn(Event) -> Nil,
) -> Attribute(g, action) {
  on("mouseUp", handler)
}

///
pub fn on_mouse_enter(
  handler: fn(Event) -> Nil,
) -> Attribute(g, action) {
  on("mouseEnter", handler)
}

///
pub fn on_mouse_leave(
  handler: fn(Event) -> Nil,
) -> Attribute(g, action) {
  on("mouseLeave", handler)
}

///
pub fn on_mouse_over(
  handler: fn(Event) -> Nil,
) -> Attribute(g, action) {
  on("mouseOver", handler)
}

///
pub fn on_mouse_out(
  handler: fn(Event) -> Nil,
) -> Attribute(g, action) {
  on("mouseOut", handler)
}

// KEYBOARD EVENTS -------------------------------------------------------------

pub fn on_keypress(
  handler: fn(String, Event) -> Nil,
) -> Attribute(g, action) {
  on("keyPress", fn(e) {
      let assert Ok(key) =
        e
        |> dynamic.field("key", dynamic.string)

      handler(key, e)
    })
}

pub fn on_keydown(
  handler: fn(String, Event) -> Nil,
) -> Attribute(g, action) {
  on("keyDown", fn(e) {
      let assert Ok(key) =
        e
        |> dynamic.field("key", dynamic.string)

      handler(key, e)
    })
}

pub fn on_keyup(
  handler: fn(String, Event) -> Nil,
) -> Attribute(g, action) {
  on("keyUp", fn(e) {
      let assert Ok(key) =
        e
        |> dynamic.field("key", dynamic.string)

      handler(key, e)
    })
}

// FORM EVENTS -----------------------------------------------------------------

///
pub fn on_input(
  handler: fn(String, Event) -> Nil,
) -> Attribute(g, action) {
  on("input", fn(e) {
      let assert Ok(key) =
        e
        |> dynamic.field("target", dynamic.field("value", dynamic.string))

      handler(key, e)
    })
}

pub fn on_check(
  handler: fn(Bool, Event) -> Nil,
) -> Attribute(g, action) {
  on("check", fn(e) {
      let assert Ok(key) =
        e
        |> dynamic.field("target", dynamic.field("checked", dynamic.bool))

      handler(key, e)
    })
}

pub fn on_submit(handler: fn(Event) -> Nil) -> Attribute(g, action) {
  on("submit", handler)
}

// FOCUS EVENTS ----------------------------------------------------------------

pub fn on_focus(handler: fn(Event) -> Nil) -> Attribute(g, action) {
  on("focus", handler)
}

pub fn on_blur(handler: fn(Event) -> Nil) -> Attribute(g, action) {
  on("blur", handler)
}
