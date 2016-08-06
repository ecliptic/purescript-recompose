module Recompose
  ( ReactFunctionalComponent
  , HigherOrderComponent
  , mapProps
  , withContext
  ) where

import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4)
import React (ReactClass, ReactElement)

type ReactFunctionalComponent = forall props. Fn1 props ReactElement
type HigherOrderComponent = forall props. Fn1 (ReactClass props) ReactFunctionalComponent

foreign import mapProps :: forall ownerProps props.
  Fn1 (Fn1 ownerProps props) HigherOrderComponent

foreign import withProps :: forall ownerProps props.
  Fn1 (Fn1 ownerProps props) HigherOrderComponent

foreign import withPropsOnChange :: forall ownerProps props.
  Fn2 (Array String) (Fn1 ownerProps props) HigherOrderComponent

foreign import withHandlers :: forall handlerCreators.
  Fn1 handlerCreators HigherOrderComponent

foreign import defaultProps :: forall props. Fn1 props HigherOrderComponent

foreign import renameProp :: Fn2 String String HigherOrderComponent

foreign import renameProps :: forall nameMap. Fn1 nameMap HigherOrderComponent

foreign import flattenProp :: Fn1 String HigherOrderComponent

foreign import withState :: forall initialState props.
  Fn3 String String (Fn1 props initialState) HigherOrderComponent

foreign import withReducer :: forall state action.
  Fn4 String String (Fn2 state action state) state HigherOrderComponent

foreign import branch :: forall props.
  Fn3 (Fn1 props Boolean) HigherOrderComponent HigherOrderComponent HigherOrderComponent

foreign import renderComponent :: forall props. Fn1 (ReactClass props) HigherOrderComponent

foreign import renderNothing :: HigherOrderComponent

foreign import shouldUpdate :: forall props nextProps.
  Fn1 (Fn2 props nextProps Boolean) HigherOrderComponent

foreign import pure :: HigherOrderComponent

foreign import onlyUpdateForKeys :: Fn1 (Array String) HigherOrderComponent

foreign import onlyUpdateForPropTypes :: HigherOrderComponent

foreign import withContext :: forall props childContextTypes childContext.
  Fn2 childContextTypes (Fn1 props childContext) HigherOrderComponent

foreign import getContext :: forall contextTypes.
  Fn1 contextTypes HigherOrderComponent

foreign import lifecycle :: forall spec. Fn1 spec HigherOrderComponent

foreign import toClass :: HigherOrderComponent

foreign import setStatic :: forall value. Fn2 String value HigherOrderComponent

foreign import setPropTypes :: forall propTypes.
  Fn1 propTypes HigherOrderComponent

foreign import setDisplayName :: Fn1 String HigherOrderComponent

foreign import getDisplayName :: forall component. Fn1 component String

foreign import wrapDisplayName :: forall component.
  Fn2 component String String

foreign import componentFromProp :: Fn1 String ReactFunctionalComponent

foreign import nest :: forall component props.
  Fn1 (Array component) (ReactClass props)

foreign import hoistStatics :: Fn1 HigherOrderComponent HigherOrderComponent
