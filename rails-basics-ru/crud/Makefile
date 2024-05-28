setup:
	bin/setup
	yarn install

start:
	bin/dev

console:
	bin/rails console

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test test/hexlet-check

lint:
	bundle exec rubocop app

lint-fix:
	bundle exec rubocop app -A

.PHONY: test
