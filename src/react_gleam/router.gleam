// IMPORTS --------------------------------------------------------------------

import gleam/option.{Some}
import react_gleam/hook.{use_effect0, use_state}

// TYPES ----------------------------------------------------------------------

pub type Location {
  Location(path: List(String), hash: String, search: String)
}

type DOMEvent

// HOOKS ----------------------------------------------------------------------

pub fn use_url() -> Location {
  let location = get_current_location()

  let #(current_location, set_current_location) = use_state(fn() { location })

  use_effect0(fn() {
    let location_change_callback = fn() {
      let new_location = get_current_location()

      set_current_location(fn(_) { new_location })
    }

    let location_pop_callback = fn() {
      dispatch_event(new_event("locationchange"))
    }

    add_event_listener("locationchange", location_change_callback)
    add_event_listener("popstate", location_pop_callback)

    Some(fn() {
      remove_event_listener("locationchange", location_change_callback)
      remove_event_listener("popstate", location_pop_callback)
    })
  })

  current_location
}

// UTILITY --------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "pushState")
pub fn push(url: String) -> Nil

@external(javascript, "../ffi.mjs", "popState")
pub fn back() -> Nil

// ----------------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "currentLocation")
fn get_current_location() -> Location

@external(javascript, "../ffi.mjs", "addEventListener")
fn add_event_listener(name: String, callback: fn() -> Nil) -> Nil

@external(javascript, "../ffi.mjs", "removeEventListener")
fn remove_event_listener(name: String, callback: fn() -> Nil) -> Nil

@external(javascript, "../ffi.mjs", "dispatchEvent")
fn dispatch_event(event: DOMEvent) -> Nil

@external(javascript, "../ffi.mjs", "newEvent")
fn new_event(name: String) -> DOMEvent
