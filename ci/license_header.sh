#!/bin/bash

# enable globbing
shopt -s globstar

function check_header() {
    local filename="$1"
    grep -qE "[<!--|#|//] License:" "$filename"  || {
        echo "no license header in $filename"
        return 1
    }
    return 0
}

for filename in **/rule-*.yml; do 
    check_header "$filename"
done

for filename in **/test-*; do 
    check_header "$filename"
done

exit 0
