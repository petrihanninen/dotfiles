# Remote
alias gp="g push "
alias gpl="g pull "
alias gpu="g push -u origin HEAD "
alias gpf="g push --force-with-lease "
function gcl() {
  g clone git@github.com:$1
  cd $1
}

# Interactive Rebase
function gri() {
  # Default to HEAD^^
  if [ $# -eq 0]; then
    gr -i HEAD^^
  # With a number given, rebase that many commits
  elif [ $1 -eq $1 2> /dev/null ]; then
    git rebase -i HEAD~$1
  else
    git rebase -i $1
  fi
}

alias gcopr="gh pr checkout "



# GH CLI PRs
function prs() {
  repos=(
    "duunitori5"
    "dt5admin"
    "vaalikone-ehdokas"
    "jobbland-frontend"
    "duunitori-next"
    "duunitori-jobs"
  )

  for repo in "${repos[@]}"; do
    gh pr list -R "skyhood/$repo" --search "is:open draft:false -review:changes_requested -author:app/dependabot"
  done
}

function pr() {
  gpu
  gh pr create
}

function gcop() {
  gpl
  gco "$(pbpaste)"
  gpl
}
