// Much of this code was lifted from 
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

// IMPORTS --------------------------------------------------------------------

import react_gleam/attribute.{type Attribute, attribute}

// TYPES ----------------------------------------------------------------------

pub type Element

// CONSTRUCTORS ---------------------------------------------------------------

@external(javascript, "../ffi.mjs", "node")
pub fn node(
  tag: String,
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element

/// Render a Gleam string as an HTML text node.
///
@external(javascript, "../ffi.mjs", "text")
pub fn text(content: String) -> Element

// CONSTRUCTING NODES ---------------------------------------------------------
// This list and grouping of nodes has been taken from the MDN reference at:
// https://developer.mozilla.org/en-US/docs/Web/HTML/Element

// MAIN ROOT ------------------------------------------------------------------

///
pub fn html(
  attributes: List(Attribute(g, action)),
  head: Element,
  body: Element,
) -> Element {
  node("html", attributes, [head, body])
}

// DOCUMENT METADATA ----------------------------------------------------------

///
pub fn base(attributes: List(Attribute(g, action))) -> Element {
  node("base", attributes, [])
}

///
pub fn head(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("head", attributes, children)
}

///
pub fn meta(attributes: List(Attribute(g, action))) -> Element {
  node("meta", attributes, [])
}

///
pub fn style(attributes: List(Attribute(g, action)), css: String) -> Element {
  node("style", attributes, [text(css)])
}

///
pub fn title(attributes: List(Attribute(g, action)), name: String) -> Element {
  node("title", attributes, [text(name)])
}

// SECTIONING ROOT ------------------------------------------------------------

///
pub fn body(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("body", attributes, children)
}

// CONTENT SECTIONING ---------------------------------------------------------

///
pub fn address(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("address", attributes, children)
}

///
pub fn article(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("article", attributes, children)
}

///
pub fn aside(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("aside", attributes, children)
}

///
pub fn footer(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("footer", attributes, children)
}

///
pub fn header(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("header", attributes, children)
}

///
pub fn h1(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("h1", attributes, children)
}

///
pub fn h2(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("h2", attributes, children)
}

///
pub fn h3(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("h3", attributes, children)
}

///
pub fn h4(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("h4", attributes, children)
}

///
pub fn h5(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("h5", attributes, children)
}

///
pub fn h6(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("h6", attributes, children)
}

///
pub fn main(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("main", attributes, children)
}

///
pub fn nav(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("nav", attributes, children)
}

///
pub fn section(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("section", attributes, children)
}

// TEXT CONTENT ---------------------------------------------------------------

///
pub fn blockquote(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("blockquote", attributes, children)
}

///
pub fn dd(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("dd", attributes, children)
}

///
pub fn div(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("div", attributes, children)
}

///
pub fn dl(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("dl", attributes, children)
}

///
pub fn dt(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("dt", attributes, children)
}

///
pub fn figcaption(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("figcaption", attributes, children)
}

///
pub fn figure(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("figure", attributes, children)
}

///
pub fn hr(attributes: List(Attribute(g, action))) -> Element {
  node("hr", attributes, [])
}

///
pub fn li(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("li", attributes, children)
}

///
pub fn menu(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("menu", attributes, children)
}

///
pub fn ol(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("ol", attributes, children)
}

///
pub fn p(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("p", attributes, children)
}

///
pub fn pre(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("pre", attributes, children)
}

///
pub fn ul(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("ul", attributes, children)
}

// INLINE TEXT SEMANTICS ------------------------------------------------------

///
pub fn a(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("a", attributes, children)
}

///
pub fn abbr(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("abbr", attributes, children)
}

///
pub fn b(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("b", attributes, children)
}

///
pub fn bdi(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("bdi", attributes, children)
}

///
pub fn bdo(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("bdo", attributes, children)
}

///
pub fn br(attributes: List(Attribute(g, action))) -> Element {
  node("br", attributes, [])
}

///
pub fn cite(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("cite", attributes, children)
}

///
pub fn code(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("code", attributes, children)
}

///
pub fn dfn(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("dfn", attributes, children)
}

///
pub fn em(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("em", attributes, children)
}

///
pub fn i(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("i", attributes, children)
}

///
pub fn kbd(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("kbd", attributes, children)
}

///
pub fn mark(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("mark", attributes, children)
}

///
pub fn rp(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("rp", attributes, children)
}

///
pub fn rt(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("rt", attributes, children)
}

///
pub fn ruby(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("ruby", attributes, children)
}

///
pub fn s(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("s", attributes, children)
}

///
pub fn samp(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("samp", attributes, children)
}

///
pub fn small(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("small", attributes, children)
}

///
pub fn span(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("span", attributes, children)
}

///
pub fn strong(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("strong", attributes, children)
}

///
pub fn sub(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("sub", attributes, children)
}

///
pub fn sup(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("sup", attributes, children)
}

///
pub fn time(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("time", attributes, children)
}

///
pub fn u(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("u", attributes, children)
}

///
pub fn var_(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("var", attributes, children)
}

///
pub fn wbr(attributes: List(Attribute(g, action))) -> Element {
  node("wbr", attributes, [])
}

// IMAGE AND MULTIMEDIA -------------------------------------------------------

///
pub fn area(attributes: List(Attribute(g, action))) -> Element {
  node("area", attributes, [])
}

///
pub fn audio(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("audio", attributes, children)
}

///
pub fn img(attributes: List(Attribute(g, action))) -> Element {
  node("img", attributes, [])
}

///
pub fn map_(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("map", attributes, children)
}

///
pub fn track(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("track", attributes, children)
}

///
pub fn video(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("video", attributes, children)
}

// EMBEDDED CONTENT -----------------------------------------------------------

///
pub fn embed(attributes: List(Attribute(g, action))) -> Element {
  node("embed", attributes, [])
}

///
pub fn iframe(attributes: List(Attribute(g, action))) -> Element {
  node("iframe", attributes, [])
}

///
pub fn object(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("object", attributes, children)
}

///
pub fn param(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("param", attributes, children)
}

///
pub fn picture(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("picture", attributes, children)
}

///
pub fn portal(attributes: List(Attribute(g, action))) -> Element {
  node("portal", attributes, [])
}

///
pub fn source(attributes: List(Attribute(g, action))) -> Element {
  node("source", attributes, [])
}

// SVG AND MATHML -------------------------------------------------------------

///
pub fn svg(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node(
    "svg",
    [attribute("xmlns", "http://www.w3.org/2000/svg"), ..attributes],
    children,
  )
}

///
pub fn mathml(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node(
    "mathml",
    [attribute("xmlns", "http://www.w3.org/1998/Math/MathML"), ..attributes],
    children,
  )
}

// SCRIPTING ------------------------------------------------------------------

///
pub fn canvas(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("canvas", attributes, children)
}

///
pub fn noscript(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("noscript", attributes, children)
}

// DEMARCATING EDITS ----------------------------------------------------------

///
pub fn del(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("del", attributes, children)
}

///
pub fn ins(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("ins", attributes, children)
}

// TABLE CONTENT --------------------------------------------------------------

///
pub fn caption(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("caption", attributes, children)
}

///
pub fn col(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("col", attributes, children)
}

///
pub fn colgroup(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("colgroup", attributes, children)
}

///
pub fn table(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("table", attributes, children)
}

///
pub fn tbody(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("tbody", attributes, children)
}

///
pub fn td(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("td", attributes, children)
}

///
pub fn tfoot(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("tfoot", attributes, children)
}

///
pub fn th(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("th", attributes, children)
}

///
pub fn thead(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("thead", attributes, children)
}

///
pub fn tr(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("tr", attributes, children)
}

// FORMS ----------------------------------------------------------------------

///
pub fn button(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("button", attributes, children)
}

///
pub fn datalist(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("datalist", attributes, children)
}

///
pub fn fieldset(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("fieldset", attributes, children)
}

///
pub fn form(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("form", attributes, children)
}

///
pub fn input(attributes: List(Attribute(g, action))) -> Element {
  node("input", attributes, [])
}

///
pub fn label(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("label", attributes, children)
}

///
pub fn legend(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("legend", attributes, children)
}

///
pub fn meter(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("meter", attributes, children)
}

///
pub fn optgroup(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("optgroup", attributes, children)
}

///
pub fn option(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("option", attributes, children)
}

///
pub fn output(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("output", attributes, children)
}

///
pub fn progress(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("progress", attributes, children)
}

///
pub fn select(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("select", attributes, children)
}

///
pub fn textarea(attributes: List(Attribute(g, action))) -> Element {
  node("textarea", attributes, [])
}

// INTERACTIVE ELEMENTS -------------------------------------------------------

///
pub fn details(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("details", attributes, children)
}

///
pub fn dialog(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("dialog", attributes, children)
}

///
pub fn summary(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("summary", attributes, children)
}

// WEB COMPONENTS -------------------------------------------------------------

///
pub fn slot(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("slot", attributes, children)
}

///
pub fn template(
  attributes: List(Attribute(g, action)),
  children: List(Element),
) -> Element {
  node("template", attributes, children)
}
