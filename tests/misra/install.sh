#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
: "${CPPCHECK_DIR:=$DIR/cppcheck/}"

if [ ! -d "$CPPCHECK_DIR" ]; then
  git clone https://github.com/danmar/cppcheck.git $CPPCHECK_DIR
fi

cd $CPPCHECK_DIR
git fetch --all
git checkout f156b1ecb20af834d6d70a20b9485533e2b5bdaf
#git -c user.name=a -c user.email="a@b.c" cherry-pick 7199dde1618b5166735f07619dcdb9f4eafdb557
make clean
make MATCHCOMPILTER=yes CXXFLAGS="-O2" -j8
