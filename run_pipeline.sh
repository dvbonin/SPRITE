#!/bin/bash

mkdir -p workup
mkdir -p workup/logs
mkdir -p workup/logs/cluster

snakemake \
--snakefile Snakefile \
--use-conda \
-j 32 \
--cluster-config cluster.yaml \
--cluster "sbatch -c {cluster.cpus} \
-t {cluster.time} -N {cluster.nodes} \
--mem {cluster.mem} \
--output {cluster.output} \
--error {cluster.error}"

