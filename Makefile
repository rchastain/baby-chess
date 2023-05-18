SOURCES := $(wildcard *.pas)

chess: $(SOURCES)
	fpc -Mobjfpc -Sh $@ -ghl -dDEBUG

release: $(SOURCES)
	fpc -Mobjfpc -Sh chess -dRELEASE

clean:
	rm -f *.bak
	rm -f *.log
	rm -f *.o
	rm -f *.ppu
