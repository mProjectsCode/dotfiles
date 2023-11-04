#!/bin/bash

# runns a command in windows, but the working directory seems a bit broken
cmd() {
  CMD=$1
  shift;
  ARGS=$@
  WIN_PWD=`wslpath -w "$(pwd)"`
  cmd.exe /c "pushd ${WIN_PWD} && ${CMD} ${ARGS}"
}