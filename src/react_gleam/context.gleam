import react_gleam.{Element, Context}

/// To have a typed context, Context(a), we need to have a "source of type" that is used both at
/// context value providing and consumption.
/// We can only define the context in JS side, and we can only define an `extern` function, not a variable,
/// so the only thing we can do is have a `pub external fn get_context_foo () -> Context(Foo) = "someffi.js" "getContextFoo"`
/// and use such getter in both provider and context hook

pub external fn use_context(Context(a)) -> a = "../ffi.mjs" "useContext"

pub external fn provide_contex(
  getter: fn () -> Context(a),
  value: a,
  render: fn () -> Element
  ) -> Element = "../ffi.mjs" "provideContext"

