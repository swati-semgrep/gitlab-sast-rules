#!/bin/bash

set -e

find . -name 'rule-*.yml' | while read -r line; do 
    semgrep --config="$line" --validate || exit 1
done

exit 0
