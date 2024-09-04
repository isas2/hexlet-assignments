setup:
	bin/setup
	yarn install
	yarn build
	yarn build:css
	bin/rails db:fixtures:load

start:
	bin/dev

console:
	bin/rails console

test:
	NODE_ENV=test bin/rails test

lint:
	bundle exec rubocop app
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop app -A

.PHONY: test
