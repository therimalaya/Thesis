#! /bin/bash

out_ext=$1
type=$2
for f in chapters/*.md;
do
    old_fname=${f#chapters/}
    old_fname=${old_fname%.md}
    new_fname=chapters/tex/$old_fname.$out_ext
    old_fname=chapters/$old_fname.md
    pandoc $old_fname -f markdown -t $type -o $new_fname; 
done