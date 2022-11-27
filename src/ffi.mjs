// Much of this code was lifted from
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

import {
  createElement,
  useState,
  useEffect,
  useReducer,
  createContext,
  useContext,
  useMemo,
  useCallback,
  useId,
  useTransition,
  useDebugValue,
} from "react";
import { createRoot } from "react-dom/client";
import * as Gleam from "./gleam.mjs";

// HOOKS ----------------------------------------------------------------------

export {
  useState,
  useEffect,
  useReducer,
  useMemo,
  useCallback,
  useId,
  useTransition,
  useDebugValue,
};

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

// CONTEXT --------------------------------------------------------------------

/**
 * Gleam does not allow us to export a non-const value from a module so to work
 * around this we create a global variable to store all of the app's contexts
 * and supply functions to interact with them.
 */
const contextsMap = new Map();

export const setContext = (key, value) => {
  const context = createContext(value);
  contextsMap.set(key, context);
};

export const getContext = (key) => {
  const context = contextsMap.get(key);

  if (context) {
    return new Gleam.Some(context);
  }

  return new Gleam.None();
};

export { useContext };

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
