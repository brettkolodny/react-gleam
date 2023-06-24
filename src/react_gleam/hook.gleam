// IMPORTS --------------------------------------------------------------------

import gleam/dynamic.{Dynamic}
import gleam/option.{Option}
import react_gleam.{Context, DomElement, Element, Ref}
import react_gleam/context

// TYPES ----------------------------------------------------------------------

// STATE ----------------------------------------------------------------------

/// Direct useState API
/// returned setState accepts the updater function as parameter, a more generic case
pub external fn use_state(initial: fn() -> a) -> #(a, fn(fn(a) -> a) -> Nil) =
  "../ffi.mjs" "useState"

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

pub external fn use_reducer(
  reducer: fn(a, b) -> a,
  initial: a,
) -> #(a, fn(b) -> Nil) =
  "../ffi.mjs" "useReducer"

pub fn reducer(reducer, initial, body) -> Element {
  let #(value, set_value) = use_reducer(reducer, initial)
  body(value, set_value)
}

// EFFECT ---------------------------------------------------------------------

pub external fn use_effect(callback: fn() -> Option(fn() -> Nil)) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect0(callback: fn() -> Option(fn() -> Nil)) -> Nil =
  "../ffi.mjs" "useEffect0"

pub external fn use_effect1(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect2(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect3(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect4(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect5(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a, m),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect6(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a, m, o),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect7(
  callback: fn() -> Option(fn() -> Nil),
  dependencies: #(g, l, e, a, m, o, r),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

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

// MEMO -----------------------------------------------------------------------

pub external fn use_memo1(calculation: fn() -> v, dependencies: #(g)) -> v =
  "../ffi.mjs" "useMemo"

pub external fn use_memo2(calculation: fn() -> v, dependencies: #(g, l)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo3(calculation: fn() -> v, dependencies: #(g, l, e)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo4(
  calculation: fn() -> v,
  dependencies: #(g, l, e, a),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo5(
  calculation: fn() -> v,
  dependencies: #(g, l, e, a, m),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo6(
  calculation: fn() -> v,
  dependencies: #(g, l, e, a, m, o),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo7(
  calculation: fn() -> v,
  dependencies: #(g, l, e, a, m, o, r),
) -> g =
  "../ffi.mjs" "useMemo"

// CALLBACK -------------------------------------------------------------------

pub external fn use_callback1(
  callback: fn() -> fn() -> v,
  dependencies: #(g),
) -> v =
  "../ffi.mjs" "useMemo"

pub external fn use_callback2(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback3(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback4(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback5(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a, m),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback6(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a, m, o),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback7(
  callback: fn() -> fn() -> v,
  dependencies: #(g, l, e, a, m, o, r),
) -> g =
  "../ffi.mjs" "useMemo"

// ID -------------------------------------------------------------------------

pub external fn use_id() -> String =
  "../ffi.mjs" "useId"

// TRANSITION -----------------------------------------------------------------

pub external fn use_transition(cb: fn() -> Nil) -> #(Bool, fn() -> Nil) =
  "../ffi.mjs" "useTransition"

// DEBUG VALUE ----------------------------------------------------------------

pub external fn use_debug_value(value: String) -> Nil =
  "../ffi.mjs" "useDebugValue"

// REF ------------------------------------------------------------------------

pub external fn use_ref(value: Option(DomElement)) -> Ref(DomElement) =
  "../ffi.mjs" "useRefHook"

// CONTEXT --------------------------------------------------------------------

/// XXX I would remove this
pub external fn use_context(key: String) -> Result(Dynamic, String) =
  "../ffi.mjs" "useContextHook"

/// use val <- context(val_context_getter)
pub fn context(getter: fn() -> Context(a), render: fn(a) -> Element) {
  let ctx = getter()
  let value = context.use_context(ctx)
  render(value)
}
