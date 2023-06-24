// IMPORTS --------------------------------------------------------------------
import gleam/dynamic.{Dynamic}
import gleam/option.{Option}

// TYPES ----------------------------------------------------------------------

pub external type Element

pub external type Context(a)

pub type Event =
  Dynamic

pub type Ref(g) {
  Ref(current: Option(g))
}

pub external type DomElement

pub type Location {
  Location(path: List(String), hash: String, search: String)
}

// GENERAL --------------------------------------------------------------------

pub external fn render(app: Element, root: String) -> Nil =
  "./ffi.mjs" "render"

// CONTEXT --------------------------------------------------------------------

// XXX not sure if this is useful
pub external fn set_context(key: String, value: g) -> Nil =
  "./ffi.mjs" "setContext"
