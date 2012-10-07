all : linkup-coq ../README.user linkup-ProofGeneral linkup-with
include Makefile.functions
# in the following list, prerequisites appear to the left
PACKAGES = with ocaml lablgtk hevea coq ProofGeneral
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))
# note: /home/special/ is a directory at IAS that contains user directories:
../README.user: README.user.prototype; sed -e 's@--THISDIRECTORY--@$(topdir)@g' -e 's@/home/special/@~@g' <$< >$@.tmp && mv $@.tmp $@
clean: clean-README.user
clean-README.user:; rm -f ../README.user
