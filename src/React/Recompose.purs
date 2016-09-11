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

type HigherOrderComponent ownerProps props =
  ReactClass props -> ReactClass ownerProps

foreign import mapProps :: forall ownerProps props.
  (ownerProps -> props) -> HigherOrderComponent ownerProps props

foreign import withProps :: forall ownerProps props.
  (ownerProps -> props) -> HigherOrderComponent ownerProps props

foreign import withPropsOnChange :: forall ownerProps props.
  Array String -> (ownerProps -> props) -> HigherOrderComponent ownerProps props

foreign import withHandlers :: forall ownerProps props handlers.
  Record handlers -> HigherOrderComponent ownerProps props

foreign import defaultProps :: forall props.
  props -> HigherOrderComponent props props

foreign import renameProp :: forall props.
  String -> String -> HigherOrderComponent props props

foreign import renameProps :: forall props nameMap.
  nameMap -> HigherOrderComponent props props

foreign import flattenProp :: forall props.
  String -> HigherOrderComponent props props

foreign import withState :: forall ownerProps props initialState.
  String -> String -> (props -> initialState) ->
  HigherOrderComponent ownerProps props

-- | A version of withState that takes an initial state rather than a function
withState' :: forall ownerProps props initialState.
  String -> String -> initialState -> HigherOrderComponent ownerProps props
withState' stateName stateUpdaterName =
  withState stateName stateUpdaterName <<< const

foreign import withReducer :: forall props state action.
  String -> String -> (Fn2 state action state) -> state ->
  HigherOrderComponent props props

foreign import branch :: forall props.
  (props -> Boolean) -> HigherOrderComponent props props ->
  HigherOrderComponent props props -> HigherOrderComponent props props

foreign import renderComponent :: forall props.
  ReactClass props -> HigherOrderComponent props props

foreign import renderNothing :: forall props. HigherOrderComponent props props

foreign import shouldUpdate :: forall props.
  (Fn2 props props Boolean) -> HigherOrderComponent props props

foreign import pure :: forall props. HigherOrderComponent props props

foreign import onlyUpdateForKeys :: forall props.
  Array String -> HigherOrderComponent props props

foreign import withContext :: forall props childContextTypes childContext.
  childContextTypes -> (props -> childContext) ->
  HigherOrderComponent props props

foreign import getContext :: forall ownerProps props contextTypes.
  contextTypes -> HigherOrderComponent ownerProps props

foreign import lifecycle :: forall props spec.
  spec -> HigherOrderComponent props props

foreign import toClass :: forall props. HigherOrderComponent props props

foreign import setStatic :: forall props value.
  String -> value -> HigherOrderComponent props props

foreign import setDisplayName :: forall props.
  String -> HigherOrderComponent props props

foreign import getDisplayName :: forall component. component -> String

foreign import wrapDisplayName :: forall component.
  component -> String -> String

foreign import componentFromProp :: forall props.
  String -> ReactClass props

foreign import nest :: forall component props.
  Array component -> ReactClass props

foreign import hoistStatics :: forall props.
  HigherOrderComponent props props -> HigherOrderComponent props props
