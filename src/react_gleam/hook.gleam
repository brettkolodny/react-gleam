// IMPORTS --------------------------------------------------------------------

import gleam/dynamic.{Dynamic}
import gleam/option.{Option}
import react_gleam/dom_element.{DomElement}

// TYPES ----------------------------------------------------------------------

pub type Ref(g) {
  Ref(current: Option(g))
}

// STATE ----------------------------------------------------------------------

pub external fn use_state(initial: fn(a) -> a) -> #(a, fn(fn(a) -> a) -> Nil) =
  "../ffi.mjs" "useState"

// REDUCER --------------------------------------------------------------------

pub external fn use_reducer(reducer: fn(a, b) -> a, initial: a) -> #(a, fn(b) -> Nil) =
  "../ffi.mjs" "useReducer"

// EFFECT ---------------------------------------------------------------------

pub external fn use_effect(callback: fn() -> Option(fn() -> Nil)) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect0(callback: fn() -> Option(fn() -> Nil)) -> Nil =
  "../ffi.mjs" "useEffect0"

pub external fn use_effect1(callback: fn() -> Option(fn() -> Nil), dependencies: #(g)) -> Nil =
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

// MEMO -----------------------------------------------------------------------

pub external fn use_memo1(calculation: fn() -> v, dependencies: #(g)) -> v =
  "../ffi.mjs" "useMemo"

pub external fn use_memo2(calculation: fn() -> v, dependencies: #(g, l)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo3(calculation: fn() -> v, dependencies: #(g, l, e)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo4(calculation: fn() -> v, dependencies: #(g, l, e, a)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo5(calculation: fn() -> v, dependencies: #(g, l, e, a, m)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo6(calculation: fn() -> v, dependencies: #(g, l, e, a, m, o)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo7(calculation: fn() -> v, dependencies: #(g, l, e, a, m, o, r)) -> g =
  "../ffi.mjs" "useMemo"

// CALLBACK -------------------------------------------------------------------

pub external fn use_callback1(callback: fn() -> fn() -> v, dependencies: #(g)) -> v =
  "../ffi.mjs" "useMemo"

pub external fn use_callback2(callback: fn() -> fn() -> v, dependencies: #(g, l)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback3(callback: fn() -> fn() -> v, dependencies: #(g, l, e)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback4(callback: fn() -> fn() -> v, dependencies: #(g, l, e, a)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback5(callback: fn() -> fn() -> v, dependencies: #(g, l, e, a, m)) -> g =
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

pub external fn use_context(key: String) -> Result(Dynamic, String) =
  "../ffi.mjs" "useContextHook"
