## Module React.Recompose

#### `HigherOrderComponent`

``` purescript
type HigherOrderComponent ownerProps props = ReactClass props -> ReactClass ownerProps
```

#### `mapProps`

``` purescript
mapProps :: forall ownerProps props. (ownerProps -> props) -> HigherOrderComponent ownerProps props
```

#### `withProps`

``` purescript
withProps :: forall ownerProps props. (ownerProps -> props) -> HigherOrderComponent ownerProps props
```

#### `withPropsOnChange`

``` purescript
withPropsOnChange :: forall ownerProps props. Array String -> (ownerProps -> props) -> HigherOrderComponent ownerProps props
```

#### `withHandlers`

``` purescript
withHandlers :: forall ownerProps props handlers. {  | handlers } -> HigherOrderComponent ownerProps props
```

#### `defaultProps`

``` purescript
defaultProps :: forall props. props -> HigherOrderComponent props props
```

#### `renameProp`

``` purescript
renameProp :: forall props. String -> String -> HigherOrderComponent props props
```

#### `renameProps`

``` purescript
renameProps :: forall props nameMap. nameMap -> HigherOrderComponent props props
```

#### `flattenProp`

``` purescript
flattenProp :: forall props. String -> HigherOrderComponent props props
```

#### `withState`

``` purescript
withState :: forall ownerProps props initialState. String -> String -> (props -> initialState) -> HigherOrderComponent ownerProps props
```

#### `withState'`

``` purescript
withState' :: forall ownerProps props initialState. String -> String -> initialState -> HigherOrderComponent ownerProps props
```

A version of withState that takes an initial state rather than a function

#### `withReducer`

``` purescript
withReducer :: forall props state action. String -> String -> (Fn2 state action state) -> state -> HigherOrderComponent props props
```

#### `branch`

``` purescript
branch :: forall props. (props -> Boolean) -> HigherOrderComponent props props -> HigherOrderComponent props props -> HigherOrderComponent props props
```

#### `renderComponent`

``` purescript
renderComponent :: forall props. ReactClass props -> HigherOrderComponent props props
```

#### `renderNothing`

``` purescript
renderNothing :: forall props. HigherOrderComponent props props
```

#### `shouldUpdate`

``` purescript
shouldUpdate :: forall props. (Fn2 props props Boolean) -> HigherOrderComponent props props
```

#### `pure`

``` purescript
pure :: forall props. HigherOrderComponent props props
```

#### `onlyUpdateForKeys`

``` purescript
onlyUpdateForKeys :: forall props. Array String -> HigherOrderComponent props props
```

#### `withContext`

``` purescript
withContext :: forall props childContextTypes childContext. childContextTypes -> (props -> childContext) -> HigherOrderComponent props props
```

#### `getContext`

``` purescript
getContext :: forall ownerProps props contextTypes. contextTypes -> HigherOrderComponent ownerProps props
```

#### `lifecycle`

``` purescript
lifecycle :: forall props spec. spec -> HigherOrderComponent props props
```

#### `toClass`

``` purescript
toClass :: forall props. HigherOrderComponent props props
```

#### `setStatic`

``` purescript
setStatic :: forall props value. String -> value -> HigherOrderComponent props props
```

#### `setDisplayName`

``` purescript
setDisplayName :: forall props. String -> HigherOrderComponent props props
```

#### `getDisplayName`

``` purescript
getDisplayName :: forall component. component -> String
```

#### `wrapDisplayName`

``` purescript
wrapDisplayName :: forall component. component -> String -> String
```

#### `componentFromProp`

``` purescript
componentFromProp :: forall props. String -> ReactClass props
```

#### `nest`

``` purescript
nest :: forall component props. Array component -> ReactClass props
```

#### `hoistStatics`

``` purescript
hoistStatics :: forall props. HigherOrderComponent props props -> HigherOrderComponent props props
```


