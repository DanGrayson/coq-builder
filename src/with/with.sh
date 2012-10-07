#! /bin/sh

TOP=@TOPDIR@

if [ $# = 0 ]
then exec 1>&2
     cmd=with
     echo "usage:"
     echo "   $cmd + command               (run command in the environment provided by $TOP)"
     echo "   . $cmd +                     (modify the environment of the current bash shell)"
     echo "   $cmd package command         (run command in the environment provided by package)"
     echo "   $cmd \"package ...\" command   (run command in the environment provided by packages)"
     echo " packages available:"
     for i in $TOP/encap/*-*
     do if [ -d "$i" ]
	then echo "    $(basename $i)"
	fi
     done
     return
     exit
fi

for j in $1
do if [ "$j" = + ]
   then i=$TOP
   else i="$TOP/encap/$j"
   fi
   if ! [ -d "$i" ]
   then echo "expected a directory: $i" >&2
        return 1
        exit 1
   fi
   [ -d "$i"/bin ] && PATH="$i"/bin:$PATH
   [ -d "$i"/man ] && MANPATH="$i"/man:$MANPATH
   [ -d "$i"/share/man ] && MANPATH="$i"/share/man:$MANPATH
   [ -d "$i"/info -a ! -h "$i"/info ] && INFOPATH="$i"/info:$INFOPATH
   [ -d "$i"/share/info -a ! -h "$i"/share/info ] && INFOPATH="$i"/share/info:$INFOPATH
   [ -d "$i"/lib ] && LD_LIBRARY_PATH="$i"/lib:$LD_LIBRARY_PATH
   [ -d "$i"/lib/pkgconfig ] && PKG_CONFIG_PATH="$i"/lib/pkgconfig:$PKG_CONFIG_PATH
done

PATH="$PATH"
export PATH MANPATH LD_LIBRARY_PATH INFOPATH PKG_CONFIG_PATH

shift
eval "$@"
# Local Variables:
# compile-command: "make -C .. linkup-with"
# End:
