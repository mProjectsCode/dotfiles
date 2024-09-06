#!/bin/bash

function project() {
  # project       --> error / print help on how to use it
  if [[ $# -lt 1 ]]; then
    echo "Usage: project [project name]"
    echo "Examples"
    echo "       project list               list all projects"
    echo "       project metabind           switch to the meta bind project"
    echo "       project parsinom           switch to the parsiNOM project"
    echo "       project jsengine           switch to the js engine project"
    return 1
  fi


  # project [arg] --> case statement, do things related to arg
  # readonly arg=${1:?"Missing argument."}

  case $1 in

    "list")
      echo "metabind"
      echo "parsinom"
      return 0
      ;;

    "metabind")
      echo "switching to meta bind"
      cd "$HOME/src/obsidian-meta-bind-plugin"
      openWebstorm .
      return 0
      ;;

    "parsinom")
      echo "switching to parsinom"
      cd "$HOME/src/parsiNOM"
      openWebstorm .
      return 0
      ;;

    "jsengine")
      echo "switching to js engine"
      cd "$HOME/src/obsidian-js-engine-plugin"
      openWebstorm .
      return 0
      ;;

    *)
      echo "I don't know what to do here.\n$(project)"
      return 1
      ;;

  esac
}