// IMPORTS --------------------------------------------------------------------

import gleam/option.{Option}
import react_gleam/dom_element.{DomElement}

// TYPES ----------------------------------------------------------------------

pub external type Context

pub type Ref(g) {
  Ref(current: Option(g))
}

// STATE ----------------------------------------------------------------------

pub external fn use_state(init: a) -> #(a, fn(a) -> Nil) =
  "../ffi.mjs" "useState"

// REDUCER --------------------------------------------------------------------

pub external fn use_reducer(fn(a, b) -> a, init: a) -> #(a, fn(b) -> Nil) =
  "../ffi.mjs" "useReducer"

// EFFECT ---------------------------------------------------------------------

pub external fn use_effect(cb: fn() -> Option(fn() -> Nil)) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect0(cb: fn() -> Option(fn() -> Nil)) -> Nil =
  "../ffi.mjs" "useEffect0"

pub external fn use_effect1(cb: fn() -> Option(fn() -> Nil), props: #(g)) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect2(
  cb: fn() -> Option(fn() -> Nil),
  props: #(g, l),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect3(
  cb: fn() -> Option(fn() -> Nil),
  props: #(g, l, e),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect4(
  cb: fn() -> Option(fn() -> Nil),
  props: #(g, l, e, a),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect5(
  cb: fn() -> Option(fn() -> Nil),
  props: #(g, l, e, a, m),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect6(
  cb: fn() -> Option(fn() -> Nil),
  props: #(g, l, e, a, m, o),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

pub external fn use_effect7(
  cb: fn() -> Option(fn() -> Nil),
  props: #(g, l, e, a, m, o, r),
) -> Nil =
  "../ffi.mjs" "useEffectHook"

// MEMO -----------------------------------------------------------------------

pub external fn use_memo1(create: fn() -> v, #(g)) -> v =
  "../ffi.mjs" "useMemo"

pub external fn use_memo2(create: fn() -> v, #(g, l)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo3(create: fn() -> v, #(g, l, e)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo4(create: fn() -> v, #(g, l, e, a)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo5(create: fn() -> v, #(g, l, e, a, m)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo6(create: fn() -> v, #(g, l, e, a, m, o)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_memo7(create: fn() -> v, #(g, l, e, a, m, o, r)) -> g =
  "../ffi.mjs" "useMemo"

// CALLBACK -------------------------------------------------------------------

pub external fn use_callback1(create: fn() -> fn() -> v, #(g)) -> v =
  "../ffi.mjs" "useMemo"

pub external fn use_callback2(create: fn() -> fn() -> v, #(g, l)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback3(create: fn() -> fn() -> v, #(g, l, e)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback4(create: fn() -> fn() -> v, #(g, l, e, a)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback5(create: fn() -> fn() -> v, #(g, l, e, a, m)) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback6(
  create: fn() -> fn() -> v,
  #(g, l, e, a, m, o),
) -> g =
  "../ffi.mjs" "useMemo"

pub external fn use_callback7(
  create: fn() -> fn() -> v,
  #(g, l, e, a, m, o, r),
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

// REF --

pub external fn use_ref(value: Option(DomElement)) -> Ref(DomElement) =
  "../ffi.mjs" "useRefHook"
