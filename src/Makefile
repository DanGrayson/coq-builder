all : linkup-coq84 linkup-coq84hoq ../README.user linkup-ProofGeneral linkup-with
include Makefile.functions
# in the following list, prerequisites appear to the left
PACKAGES = with ocaml hevea gtksourceview2 lablgtk coq84 coq84hoq ProofGeneral
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))
# note: /home/special/ is a directory at IAS that contains user directories:
../README.user: README.user.prototype; sed -e 's@--THISDIRECTORY--@$(topdir)@g' -e 's@/home/special/@~@g' <$< >$@.tmp && rm -f $@ && mv $@.tmp $@ && chmod a-w $@
clean: clean-README.user
clean-README.user:; rm -f ../README.user
