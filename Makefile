# see src/Makefile for details

all clean status:; +$(MAKE) -C src $@
distclean:clean; rm -rf bin encap* etc include lib man packages share sbin doc

# run "make checker" to make TTS checker and not to make coq:
checker:; +$(MAKE) -C src APPS=" ProofGeneral checker with " all
