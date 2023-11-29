// IMPORTS --------------------------------------------------------------------

import gleam/dynamic.{type Dynamic}
import gleam/option.{type Option}
import react_gleam/dom_element.{type DomElement}
import react_gleam.{Context, Element}
import react_gleam/context

// TYPES ----------------------------------------------------------------------

pub type Ref(g) {
  Ref(current: Option(g))
}

// STATE ----------------------------------------------------------------------

/// Direct useState API
/// returned setState accepts the updater function as parameter, a more generic case
@external(javascript, "../ffi.mjs", "useState")
pub fn use_state(initial: fn() -> a) -> #(a, fn(fn(a) -> a) -> Nil)

/// state api to be used in such syntax:
/// `use foo, set_foo <- state(initial)`
///
pub fn state(initial, body) -> Element {
  let #(value, set_value) = use_state(fn() { initial })
  body(value, set_value)
}

/// state api to be used in such syntax, with lazy initialization value
/// `use foo, set_foo <- state(fn () { initial })`
/// the initializer function must by synchronous (not returning a Promise)
pub fn state_lazy(initial_fun, body) -> Element {
  let #(value, set_value) = use_state(initial_fun)
  body(value, set_value)
}

// REDUCER --------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useReducer")
pub fn use_reducer(reducer: fn(a, b) -> a, initial: a) -> #(a, fn(b) -> Nil)

pub fn reducer(reducer, initial, body) -> Element {
  let #(value, set_value) = use_reducer(reducer, initial)
  body(value, set_value)
}

// EFFECT ---------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect(callback: fn() -> Option(fn() -> Nil)) -> Nil

pub fn effect0(effect_fun, body) -> Element {
  use_effect0(effect_fun)
  body()
}

pub fn effect1(effect_fun, deps, body) -> Element {
  use_effect1(effect_fun, deps)
  body()
}

pub fn effect2(effect_fun, deps, body) -> Element {
  use_effect2(effect_fun, deps)
  body()
}

pub fn effect3(effect_fun, deps, body) -> Element {
  use_effect3(effect_fun, deps)
  body()
}

pub fn effect4(effect_fun, deps, body) -> Element {
  use_effect4(effect_fun, deps)
  body()
}

pub fn effect5(effect_fun, deps, body) -> Element {
  use_effect5(effect_fun, deps)
  body()
}

pub fn effect6(effect_fun, deps, body) -> Element {
  use_effect6(effect_fun, deps)
  body()
}

pub fn effect7(effect_fun, deps, body) -> Element {
  use_effect7(effect_fun, deps)
  body()
}

@external(javascript, "../ffi.mjs", "useEffect0")
pub fn use_effect0(callback: fn() -> Option(fn() -> Nil)) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect1(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g),
) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect2(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l),
) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect3(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e),
) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect4(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a),
) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect5(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a, m),
) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect6(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a, m, o),
) -> Nil

@external(javascript, "../ffi.mjs", "useEffectHook")
pub fn use_effect7(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a, m, o, r),
) -> Nil

// MEMO -----------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo1(calculation: fn() -> v, dependencies: #(g)) -> v

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo2(calculation: fn() -> v, dependencies: #(g, l)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo3(calculation: fn() -> v, dependencies: #(g, l, e)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo4(calculation: fn() -> v, dependencies: #(g, l, e, a)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo5(calculation: fn() -> v, dependencies: #(g, l, e, a, m)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo6(calculation: fn() -> v, dependencies: #(g, l, e, a, m, o)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_memo7(
  calculation: fn() -> v,
  dependencies: #(g, l, e, a, m, o, r),
) -> g

// CALLBACK -------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback1(callback: fn() -> fn() -> v, dependencies: #(g)) -> v

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback2(callback: fn() -> fn() -> v, dependencies: #(g, l)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback3(callback: fn() -> fn() -> v, dependencies: #(g, l, e)) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback4(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a),
) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback5(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a, m),
) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback6(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a, m, o),
) -> g

@external(javascript, "../ffi.mjs", "useMemo")
pub fn use_callback7(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a, m, o, r),
) -> g

// ID -------------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useId")
pub fn use_id() -> String

// TRANSITION -----------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useTransition")
pub fn use_transition(cb: fn() -> Nil) -> #(Bool, fn() -> Nil)

// DEBUG VALUE ----------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useDebugValue")
pub fn use_debug_value(value: String) -> Nil

// REF ------------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useRefHook")
pub fn use_ref(value: Option(DomElement)) -> Ref(DomElement)

// CONTEXT --------------------------------------------------------------------

@external(javascript, "../ffi.mjs", "useContextHook")
pub fn use_context(key: String) -> Result(Dynamic, String)

/// use val <- context(val_context_getter)
pub fn context(getter: fn() -> Context(a), render: fn(a) -> Element) {
  let ctx = getter()
  let value = context.use_context(ctx)
  render(value)
}
