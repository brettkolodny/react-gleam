// Much of this code was lifted from
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

import { createElement, useState, useEffect, useReducer } from "react";
import { createRoot } from "react-dom/client";

// HOOKS ----------------------------------------------------------------------

export { useState, useEffect, useReducer };

export const useEffectHook = (cb, props) => {
  const cbWrapper = () => {
    const cleanUp = cb();

    if (typeof cleanUp[0] === "function") {
      return cleanUp[0];
    }
  };
  useEffect(cbWrapper, props);
};

export const useEffect0 = (cb) => {
  const cbWrapper = () => {
    const cleanUp = cb();

    if (typeof cleanUp[0] === "function") {
      return cleanUp[0];
    }
  };
  useEffect(cbWrapper, []);
};

// ELEMENTS -------------------------------------------------------------------

/**
 * Creates a react Element
 * @param {string} type Type of Element to create
 * @param {List<Children>} children List of child elements
 * @param {List<Attribute>} _attributes List of element attributes and props
 * @returns {Element} New element
 */
export const node = (type, attributes, children) => {
  const props = toProps(attributes);

  return createElement(
    type,
    props,
    ...children
      .toArray()
      .map((child) => (typeof child === "function" ? child() : child))
  );
};

/**
 * Returns a string to be used as the child of an element
 * @param {string} content
 * @returns {string} the original string
 */
export const text = (content) => content;

/**
 * A workaround for getting custom stateful components to work
 * @param {Element} element
 * @returns {Element}
 */
export const component = (element) => {
  return createElement(element);
};

// UTILITY --------------------------------------------------------------------

/**
 * Render a React app to an element
 * @param {Element} app Root element of a React app
 * @param {string} selector Query selector for the element that the app will attach to
 */
export const render = (app, selector) => {
  const rootElement = document.querySelector(selector);
  const reactRoot = createRoot(rootElement);

  reactRoot.render(app);
};

// HELPERS --------------------------------------------------------------------

const toProps = (attributes) => {
  const capitalize = (s) => s && s[0].toUpperCase() + s.slice(1);

  return Object.fromEntries(
    attributes.toArray().map((attr) => {
      if ("name" in attr && "value" in attr) {
        return [attr.name, attr.value];
      } else if ("name" in attr && "handler" in attr) {
        return ["on" + capitalize(attr.name), (e) => attr.handler(e)];
      } else {
        return [];
      }
    })
  );
};
