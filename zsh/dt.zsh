# This file contains shortcuts for the common operations while working with Duunitori codebases

file_location="$HOME/code/dt"
dt5="$file_location/duunitori5"
dta="$file_location/dt5admin"
dtn="$file_location/duunitori-next"
dtb="$file_location/duunitori-backend"
dtj="$file_location/jobbland-frontend"

alias cdc="cd $file_location "
alias cdt="cd $dt5 "
alias cdta="cd $dta "
alias cdn="cd $dtn "
alias cds="cd $dt "
alias cdb="cd $dtb "
alias cdj="cd $dtj "

function dt-cmd() {
  make app-run-command command="$@"
}

function get_testing_branch() {
  repo="$(basename -s .git `git config --get remote.origin.url`)"
  branch="main"

  case "$repo" in
    "duunitori5" )
      branch="testing" ;;
    "dt5admin" )
      branch="testing" ;;
    "jobbland-frontend" )
      branch="development" ;;
    "duunitori-next" )
      branch="dev" ;;
  esac

  echo $branch
}


function gcos() {
  branch="$(get_testing_branch)"
  git checkout $branch
}

function grt() {
  branch="$(get_testing_branch)"
  git fetch origin $branch:$branch

  hasChanges="$(git status --porcelain --untracked-files=no)"
  if [[ $hasChanges ]]; then
    git stash
  fi

  git rebase $branch
  
  if [[ $hasChanges ]]; then
    git stash pop
  fi
}
function dtt() {
  cdc
  tmux
}

function dt() {
  cdc

  if [[ $# -eq 0 ]]; then
    return
  fi

  $HOME/dotfiles/session-$1.sh
  tmux attach-session -t duunitori
}

