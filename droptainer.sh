#!/bin/bash
set -e

echo "Extracting Go..."
tar xzf go1.19.3.linux-amd64.tar.gz
echo "Extracting apptainer..."
tar xzf apptainer-1.1.3.tar.gz
DROPTAINER_ROOT=$PWD
PATH="$DROPTAINER_ROOT/go/bin/:$PATH"
# Set TMPDIR so go generate doesn't complain about permissions.
TMPDIR="$DROPTAINER_ROOT/tmp"
echo "Building apptainer..."
cd ./apptainer-1.1.3/
./mconfig --without-suid -p $1
cd ./builddir
make
make install
cd $DROPTAINER_ROOT
cp squashfuse_ll $1/bin
echo "[_] Cleaning up..."
cd
rm -rf $DROPTAINER_ROOT
echo "[+] Done!"
echo "Now, run 'export PATH=\"$1/bin:\$PATH\"' or add it into your .bashrc."