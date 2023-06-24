// Much of this code was lifted from 
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

// IMPORTS --------------------------------------------------------------------

import gleam/dynamic.{Dynamic}
import gleam/int
import gleam/list
import gleam/pair
import gleam/string
import react_gleam.{Event, Ref}

// TYPES -----------------------------------------------------------------------
// Is react event list finite? Seems so.
// even for custom events there is a CustomEvent interface.

/// XXX Perhaps easier to grasp generic type names: 
/// g, action -> ref, event? 
pub opaque type Attribute(g, action) {
  Attribute(name: String, value: String)
  Property(name: String, value: Dynamic)
  Event(name: String, handler: fn(Event) -> Nil)
  ReactRef(name: String, ref: Ref(g))
}

pub external fn to_props(List(Attribute(g, action))) -> Dynamic =
  "../ffi.mjs" "toProps"

// CONSTRUCTORS ----------------------------------------------------------------

///
pub fn attribute(name: String, value: String) -> Attribute(g, action) {
  Attribute(name, value)
}

///
pub fn property(name: String, value: Dynamic) -> Attribute(g, action) {
  Property(name, value)
}

///
pub fn event(name: String, handler: fn(Event) -> Nil) -> Attribute(g, action) {
  Event(name, handler)
}

// COMMON ATTRIBUTES -----------------------------------------------------------

///
pub fn style(properties: List(#(String, String))) -> Attribute(g, action) {
  property("style", style_object(properties))
}

external fn style_object(properties: List(#(String, String))) -> Dynamic =
  "../ffi.mjs" "object"

///
pub fn class(name: String) -> Attribute(g, action) {
  attribute("className", name)
}

///
pub fn classes(names: List(#(String, Bool))) -> Attribute(g, action) {
  attribute(
    "className",
    names
    |> list.filter(pair.second)
    |> list.map(pair.first)
    |> string.join(" "),
  )
}

///
pub fn id(name: String) -> Attribute(g, action) {
  attribute("id", name)
}

// INPUTS ----------------------------------------------------------------------

///
pub fn type_(name: String) -> Attribute(g, action) {
  attribute("type", name)
}

///
pub fn value(val: Dynamic) -> Attribute(g, action) {
  property("value", val)
}

///
pub fn checked(is_checked: Bool) -> Attribute(g, action) {
  property("checked", dynamic.from(is_checked))
}

///
pub fn placeholder(text: String) -> Attribute(g, action) {
  attribute("placeholder", text)
}

///
pub fn selected(is_selected: Bool) -> Attribute(g, action) {
  property("selected", dynamic.from(is_selected))
}

// INPUT HELPERS ---------------------------------------------------------------

///
pub fn accept(types: List(String)) -> Attribute(g, action) {
  attribute("accept", string.join(types, " "))
}

///
pub fn accept_charset(types: List(String)) -> Attribute(g, action) {
  attribute("acceptCharset", string.join(types, " "))
}

///
pub fn action(uri: String) -> Attribute(g, action) {
  attribute("action", uri)
}

///
pub fn autocomplete(should_autocomplete: Bool) -> Attribute(g, action) {
  property("autocomplete", dynamic.from(should_autocomplete))
}

///
pub fn autofocus(should_autofocus: Bool) -> Attribute(g, action) {
  property("autoFocus", dynamic.from(should_autofocus))
}

///
pub fn disabled(is_disabled: Bool) -> Attribute(g, action) {
  property("disabled", dynamic.from(is_disabled))
}

///
pub fn name(name: String) -> Attribute(g, action) {
  attribute("name", name)
}

///
pub fn pattern(regex: String) -> Attribute(g, action) {
  attribute("pattern", regex)
}

///
pub fn readonly(is_readonly: Bool) -> Attribute(g, action) {
  property("readonly", dynamic.from(is_readonly))
}

///
pub fn required(is_required: Bool) -> Attribute(g, action) {
  property("required", dynamic.from(is_required))
}

///
pub fn for(id: String) -> Attribute(g, action) {
  attribute("for", id)
}

// INPUT RANGES ----------------------------------------------------------------

///
pub fn max(val: String) -> Attribute(g, action) {
  attribute("max", val)
}

///
pub fn min(val: String) -> Attribute(g, action) {
  attribute("min", val)
}

///
pub fn step(val: String) -> Attribute(g, action) {
  attribute("step", val)
}

// INPUT TEXT AREAS ------------------------------------------------------------

///
pub fn cols(val: Int) -> Attribute(g, action) {
  attribute("cols", int.to_string(val))
}

///
pub fn rows(val: Int) -> Attribute(g, action) {
  attribute("rows", int.to_string(val))
}

///
pub fn wrap(mode: String) -> Attribute(g, action) {
  attribute("wrap", mode)
}

// LINKS AND AREAS -------------------------------------------------------------

///
pub fn href(uri: String) -> Attribute(g, action) {
  attribute("href", uri)
}

///
pub fn target(target: String) -> Attribute(g, action) {
  attribute("target", target)
}

///
pub fn download(filename: String) -> Attribute(g, action) {
  attribute("download", filename)
}

///
pub fn rel(relationship: String) -> Attribute(g, action) {
  attribute("rel", relationship)
}

// EMBEDDED CONTENT ------------------------------------------------------------

///
pub fn src(uri: String) -> Attribute(g, action) {
  attribute("src", uri)
}

///
pub fn height(val: Int) -> Attribute(g, action) {
  attribute("height", int.to_string(val))
}

///
pub fn width(val: Int) -> Attribute(g, action) {
  attribute("width", int.to_string(val))
}

///
pub fn alt(text: String) -> Attribute(g, action) {
  attribute("alt", text)
}

// AUDIO AND VIDEO -------------------------------------------------------------

///
pub fn autoplay(should_autoplay: Bool) -> Attribute(g, action) {
  property("autoplay", dynamic.from(should_autoplay))
}

///
pub fn controls(visible: Bool) -> Attribute(g, action) {
  property("controls", dynamic.from(visible))
}

///
pub fn loop(should_loop: Bool) -> Attribute(g, action) {
  property("loop", dynamic.from(should_loop))
}

// REACT ----------------------------------------------------------------------

pub fn ref(value: Ref(g)) -> Attribute(g, action) {
  ReactRef(name: "ref", ref: value)
}
