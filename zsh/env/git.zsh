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
