.POSIX:

.PHONY: new test

POST_NAME := $(word 2,$(MAKECMDGOALS))

new:
	@if [ -z "$(POST_NAME)" ]; then \
		echo "Usage: make new <post-name>"; \
		exit 1; \
	fi
	hugo new --kind post-bundle posts/$(POST_NAME)
	git checkout -b "post-$(POST_NAME)"

test:
	hugo server --buildDrafts --buildFuture --noHTTPCache

# Absorb extra arguments
%::
	@:
