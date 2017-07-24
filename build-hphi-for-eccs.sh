#!/bin/sh
set -x

# ソースコードとパッチのダウンロード
wget https://github.com/QLMS/HPhi/releases/download/v2.0.0/HPhi-2.0.0.tar.gz
wget https://gist.github.com/wistaria/3d316f0d90a4949fe71dcb843769175f/raw/HPhi-2.0.0.patch

# コードの展開とパッチの適用
tar zxf HPhi-2.0.0.tar.gz
cd HPhi-2.0.0
patch -p1 < ../HPhi-2.0.0.patch

# cmake & build & install
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/HPhi -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_Fortran_COMPILER=gfortran-7 ..
make
make install

cd ..
mkdir -p $HOME/HPhi/share/hphi
cp -rp samples $HOME/HPhi/share/hphi
