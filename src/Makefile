PACKAGES = with ocaml lablgtk hevea coq84 coqtrunk
all : install-coqtrunk install-coq84
include Makefile.functions
# in the following list, prerequisites appear to the left
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))

