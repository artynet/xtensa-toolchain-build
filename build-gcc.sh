#! /bin/bash -ex

. `dirname "$0"`/config

export LANG=C

rm -rf $GCC-$SUFFIX
mkdir $GCC-$SUFFIX
cd $GCC-$SUFFIX
../../$GCC/configure --target=$TARGET --prefix=$PREFIX \
    --enable-__cxa_atexit --disable-shared --disable-libssp --enable-languages=c,c++ "$@"
make $PARALLEL all-gcc all-target-libgcc
make install-gcc install-target-libgcc
