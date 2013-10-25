# see src/Makefile for details

all clean status:; +make -C src $@
distclean:clean; rm -rf bin encap* etc include lib man packages share sbin doc

# run "make checker" to make TTS checker and not to make coq:
checker:; +make -C src APPS=" ProofGeneral checker with " all
