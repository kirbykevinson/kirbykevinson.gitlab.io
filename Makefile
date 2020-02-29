.PHONY: all gitlab neocities

all: gitlab neocities

gitlab:
	git push

neocities:
	hugo --config neocities-config.toml
	
	neocities push public
