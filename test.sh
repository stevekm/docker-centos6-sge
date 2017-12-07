#!/bin/bash
set -x
echo "echo Running test from $HOSTNAME" | qsub ; qstat
