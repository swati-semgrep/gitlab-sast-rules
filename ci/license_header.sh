#!/bin/sh

find  . -name "rule*.yml" -o -name "test*" -print0 | xargs -0 -n1 grep -LH "[#|//] License:" || {
    echo "license header absent"
    exit 1
}

exit 0
