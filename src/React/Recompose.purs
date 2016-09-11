module React.Recompose
  ( HigherOrderComponent
  , mapProps
  , withProps
  , withPropsOnChange
  , withHandlers
  , defaultProps
  , renameProp
  , renameProps
  , flattenProp
  , withState
  , withState'
  , withReducer
  , branch
  , renderComponent
  , renderNothing
  , shouldUpdate
  , pure
  , onlyUpdateForKeys
  , withContext
  , getContext
  , lifecycle
  , toClass
  , setStatic
  , setDisplayName
  , getDisplayName
  , wrapDisplayName
  , componentFromProp
  , nest
  , hoistStatics
  ) where

import Prelude
import Data.Function.Uncurried (Fn2)
import React (ReactClass)

-- | A higher-order component is a function that accepts a single React
-- | component and returns a new React component.
type HigherOrderComponent ownerProps props =
  ReactClass props -> ReactClass ownerProps

-- | ## Higher-order components

-- | Accepts a function that maps ownerProps to a new collection of props that
-- | are passed to the base component.
foreign import mapProps :: forall ownerProps props.
  (ownerProps -> props) -> HigherOrderComponent ownerProps props

-- | Like `mapProps`, expect the newly created props are merged with the
-- | ownerProps.
foreign import withProps :: forall ownerProps props.
  (ownerProps -> props) -> HigherOrderComponent ownerProps props

-- | Like `withProps`, except that new props are only created when one of the
-- | ownerProps specified by the array of keys changes. This helps ensure that
-- | expensive computations inside the given mapProps function are only executed
-- | when necessary.
foreign import withPropsOnChange :: forall ownerProps props.
  Array String -> (ownerProps -> props) -> HigherOrderComponent ownerProps props

-- | Takes a Record mapping handlerNames to handler creators. These are
-- | higher-order functions that accept a set of props and return a function
-- | handler.
-- |
-- | An example handler creator:
-- |
-- | ```purescript
-- | addTodo :: forall props event target eff.
-- |   { add :: String -> Eff eff Unit | props } ->
-- |   { target :: { value :: String | target } | event } ->
-- |   Eff eff Unit
-- | addTodo props event = props.add event.target.value
-- | ```
foreign import withHandlers :: forall ownerProps props handlers.
  Record handlers -> HigherOrderComponent ownerProps props

-- | Specifies props to be passed by default to the base component. Similar to
-- | `withProps`, except the props from the owner take precedence over props
-- | provided to the HoC.
foreign import defaultProps :: forall props.
  props -> HigherOrderComponent props props

-- | Renames a single prop.
foreign import renameProp :: forall props.
  String -> String -> HigherOrderComponent props props

-- | Renames multiple props, using a Record of old prop names to new prop names.
foreign import renameProps :: forall props nameMap.
  nameMap -> HigherOrderComponent props props

-- | Flattens a prop so that its fields are spread out into the props Record.
foreign import flattenProp :: forall props.
  String -> HigherOrderComponent props props

-- | Passes two additional props to the base component: a state value, and a
-- | function to update that state value. Accepts a name for the state value, a
-- | name for the state updater, and a function that takes props and returns an
-- | an initial value for the state.
foreign import withState :: forall ownerProps props initialState.
  String -> String -> (props -> initialState) ->
  HigherOrderComponent ownerProps props

-- | A version of `withState` that takes an initial state rather than a
-- | function.
withState' :: forall ownerProps props initialState.
  String -> String -> initialState -> HigherOrderComponent ownerProps props
withState' stateName stateUpdaterName =
  withState stateName stateUpdaterName <<< const

-- | Similar to `withState`, but state updates are applied using a reducer
-- | function. Accepts a name for the state value and a name for the dispatch
-- | function. The third argument is a function that receives a state and an
-- | action, and returns a new state.
foreign import withReducer :: forall props state action.
  String -> String -> (Fn2 state action state) -> state ->
  HigherOrderComponent props props

