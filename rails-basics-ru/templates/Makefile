setup:
	bin/setup
	yarn

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

slim-lint:
	bundle exec slim-lint app/views/

.PHONY: test
