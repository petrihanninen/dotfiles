function c() {
	git clone "git@github.com:skyhood/$1.git"
}

function mkcd() {
	mkdir -p "$1"
	cd "$1" || exit
}

mkcd "$HOME/code"
mkcd dt

# Main repos
c duunitori5
c duunitori-next
c duunitori-backend
c jobbland-frontend
c duunitori-kubernetes

# Handbook
c handbook

# Additional repos
c duunitori-warehouse
c moonshot

# Terraform
c duunitori-terraform
c duunitori-backend-terraform

# Strapi
c jobbland-se-strapi
c jobbsafari-no-strapi
c dtx-strapi
