module Recompose
  ( ReactFunctionalComponent
  , HigherOrderComponent
  , mapProps
  , withProps
  , withPropsOnChange
  , withHandlers
  , defaultProps
  , renameProp
  , renameProps
  , flattenProp
  , withState
  , withReducer
  , branch
  , renderComponent
  , renderNothing
  , shouldUpdate
  , pure
  , onlyUpdateForKeys
  , onlyUpdateForPropTypes
  , withContext
  , getContext
  , lifecycle
  , toClass
  , setStatic
  , setPropTypes
  , setDisplayName
  , getDisplayName
  , wrapDisplayName
  , componentFromProp
  , nest
  , hoistStatics
  ) where

import Data.Function.Uncurried (Fn2)
import React (ReactClass, ReactElement)

type ReactFunctionalComponent = forall props. props -> ReactElement
type HigherOrderComponent = forall props.
  ReactClass props -> ReactFunctionalComponent

foreign import mapProps :: forall ownerProps props.
  (ownerProps -> props) -> HigherOrderComponent

foreign import withProps :: forall ownerProps props.
  (ownerProps -> props) -> HigherOrderComponent

foreign import withPropsOnChange :: forall ownerProps props.
  Array String -> (ownerProps -> props) -> HigherOrderComponent

foreign import withHandlers :: forall handlerCreators.
  handlerCreators -> HigherOrderComponent

foreign import defaultProps :: forall props. props -> HigherOrderComponent

foreign import renameProp :: String -> String -> HigherOrderComponent

foreign import renameProps :: forall nameMap. nameMap -> HigherOrderComponent

foreign import flattenProp :: String -> HigherOrderComponent

foreign import withState :: forall initialState props.
  String -> String -> (props -> initialState) -> HigherOrderComponent

foreign import withReducer :: forall state action.
  String -> String -> (Fn2 state action state) -> state -> HigherOrderComponent

foreign import branch :: forall props.
  (props -> Boolean) -> HigherOrderComponent -> HigherOrderComponent ->
  HigherOrderComponent

foreign import renderComponent :: forall props.
  ReactClass props -> HigherOrderComponent

foreign import renderNothing :: HigherOrderComponent

foreign import shouldUpdate :: forall props nextProps.
  (Fn2 props nextProps Boolean) -> HigherOrderComponent

foreign import pure :: HigherOrderComponent

foreign import onlyUpdateForKeys :: Array String -> HigherOrderComponent

foreign import onlyUpdateForPropTypes :: HigherOrderComponent

foreign import withContext :: forall props childContextTypes childContext.
  childContextTypes -> (props -> childContext) -> HigherOrderComponent

foreign import getContext :: forall contextTypes.
  contextTypes -> HigherOrderComponent

foreign import lifecycle :: forall spec. spec -> HigherOrderComponent

foreign import toClass :: HigherOrderComponent

foreign import setStatic :: forall value.
  String -> value -> HigherOrderComponent

foreign import setPropTypes :: forall propTypes.
  propTypes -> HigherOrderComponent

foreign import setDisplayName :: String -> HigherOrderComponent

foreign import getDisplayName :: forall component. component -> String

foreign import wrapDisplayName :: forall component.
  component -> String -> String

foreign import componentFromProp :: String -> ReactFunctionalComponent

foreign import nest :: forall component props.
  Array component -> ReactClass props

foreign import hoistStatics :: HigherOrderComponent -> HigherOrderComponent
