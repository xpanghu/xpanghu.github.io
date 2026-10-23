.PHONY: dev build

dev:
	hugo server --buildDrafts --bind 127.0.0.1 --baseURL http://localhost:1313/

build:
	hugo --gc --minify
