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


# Clean everything
function docker-clean-all() {
  docker stop `docker ps -qa` > /dev/null
  docker rm `docker ps -qa` > /dev/null
  docker rm -f `docker images -qa` > /dev/null
  docker volume rm $(docker volume ls -q) > /dev/null
  docker network rm `docker network ls -q` > /dev/null
}

# Kubectl
alias kp="kubectl config use-context $EKS_PROD_CONTEXT"
alias kt="kubectl config use-context $EKS_TEST_CONTEXT"
alias kc="kubectl config get-contexts"
