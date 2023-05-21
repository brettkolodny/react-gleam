import gleam/option.{Some}
import gleam/list
import gleam/int
import gleam/float
import react_gleam.{component}
import react_gleam/element.{div, text}
import react_gleam/hook.{use_effect0, use_state}

const world = [
  "world", "wêreld", "botë", "ዓለም", "العالمية", "աշխարհ",
  "dünya", "mundua", "свет", "বিশ্ব", "世界", "mondu", "svijet",
  "svět", "verden", "wereld-", "mondo", "maailmas", "maailman-", "monde",
  "wrâld", "mundo", "სამყარო", "Welt",
]

pub fn greet(world world_init: String) {
  use <- component()

  let #(world, set_world) = use_state(fn() { world_init })

  use_effect0(fn() {
    let timeout = set_interval(fn() { set_world(fn(_) { get_random_world() }) }, 3000)

    Some(fn() { clear_interval(timeout) })
  })

  div([], [text("Hello " <> world <> "!")])
}

external type Timeout

external fn set_interval(fn() -> Nil, ms: Int) -> Timeout =
  "" "setInterval"

external fn clear_interval(timeout: Timeout) -> Nil =
  "" "clearInterval"

external fn math_random() -> Float =
  "" "Math.random"

fn get_random_world() -> String {
  let index =
    float.round(float.floor(int.to_float(list.length(world)) *. math_random()))

  case list.at(world, index) {
    Ok(w) -> w
    _ -> "world"
  }
}
