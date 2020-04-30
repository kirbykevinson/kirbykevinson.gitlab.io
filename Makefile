.PHONY: all clean gitlab build neocities archive

NEOCITIES_FLAGS = -e audio

clean:
	rm -rf public/*

gitlab:
	git push

build:
	hugo --config neocities-config.toml

neocities: build
	neocities push $(NEOCITIES_FLAGS)\
		-e extra\
		-e extra/baako\
		-e extra/jerk-forward\
		-e extra/mfsb\
		-e extra/old-designs\
		-e extra/user-agent-test\
		-e extra/www\
		-e fonts\
		-e images\
		-e images/backgrounds\
		-e images/buttons\
		-e images/cover-art\
		-e images/cursors\
		-e images/icons\
		\
		public

neocities-full: build
	neocities push $(NEOCITIES_FLAGS) public

archive: build
	zip -r $$(date +"%F")-kirbykevinson.neocities.org.zip *
