# purescript-recompose

[![Latest release](https://img.shields.io/bower/v/purescript-recompose.svg)](https://github.com/ecliptic/purescript-recompose/releases)
[![Build Status](https://travis-ci.org/ecliptic/purescript-recompose.svg?branch=master)](https://travis-ci.org/ecliptic/purescript-recompose)

A PureScript interface to [recompose](https://github.com/acdlite/recompose), a “React utility belt for functional components and higher-order components”. Recompose provides a great way to access React’s features in a more functional way, and it defines many useful higher-order components for easy composition.

* [`purescript-recompose` API documentation](https://github.com/ecliptic/purescript-recompose/blob/master/docs/React/Recompose.md)
* [Original `recompose` API documentation](https://github.com/acdlite/recompose/blob/master/docs/API.md)
* [Example TodoMVC implementation](https://github.com/ecliptic/purescript-recompose-todomvc)

## Usage

Install with bower:

		$ bower install --save purescript-recompose

Compose with your existing components:

```purescript
newTodo :: ReactClass Unit
newTodo = withHandlers handlers $ myComponent
  where handlers = { addTodo }

type HandleAdd props eff =
  { add :: String -> Eff eff Unit | props } ->
  { target :: { value :: String } } ->
  Eff eff Unit

addTodo :: forall props eff. HandleAdd props eff
addTodo props event = props.add event.target.value
```

In this example, `myComponent` is an existing React component. `newTodo` is the resulting component after wrapping it with recompose’s `withHandlers` higher-order component.

## License

MIT