-- | Accepts a test function and two higher-order components. The test function
-- | is passed the props from the owner. If it returns true, the left
-- | higher-order component is applied to the base component; otherwise, the
-- | right higher-order component is applied.
foreign import branch :: forall props.
  (props -> Boolean) -> HigherOrderComponent props props ->
  HigherOrderComponent props props -> HigherOrderComponent props props

-- | Takes a component and returns a higher-order component version of that
-- | component. This is useful in combination with another helper that expects a
-- | higher-order component, like `branch`.
foreign import renderComponent :: forall props.
  ReactClass props -> HigherOrderComponent props props

-- | A higher-order component that always renders a JavaScript `null`.
foreign import renderNothing :: forall props. HigherOrderComponent props props

-- | A higher-order component version of
-- | [`shouldComponentUpdate()`](https://facebook.github.io/react/docs/component-specs.html#updating-shouldcomponentupdate).
foreign import shouldUpdate :: forall props.
  (Fn2 props props Boolean) -> HigherOrderComponent props props

-- | Prevents the component from updating unless a prop has changed. Uses a
-- | JavaScript `shallowEqual()` to test for changes.
foreign import pure :: forall props. HigherOrderComponent props props

-- | Prevents the component from updating unless a prop corresponding to one of
-- | the given keys has updated. Uses a JavaScript `shallowEqual()` to test for
-- | changes.
foreign import onlyUpdateForKeys :: forall props.
  Array String -> HigherOrderComponent props props

-- | Provides context to the component's children. `childContextTypes` is a
-- | Record of React prop types. The second argument is a function that returns
-- | the child context. Use along with `getContext`.
foreign import withContext :: forall props childContextTypes childContext.
  childContextTypes -> (props -> childContext) ->
  HigherOrderComponent props props

-- | Gets values from context and passes them along as props. Use along with
-- | `withContext`.
foreign import getContext :: forall ownerProps props contextTypes.
  contextTypes -> HigherOrderComponent ownerProps props

-- | A higher-order component version of `React.createClass()`. It supports the
-- | entire `createClass()` API, except the `render()` method, which is
-- | implemented by default (and overridden if specified; an error will be
-- | logged to the console).
foreign import lifecycle :: forall props spec.
  spec -> HigherOrderComponent props props

-- | Takes a function component and wraps it in a class. This can be used as a
-- | fallback for libraries that need to add a ref to a component, like Relay.
-- | If the base component is already a class, it returns the given component.
foreign import toClass :: forall props. HigherOrderComponent props props

-- | ## Static property helpers

-- | Assigns a value to a static property on the base component.
foreign import setStatic :: forall props value.
  String -> value -> HigherOrderComponent props props

-- | Assigns to the `displayName` property on the base component.
foreign import setDisplayName :: forall props.
  String -> HigherOrderComponent props props

-- | ## Utilities

-- | Returns the display name of a React component. Falls back to "Component".
foreign import getDisplayName :: forall component. component -> String

-- | Returns a wrapped version of a React component's display name. For
-- | instance, if the display name of component is "Post", and the wrapper name
-- | is "mapProps", the return value is "mapProps(Post)". Most Recompose
-- | higher-order components use `wrapDisplayName`.
foreign import wrapDisplayName :: forall component.
  component -> String -> String

-- | Creates a component that accepts a component as a prop and renders it with
-- | the remaining props.
foreign import componentFromProp :: forall props.
  String -> ReactClass props

-- | Composes components by nesting each one inside the previous.
foreign import nest :: forall component props.
  Array component -> ReactClass props

-- | Augments a higher-order component so that when used, it copies static
-- | properties from the base component to the new component. This is helpful
-- | when using Recompose with libraries like Relay.
foreign import hoistStatics :: forall props.
  HigherOrderComponent props props -> HigherOrderComponent props props
