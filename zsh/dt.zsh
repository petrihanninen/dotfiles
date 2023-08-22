# This file contains shortcuts for the common operations while working with Duunitori codebases

file_location="~/code"
dt5="$file_location/duunitori5"
dta="$file_location/dt5admin"
dtn="$file_location/duunitori-next"

alias cdt="cd $dt5 "
alias cdta="cd $dta "
alias cdn="cd $dtn"

function dt-cmd() {
  make app-run-command command="$@"
}

