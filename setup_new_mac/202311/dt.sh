function c() {
	git clone "git@github.com:skyhood/$1.git"
}

: '
cd $HOME/code
mkdir dt
cd dt
'

cd $HOME/code/dt

c duunitori5
c dt5admin
c duunitori-backend
c duunitori-next
c moonshot
c duunitori-kubernetes
c jobbland-frontend
c duunitori-ad-feeds
c handbook
c ciam
c duunitori-warehouse
c sales-event-tracking
c duunitori-terraform
c jobbland-se-strapi
c jobbsafari-no-strapi
c duunitori-backend-terraform
c ga-jobentry-analytics
c duunitori-down-notice
