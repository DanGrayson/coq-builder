# These are the apps we want to make visible to users:
APPS = coq84hoq hott ProofGeneral with
# These are the apps to build but make invisible by default, optionally visible using the "with" script:
OTHER_APPS = coqtrunk

# we need to build an "old" version of lablgtk to get this working:
# OTHER_APPS += coq83patched

# use "make FORCE_LINKS=yes" to force replacement of links remaining from another installation
# see Makefile.functions

all: ../README.user
all: $(patsubst %,linkup-%,$(APPS))
all: $(patsubst %,install-%,$(OTHER_APPS))

# Here is a serial number used to specify distinct repositories for our compiled software,
# so we always have a previous version to go back to, if necessary.  Increment it manually at will.
# (Do not put /encap into package makefiles.)
ENCAP_SER_NO = 2
encap_dir = $(topdir)/encap-$(ENCAP_SER_NO)
# The software will be deposited in directories ../encap-$(ENCAP_SER_NO)/*-*/.

include Makefile.functions

# Use these targets to manage the symoblic links:
linkup-all: all
unlinkup-all:
linkup-apps: $(patsubst %,linkup-%,$(APPS))
unlinkup-apps: $(patsubst %,unlinkup-%,$(APPS))

# for now we use ocaml3 instead of ocaml (version 4), which is too new for coq 8.3
OCAMLSWITCH = ocaml3

# in the following list, prerequisites appear to the left
PACKAGES = with \
	   $(OCAMLSWITCH) \
	   hevea \
	   intltool gtksourceview2 lablgtk lablgtkold coq84hoq hott \
	   ProofGeneral \
	   camlp5 coq83patched \
	   coqtrunk \
	   alex agda
$(foreach i, $(PACKAGES), $(eval include $i/Makefile.include))
# note: /home/special/ is a directory at IAS that contains user directories:
../README.user: README.user.prototype; sed -e 's@--THISDIRECTORY--@$(topdir)@g' -e 's@/home/special/@~@g' <$< >$@.tmp && rm -f $@ && mv $@.tmp $@
unlinkup-all: remove-dangling-links
remove-dangling-links: $(call files_dir,epkg)/.made-build
	set -x ; $(epkg) -c -X src -X encap $(patsubst ../%,-X %,$(wildcard ../encap-*)) || true
clean: clean-README.user
clean-README.user:; rm -f ../README.user
