#!/bin/bash

read -a HASHES <<< $(git log --oneline | cut -d' ' -f1)
NHASHES=${#HASHES[@]}

for (( i=1; i<${NHASHES}; i++ )); do
	j=$((i-1))
	git diff ${HASHES[$i]} ${HASHES[$j]}
done
