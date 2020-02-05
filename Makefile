.PHONY: test
.PHONY: tests

test:
	make tests

tests:
	bundle exec rspec
