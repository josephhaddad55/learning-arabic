.PHONY: dev serve clean_images pre-commit-all
JEKYLL_VERSION=4.2.2

dev:
	pre-commit install

serve:
	docker run --rm --volume="${PWD}:/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:"${JEKYLL_VERSION}" bundle install && bundle exec jekyll serve --watch --drafts --livereload

clean_images:
	docker system prune --all --volumes

pre-commit-all:
	pre-commit run --all-files
