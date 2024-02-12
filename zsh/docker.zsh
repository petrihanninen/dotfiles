# Docker ps
alias dp="docker ps --format \"table {{.Names}}\t{{.Status}}\""
alias dpp="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.Ports}}\""
alias dps="docker ps"

# Docker running
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcua="docker-compose up"


# Colima
alias clm="colima "
alias clms="clm start "
alias clmss="clms --memory 8 "
alias clmsp="clm stop "
alias clmsf="clmsp --force "
alias clmr="clm restart "


