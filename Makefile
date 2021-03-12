.PHONY: all clean gitlab build neocities neocities-full neocities-supporter archive

NEOCITIES_FLAGS = -e audio

clean:
	rm -rf public/*

gitlab:
	git push

build:
	hugo

neocities: build
	neocities push $(NEOCITIES_FLAGS)\
		-e extra\
		-e extra/credits\
		-e extra/discord\
		-e extra/email\
		-e extra/gateway\
		-e extra/old-designs\
		-e extra/pedometer\
		-e extra/pre-website\
		-e extra/text-files\
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
	zip -r $$(date +"%F")-kirby.kevinson.org.zip *
