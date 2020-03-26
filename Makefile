.PHONY: all clean gitlab build neocities

all: gitlab neocities

clean:
	rm -rf public/*

gitlab:
	git push

build:
	hugo --config neocities-config.toml

neocities: build
	neocities push -e audio public
