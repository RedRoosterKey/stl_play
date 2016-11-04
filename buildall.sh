# /bin/bash

set -e
set -v

for dir in *
do
    if [ -d $dir ]
       then
           pushd $dir
           for file in *.scad
           do
               base=$(basename -s .scad $file)
               openscad -o $base.stl $file
           done
           popd
    fi
done
