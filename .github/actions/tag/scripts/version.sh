#!/usr/bin/env bash

set -o errexit
set -o pipefail

ASMTTPD_VERSION=$(grep -Po '^ARG asmttpd_version=\K.*' Dockerfile)
FILE_VERSION=$(cat .version)

VERSION="$FILE_VERSION+$ASMTTPD_VERSION"

echo "I: VERSION=$VERSION"

if [[ -n $CI ]]; then
    echo "$VERSION" >> "$GITHUB_OUTPUT"
fi
