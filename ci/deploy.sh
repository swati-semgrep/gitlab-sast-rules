#!/usr/bin/env bash

# consolidate rule files and remap rules
ci/deploy.rb

# enable globbing
shopt -s globstar

function handle_rule_file() {
    local filename="$1"

    filebase="$(basename $filename)"
    archive="${filebase%.yml}.tar.gz"

    tar -czvf "$archive" "$filename"
    
    SEMVER_PAT="[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"
    VERSION=$(echo "$CI_COMMIT_TAG" | grep -o -e "$SEMVER_PAT")
    URL="https://gitlab.com/api/v4/projects/$CI_PROJECT_ID/packages/generic/rulesets/$VERSION/$archive"
    
    echo "$VERSION" | grep -e "$SEMVER_PAT" > /dev/null 2>&1 || {
        VERSION="0.0.0"
    }
    
    echo "deploying $FILENAME to $URL; image tag is: \"$VERSION\""
    
    curl --fail --header "PRIVATE-TOKEN: $DEPLOY_RELEASE_TOKEN" \
        --upload-file "$archive" \
        "$URL" || return 1
    
    return 0
}

for filename in rule-sets/*.yml; do 
    handle_rule_file "$filename" || exit 1
done

exit 0
