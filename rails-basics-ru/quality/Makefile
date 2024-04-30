setup:
	bin/setup
	yarn install
	bin/rails db:drop
	bin/rails db:migrate
	bin/rails db:seed
	
start:
	bin/dev

console:
	bin/rails console

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test

lint:
	bundle exec rubocop app

lint-fix:
	bundle exec rubocop app -A

.PHONY: test
