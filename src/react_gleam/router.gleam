// IMPORTS --------------------------------------------------------------------

import gleam/option.{Some}
import react_gleam/hook.{use_effect0, use_state}
import react_gleam.{Location}

// TYPES

external type DOMEvent

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

pub external fn push(url: String) -> Nil =
  "../ffi.mjs" "pushState"

pub external fn back() -> Nil =
  "../ffi.mjs" "popState"

// ----------------------------------------------------------------------------

external fn get_current_location() -> Location =
  "../ffi.mjs" "currentLocation"

external fn add_event_listener(name: String, callback: fn() -> Nil) -> Nil =
  "../ffi.mjs" "addEventListener"

external fn remove_event_listener(name: String, callback: fn() -> Nil) -> Nil =
  "../ffi.mjs" "removeEventListener"

external fn dispatch_event(event: DOMEvent) -> Nil =
  "../ffi.mjs" "dispatchEvent"

external fn new_event(name: String) -> DOMEvent =
  "../ffi.mjs" "newEvent"
