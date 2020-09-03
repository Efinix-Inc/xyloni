SUBDIRS := 	blinkAndEcho \
		bootloader \
		EfxApb3Example \
		i2cDemo \
		readFlash \
		spiDemo \
		timerAndGpioInterruptDemo \
		userInterruptDemo \
		writeFlash 

all:
	for dir in $(SUBDIRS); do \
		(cd $$dir; ${MAKE} all); \
	done

clean:
	for dir in $(SUBDIRS); do \
		(cd $$dir; ${MAKE} clean); \
	done

.PHONY: all $(SUBDIRS)
