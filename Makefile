.PHONY: all clean gitlab build neocities neocities-full neocities-supporter archive

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
		-e extra/credits\
		-e extra/discord\
		-e extra/email\
		-e extra/gateway\
		-e extra/jerk-forward\
		-e extra/mfsb\
		-e extra/old-designs\
		-e extra/pre-website\
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

neocities-supporter: build
	rclone sync public neocities: -P

archive: build
	zip -r $$(date +"%F")-curbie.kevinson.org.zip *
