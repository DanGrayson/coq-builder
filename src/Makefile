include Makefile.functions
all: ../README.user linkup-with
all: linkup-coq84hoq linkup-ProofGeneral
all: install-coqtrunk
# for now we use ocaml3 instead of ocaml (version 4), which is too new for coq 8.3
OCAMLSWITCH = ocaml3

# in the following list, prerequisites appear to the left
PACKAGES = with \
	   $(OCAMLSWITCH) \
	   hevea \
	   intltool gtksourceview2 lablgtk coq84hoq hott \
	   ProofGeneral \
	   camlp5 coq83patched \
	   coqtrunk \
	   alex agda
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))
# note: /home/special/ is a directory at IAS that contains user directories:
../README.user: README.user.prototype; sed -e 's@--THISDIRECTORY--@$(topdir)@g' -e 's@/home/special/@~@g' <$< >$@.tmp && rm -f $@ && mv $@.tmp $@ && chmod a-w $@
clean: clean-README.user
clean-README.user:; rm -f ../README.user
