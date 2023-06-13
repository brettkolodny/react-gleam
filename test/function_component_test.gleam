import react_gleam.{Element}
// import react_gleam/attribute.{attribute}
import react_gleam/hook
import react_gleam/element
import gleeunit/should
import gleam/string

external fn render_to_static(element: Element) -> String =
  "react-dom/server" "renderToStaticMarkup"

type Pet {
  Pet(name: String)
}

type PetState {
  Sitting
  Running
}

fn pet_profile(props: Pet) -> Element {
  use state, _s <- hook.state(Sitting)

  element.div(
    [],
    [
      element.text(
        "A pet called " <> props.name <> " is " <> string.inspect(state),
      ),
    ],
  )
}

pub fn first_test() {
  element.create(pet_profile, Pet(name: "Garfield"), [])
  |> render_to_static()
  |> should.equal("<div>A pet called Garfield is Sitting</div>")
}
