.PHONY: all clean gitlab build neocities

NEOCITIES_FLAGS = -e audio

clean:
	rm -rf public/*

gitlab:
	git push

build:
	hugo --config neocities-config.toml

neocities: build
	neocities push $(NEOCITIES_FLAGS)\
		-e images/baako\
		-e images/cover-art\
		\
		public

neocities-full: build
	neocities push $(NEOCITIES_FLAGS) public
