#!/bin/bash
#19-06-2019

if [ "$1" == "-h" ]; then
  echo "<Pathway to index files> <Name of the fasta file used in index> <Name of the bed file>"
  exit 0
fi

docker pull quay.io/biocontainers/bedtools:2.23.0--hdbcaa40_3

docker run --rm --user $(id -u):$(id -g) -v $1:/data/ quay.io/biocontainers/bedtools:2.23.0--hdbcaa40_3 bedtools getfasta \
-fi /data/$2 \
-bed /data/$3 \
-fo /data/$3.fa

