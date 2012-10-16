include Makefile.functions
all: ../README.user linkup-with
all: linkup-coq84hoq linkup-ProofGeneral
all: install-coqtrunk
# in the following list, prerequisites appear to the left
PACKAGES = with \
	   ocaml hevea \
	   intltool gtksourceview2 lablgtk coq84hoq hott \
	   ProofGeneral \
	   ocaml3 camlp5 coq83patched \
	   alex agda
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))
# note: /home/special/ is a directory at IAS that contains user directories:
../README.user: README.user.prototype; sed -e 's@--THISDIRECTORY--@$(topdir)@g' -e 's@/home/special/@~@g' <$< >$@.tmp && rm -f $@ && mv $@.tmp $@ && chmod a-w $@
clean: clean-README.user
clean-README.user:; rm -f ../README.user
