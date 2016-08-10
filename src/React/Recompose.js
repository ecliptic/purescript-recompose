'use strict'

var recompose = require('recompose')

exports.mapProps = recompose.mapProps

exports.withProps = recompose.withProps

exports.withPropsOnChange = function (shouldMapOrKeys) {
  return function (createProps) {
    return recompose.withPropsOnChange(shouldMapOrKeys, createProps)
  }
}

exports.withHandlers = recompose.withHandlers

exports.defaultProps = recompose.defaultProps

exports.renameProp = function (oldName) {
  return function (newName) {
    return recompose.renameProp(oldName, newName)
  }
}

exports.renameProps = recompose.renameProps

exports.flattenProp = recompose.flattenProp

exports.withState = function (stateName) {
  return function (stateUpdaterName) {
    return function (initialState) {
      return recompose.withState(stateName, stateUpdaterName, initialState)
    }
  }
}

exports.withReducer = function (stateName) {
  return function (dispatchName) {
    return function (reducer) {
      return function (initialState) {
        return recompose.withReducer(stateName, dispatchName, reducer, initialState)
      }
    }
  }
}

exports.branch = function (test) {
  return function (left) {
    return function (right) {
      return recompose.branch(test, left, right)
    }
  }
}

exports.renderComponent = recompose.renderComponent

exports.renderNothing = recompose.renderNothing

exports.shouldUpdate = recompose.shouldUpdate

exports.pure = recompose.pure

exports.onlyUpdateForKeys = recompose.onlyUpdateForKeys

exports.withContext = function (childContextTypes) {
  return function (getChildContext) {
    return recompose.withContext(childContextTypes, getChildContext)
  }
}

exports.getContext = recompose.getContext

exports.lifecycle = recompose.lifecycle

exports.toClass = recompose.toClass

exports.setStatic = function (key) {
  return function (value) {
    return recompose.setStatic(key, value)
  }
}

exports.setDisplayName = recompose.setDisplayName

exports.getDisplayName = recompose.getDisplayName

exports.wrapDisplayName = function (component) {
  return function (wrapperName) {
    return recompose.wrapDisplayName(component, wrapperName)
  }
}

exports.componentFromProp = recompose.componentFromProp

exports.nest = recompose.nest

exports.hoistStatics = recompose.hoistStatics
