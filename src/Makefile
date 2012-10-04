all : linkup-coq
include Makefile.functions
# in the following list, prerequisites appear to the left
PACKAGES = with ocaml lablgtk hevea coq84
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))

