#!/bin/csh

set pattern = "\/setup"`echo '$'`
setenv CODE_BASE_PATH `pwd | perl -pe "s/$pattern//"`
echo "Root of code base has been specified as:\n    $CODE_BASE_PATH"

setenv LOCAL_CSKY_PATH "$CODE_BASE_PATH/vperl"
setenv TOOLPATH_CSKY "$CODE_BASE_PATH/vperl"
setenv LIBPATH_CSKY "$CODE_BASE_PATH/vperl"
setenv PATH "$CODE_BASE_PATH/vperl:${PATH}"

#set tmp_path=($path)
#set path= ( $tmp_path )
set path =($path $TOOLPATH_CSKY $LOCAL_CSKY_PATH)

setenv LIBPATH_DEPEND  "../src_rtl/      \
                       "
setenv LIBPATH_VEXPAND "../gen_rtl/     \
                       "


