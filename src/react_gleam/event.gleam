// Much of this code was lifted from 
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

// IMPORTS ---------------------------------------------------------------------

import gleam/dynamic.{type Dynamic}
import react_gleam/attribute.{type Attribute}

// EXTERNAL FUNCTIONS ---------------------------------------------------------

@external(javascript, "../ffi.mjs", "getEventKey")
fn get_event_key(event: Dynamic) -> String

@external(javascript, "../ffi.mjs", "getInputValue")
fn get_input_value(event: Dynamic) -> String

@external(javascript, "../ffi.mjs", "getCheckboxChecked")
fn get_checkbox_checked(event: Dynamic) -> Bool

// CONSTRUCTORS ----------------------------------------------------------------

///
pub fn on(
  name: String,
  handler: fn(Dynamic, fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  attribute.event(name, handler)
}

///
pub fn dispatch(action: action) -> fn(fn(action) -> Nil) -> Nil {
  fn(dispatch) { dispatch(action) }
}

// MOUSE EVENTS ----------------------------------------------------------------

///
pub fn on_click(handler: fn(fn(action) -> Nil) -> Nil) -> Attribute(g, action) {
  on("click", fn(_, dispatch) { handler(dispatch) })
}

///
pub fn on_mouse_down(
  handler: fn(fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("mouseDown", fn(_, dispatch) { handler(dispatch) })
}

///
pub fn on_mouse_up(
  handler: fn(fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("mouseUp", fn(_, dispatch) { handler(dispatch) })
}

///
pub fn on_mouse_enter(
  handler: fn(fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("mouseEnter", fn(_, dispatch) { handler(dispatch) })
}

///
pub fn on_mouse_leave(
  handler: fn(fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("mouseLeave", fn(_, dispatch) { handler(dispatch) })
}

///
pub fn on_mouse_over(
  handler: fn(fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("mouseOver", fn(_, dispatch) { handler(dispatch) })
}

///
pub fn on_mouse_out(
  handler: fn(fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("mouseOut", fn(_, dispatch) { handler(dispatch) })
}

// KEYBOARD EVENTS -------------------------------------------------------------

pub fn on_keypress(
  handler: fn(String, fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("keyPress", fn(e, dispatch) {
    let key = get_event_key(e)
    handler(key, dispatch)
  })
}

pub fn on_keydown(
  handler: fn(String, fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("keyDown", fn(e, dispatch) {
    let key = get_event_key(e)
    handler(key, dispatch)
  })
}

pub fn on_keyup(
  handler: fn(String, fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("keyUp", fn(e, dispatch) {
    let key = get_event_key(e)
    handler(key, dispatch)
  })
}

// FORM EVENTS -----------------------------------------------------------------

///
pub fn on_input(
  handler: fn(String, fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("input", fn(e, dispatch) {
    let value = get_input_value(e)
    handler(value, dispatch)
  })
}

pub fn on_check(
  handler: fn(Bool, fn(action) -> Nil) -> Nil,
) -> Attribute(g, action) {
  on("check", fn(e, dispatch) {
    let value = get_checkbox_checked(e)
    handler(value, dispatch)
  })
}

pub fn on_submit(handler: fn(fn(action) -> Nil) -> Nil) -> Attribute(g, action) {
  on("submit", fn(_, dispatch) { handler(dispatch) })
}

// FOCUS EVENTS ----------------------------------------------------------------

pub fn on_focus(handler: fn(fn(action) -> Nil) -> Nil) -> Attribute(g, action) {
  on("focus", fn(_, dispatch) { handler(dispatch) })
}

pub fn on_blur(handler: fn(fn(action) -> Nil) -> Nil) -> Attribute(g, action) {
  on("blur", fn(_, dispatch) { handler(dispatch) })
}
