.PHONY: all clean gitlab neocities

all: gitlab neocities

clean:
	rm -rf public/*

gitlab:
	git push

neocities: clean
	hugo --config neocities-config.toml
	
	neocities push -e audio public
