#! /bin/sh

TOP=@TOPDIR@

if [ $# = 0 ]
then exec 1>&2
     cmd=with
     echo "usage:"
     echo "   $cmd + command               run command in the environment provided by $TOP"
     echo "   . $cmd +                     modify the environment of the current bash shell"
     echo "   $cmd PACKAGE command         run command in the environment provided by PACKAGE"
     echo "   $cmd \"PACKAGE ...\" command   run command in the environment provided by PACKAGE ..."
     echo "   $cmd \"+ PACKAGE ...\" command run command in the environment provided by $TOP and PACKAGE ..."
     echo " PACKAGE may be specified with or with the version"
     echo "         e.g.: coq83patched or coq83patched-latest"
     echo " packages provided:"
     echo "  $WITH"
     echo " packages available, with version:"
     for i in $TOP/encap-@ENCAP_SER_NO@/*-*
     do if [ -d "$i" ]
	then echo "   $(basename $i)"
	fi
     done
     return 0 2>/dev/null; exit 0
fi

for j in $1
do if [ "$j" = + ]
   then i=$TOP
   else i="$TOP/encap-@ENCAP_SER_NO@/$j"
	if [ -d "$i" ]
	then :
	else found=false
	     for k in "$i"-* 
	     do if [ -d "$k" ]
		then if $found ; then echo "package $k has multiple versions, please specify one" >&2 ; return 1 2>/dev/null ; exit 1 ; fi
		     found=true
		     i=$k
		fi
	     done
	     if ! $found
	     then echo "package $j not found in directory $i" >&2
		  return 1 2>/dev/null; exit 1
	     fi
	fi
   fi
   export WITH="$WITH $j"
   [ -d "$i"/bin ] && PATH="$i"/bin:$PATH
   [ -d "$i"/man ] && MANPATH="$i"/man:$MANPATH
   [ -d "$i"/share/man ] && MANPATH="$i"/share/man:$MANPATH
   [ -d "$i"/info -a ! -h "$i"/info ] && INFOPATH="$i"/info:$INFOPATH
   [ -d "$i"/share/info -a ! -h "$i"/share/info ] && INFOPATH="$i"/share/info:$INFOPATH
   [ -d "$i"/lib ] && LD_LIBRARY_PATH="$i"/lib:$LD_LIBRARY_PATH
   [ -d "$i"/lib/pkgconfig ] && PKG_CONFIG_PATH="$i"/lib/pkgconfig:$PKG_CONFIG_PATH
   [ -f "$i"/packages/coq/kernel/names.ml ] && COQHOME=$i/packages/coq
   [ -f "$i"/packages/ocaml/stdlib/stream.ml ] && OCAMLHOME=$i/packages/ocaml
   [ -f "$i"/packages/camlp5/lib/extfold.ml ] && CAMLP5HOME=$i/packages/camlp5
done

export PATH MANPATH LD_LIBRARY_PATH INFOPATH PKG_CONFIG_PATH COQHOME OCAMLHOME CAMLP5HOME

shift
"$@"
# Local Variables:
# compile-command: "make -C .. linkup-with"
# End:
