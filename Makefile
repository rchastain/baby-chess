SOURCES := $(wildcard *.pas)

chess: $(SOURCES)
	fpc -Mobjfpc -Sh chess -dRELEASE

debug: $(SOURCES)
	fpc -Mobjfpc -Sh chess -ghl -dDEBUG

original: $(SOURCES)
	fpc -Mobjfpc -Sh chess -dRELEASE -dORIGINAL_PICTURES

clean:
	rm -f *.bak
	rm -f *.log
	rm -f *.o
	rm -f *.ppu
