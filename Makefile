# see src/Makefile for details
all clean:; +make -C src $@
checker:; +make -C src APPS=" ProofGeneral checker with " all
