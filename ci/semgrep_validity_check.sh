#!/bin/bash

set -e

semgrep --config="combined.yml" --validate || exit 1

exit 0
