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

function gbd() {
  git branch --merged | grep -v "^\*\\|$(get_testing_branch)" | xargs -n 1 git branch -d
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

function get_dt_container() {
  echo $(docker ps -f name="duunitori5-dev" --format {{.ID}})
}

function dtconn() {
  docker attach $(get_dt_container)
}

function dtexec() {
  docker exec -it $(get_dt_container) "$@"
}

alias sdn="$HOME/dotfiles/session-dn.sh"
alias sdot="$HOME/dotfiles/session-dot.sh"
alias sdt="$HOME/dotfiles/session-dt.sh"
alias shl="$HOME/dotfiles/session-hl.sh"
alias sjl="$HOME/dotfiles/session-jl.sh"


function dtignore() {
  if [[ $1 == "n" ]]; then
    git update-index --no-skip-worktree compose.yml
    git update-index --no-skip-worktree docker/app/custom_settings.py
  else
    git update-index --skip-worktree compose.yml
    git update-index --skip-worktree docker/app/custom_settings.py
  fi
}

function dtpod() {
  if [[ $1 == "p" ]]; then
    kubectl config use-context dt-prod
    kubectl exec -it $(kubectl get pods -l app=duunitori5-development-pod -n duunitori5 -o jsonpath='{.items[0].metadata.name}') -n duunitori5 -- /bin/bash
  elif [[ $1 == "t" ]]; then
    kubectl config use-context dt-test
    kubectl exec -it $(kubectl get pods -l app=duunitori5-test-development-pod -n duunitori5 -o jsonpath='{.items[0].metadata.name}') -n duunitori5 -- /bin/bash
  else
    echo "Usage: dtpod [p|t]"
  fi
  
}

