#!/bin/bash

# from https://superuser.com/questions/305933/preventing-bash-from-displaying-done-when-a-background-command-finishes-execut
silent_background() {
  ("$@" &) &> /dev/null
  disown &> /dev/null  # Close STD{OUT,ERR} for silence if job has already completed
}


# opens currend working directory in webstorm
openWebstorm() {
  if [[ $# -lt 1 ]]; then
    echo "needs a path argument"
    return 1
  fi

  dir=$(readlink -f "$1")
  echo "$dir"
  # call into windows to run the webstorm command with the pieced together wsl path
 
  silent_background cmd.exe /c "webstorm \"\\\\wsl\$\\Ubuntu$dir\""
}