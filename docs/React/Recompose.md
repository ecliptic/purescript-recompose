## Module React.Recompose

#### `HigherOrderComponent`

``` purescript
type HigherOrderComponent ownerProps props = ReactClass props -> ReactClass ownerProps
```

A higher-order component is a function that accepts a single React
component and returns a new React component.

#### `mapProps`

``` purescript
mapProps :: forall ownerProps props. (ownerProps -> props) -> HigherOrderComponent ownerProps props
```

## Higher-order components
Accepts a function that maps ownerProps to a new collection of props that
are passed to the base component.

#### `withProps`

``` purescript
withProps :: forall ownerProps props. (ownerProps -> props) -> HigherOrderComponent ownerProps props
```

Like `mapProps`, expect the newly created props are merged with the
ownerProps.

#### `withPropsOnChange`

``` purescript
withPropsOnChange :: forall ownerProps props. Array String -> (ownerProps -> props) -> HigherOrderComponent ownerProps props
```

Like `withProps`, except that new props are only created when one of the
ownerProps specified by the array of keys changes. This helps ensure that
expensive computations inside the given mapProps function are only executed
when necessary.

#### `withHandlers`

``` purescript
withHandlers :: forall ownerProps props handlers. {  | handlers } -> HigherOrderComponent ownerProps props
```

Takes a Record mapping handlerNames to handler creators. These are
higher-order functions that accept a set of props and return a function
handler.

An example handler creator:

```purescript
addTodo :: forall props event target eff.
  { add :: String -> Eff eff Unit | props } ->
  { target :: { value :: String | target } | event } ->
  Eff eff Unit
addTodo props event = props.add event.target.value
```

#### `defaultProps`

``` purescript
defaultProps :: forall props. props -> HigherOrderComponent props props
```

Specifies props to be passed by default to the base component. Similar to
`withProps`, except the props from the owner take precedence over props
provided to the HoC.

#### `renameProp`

``` purescript
renameProp :: forall props. String -> String -> HigherOrderComponent props props
```

Renames a single prop.

#### `renameProps`

``` purescript
renameProps :: forall props nameMap. nameMap -> HigherOrderComponent props props
```

Renames multiple props, using a Record of old prop names to new prop names.

#### `flattenProp`

``` purescript
flattenProp :: forall props. String -> HigherOrderComponent props props
```

Flattens a prop so that its fields are spread out into the props Record.

#### `withState`

``` purescript
withState :: forall ownerProps props initialState. String -> String -> (props -> initialState) -> HigherOrderComponent ownerProps props
```

Passes two additional props to the base component: a state value, and a
function to update that state value. Accepts a name for the state value, a
name for the state updater, and a function that takes props and returns an
an initial value for the state.

#### `withState'`

``` purescript
withState' :: forall ownerProps props initialState. String -> String -> initialState -> HigherOrderComponent ownerProps props
```

A version of `withState` that takes an initial state rather than a
function.

#### `withReducer`

``` purescript
withReducer :: forall props state action. String -> String -> (Fn2 state action state) -> state -> HigherOrderComponent props props
```

Similar to `withState`, but state updates are applied using a reducer
function. Accepts a name for the state value and a name for the dispatch
function. The third argument is a function that receives a state and an
action, and returns a new state.

#### `branch`

``` purescript
branch :: forall props. (props -> Boolean) -> HigherOrderComponent props props -> HigherOrderComponent props props -> HigherOrderComponent props props
```

Accepts a test function and two higher-order components. The test function
is passed the props from the owner. If it returns true, the left
higher-order component is applied to the base component; otherwise, the
right higher-order component is applied.

#### `renderComponent`

``` purescript
renderComponent :: forall props. ReactClass props -> HigherOrderComponent props props
```

Takes a component and returns a higher-order component version of that
component. This is useful in combination with another helper that expects a
higher-order component, like `branch`.

#### `renderNothing`

``` purescript
renderNothing :: forall props. HigherOrderComponent props props
```

A higher-order component that always renders a JavaScript `null`.

#### `shouldUpdate`

``` purescript
shouldUpdate :: forall props. (Fn2 props props Boolean) -> HigherOrderComponent props props
```

A higher-order component version of
[`shouldComponentUpdate()`](https://facebook.github.io/react/docs/component-specs.html#updating-shouldcomponentupdate).

#### `pure`

``` purescript
pure :: forall props. HigherOrderComponent props props
```

Prevents the component from updating unless a prop has changed. Uses a
JavaScript `shallowEqual()` to test for changes.

#### `onlyUpdateForKeys`

``` purescript
onlyUpdateForKeys :: forall props. Array String -> HigherOrderComponent props props
```

Prevents the component from updating unless a prop corresponding to one of
the given keys has updated. Uses a JavaScript `shallowEqual()` to test for
changes.

#### `withContext`

``` purescript
withContext :: forall props childContextTypes childContext. childContextTypes -> (props -> childContext) -> HigherOrderComponent props props
```

Provides context to the component's children. `childContextTypes` is a
Record of React prop types. The second argument is a function that returns
the child context. Use along with `getContext`.

#### `getContext`

``` purescript
getContext :: forall ownerProps props contextTypes. contextTypes -> HigherOrderComponent ownerProps props
```

Gets values from context and passes them along as props. Use along with
`withContext`.

#### `lifecycle`

``` purescript
lifecycle :: forall props spec. spec -> HigherOrderComponent props props
```

A higher-order component version of `React.createClass()`. It supports the
entire `createClass()` API, except the `render()` method, which is
implemented by default (and overridden if specified; an error will be
logged to the console).

#### `toClass`

``` purescript
toClass :: forall props. HigherOrderComponent props props
```

Takes a function component and wraps it in a class. This can be used as a
fallback for libraries that need to add a ref to a component, like Relay.
If the base component is already a class, it returns the given component.

#### `setStatic`

``` purescript
setStatic :: forall props value. String -> value -> HigherOrderComponent props props
```

## Static property helpers
Assigns a value to a static property on the base component.

#### `setDisplayName`

``` purescript
setDisplayName :: forall props. String -> HigherOrderComponent props props
```

Assigns to the `displayName` property on the base component.

#### `getDisplayName`

``` purescript
getDisplayName :: forall component. component -> String
```

## Utilities
Returns the display name of a React component. Falls back to "Component".

#### `wrapDisplayName`

``` purescript
wrapDisplayName :: forall component. component -> String -> String
```

Returns a wrapped version of a React component's display name. For
instance, if the display name of component is "Post", and the wrapper name
is "mapProps", the return value is "mapProps(Post)". Most Recompose
higher-order components use `wrapDisplayName`.

#### `componentFromProp`

``` purescript
componentFromProp :: forall props. String -> ReactClass props
```

Creates a component that accepts a component as a prop and renders it with
the remaining props.

#### `nest`

``` purescript
nest :: forall component props. Array component -> ReactClass props
```

Composes components by nesting each one inside the previous.

#### `hoistStatics`

``` purescript
hoistStatics :: forall props. HigherOrderComponent props props -> HigherOrderComponent props props
```

Augments a higher-order component so that when used, it copies static
properties from the base component to the new component. This is helpful
when using Recompose with libraries like Relay.


