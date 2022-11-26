// IMPORTS --------------------------------------------------------------------

import gleam/option.{Option}

// HOOKS ----------------------------------------------------------------------

pub external fn use_state(init: a) -> #(a, fn(a) -> Nil) =
  "../ffi.mjs" "useState"

pub external fn use_reducer(fn(a, b) -> a, init: a) -> #(a, fn(b) -> Nil) =
  "../ffi.mjs" "useReducer"

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
