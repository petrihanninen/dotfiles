alias g="git "
alias gs="g status "

# Branches
alias gb="g branch "
alias gco="g checkout "
alias gcob="gco -b"
alias gd="g diff "
alias gm="g merge --ff-only "
alias gcp="g cherry-pick "

# Stash
alias gst="g stash "
alias gstp="gst pop "

# Committing
alias ga="g add "
alias gaa="ga . "
alias gc="g commit "
alias gcm="gc -m "
alias gca="gc -a "
alias gcam="gc -am "
alias gc+="gc --amend --no-edit "
alias gc+e="gc --amend "

# Rebasing
alias gr="g rebase "
alias grc="gr --continue "
alias gro="gr origin/HEAD "

# Logging
alias gl="g log "
alias gl1="gl --oneline "
alias glg="gl --oneline --graph "
alias glp="git log --oneline --pretty=format:'%Cred%h%Creset - %s - %Cgreen%an%Creset                    >%C(yellow)(%cr)%Creset' --abbrev-commit --date=relative"
alias glpnd="git log --oneline --pretty=format:'%Cred%h%Creset - %s - %Cgreen%an%Creset                  >%C(yellow)(%cr)%Creset' --abbrev-commit"

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

function pr() {
  gpu
  gh pr create
}

function gcop() {
  gpl
  gco "$(pbpaste)"
  gpl
}
