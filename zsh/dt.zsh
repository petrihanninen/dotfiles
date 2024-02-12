# This file contains shortcuts for the common operations while working with Duunitori codebases

file_location="$HOME/code/dt"
dt5="$file_location/duunitori5"
dta="$file_location/dt5admin"
dtn="$file_location/duunitori-next"
dtb="$file_location/duunitori-backend"
dtj="$file_location/jobbland-frontend"

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

function dtdev() {
  cd $file_location
  s="dt"


  # Attach if session already exists
  if [ $(tmux list-sessions | awk '{print $1}') = "$s:" ]; then
    tmux attach -t $s
    return
  fi

  tmux new-session -d -s $s

  # duunitori5
  tmux new-window -t $s "duunitori5" -c $dt5

  # dt5admin
  tmux new-window -t $s "dt5admin" -c $dta

  # jobbland-frontend
  tmux new-window -t $s "jobbland-frontend" -c $dtj

  # next
  tmux new-session -t $s "duunitori-next" -c $dtn

  # duunitori-backend
  tmux new-window -t $s "duunitori-backend" -c $dtb
}
