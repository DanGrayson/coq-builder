# see src/Makefile for details

all clean status:; +make -C src $@

# run "make checker" to make TTS checker and not to make coq:
checker:; +make -C src APPS=" ProofGeneral checker with " all
