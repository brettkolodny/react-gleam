import react_gleam.{type Context, type Element}

/// To have a typed context, Context(a), we need to have a "source of type" that is used both at
/// context value providing and consumption.
/// We can only define the context in JS side, and we can only define an `external` function, not a variable,
/// so the only thing we can do is have a `pub external fn get_context_foo () -> Context(Foo) = "someffi.js" "getContextFoo"`
/// and use such getter in both provider and context hook
@external(javascript, "../ffi.mjs", "useContext")
pub fn use_context(context: Context(a)) -> a

@external(javascript, "../ffi.mjs", "provideContext")
pub fn provide_context(
  getter: fn() -> Context(a),
  value: a,
  render: fn() -> Element,
) -> Element
