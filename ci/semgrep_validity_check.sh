#!/bin/bash

set -e

find dist -name "*.yml" | while read -r fil; do
    echo "checking $fil"
    semgrep --config="$fil" --validate || exit 1
done

exit 0
