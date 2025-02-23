#!/usr/bin/env bash

set -o errexit
set -o pipefail

ASMTTPD_VERSION=$(grep -Po '^ARG asmttpd_version=\K.*' Dockerfile)
FILE_VERSION=$(cat .version)

DOCKER_TAG="$FILE_VERSION-$ASMTTPD_VERSION"
GIT_TAG="$FILE_VERSION+$ASMTTPD_VERSION"

echo "I: ASMTTPD_VERSION=$ASMTTPD_VERSION"
echo "I: FILE_VERSION=$FILE_VERSION"
echo "I: DOCKER_TAG=$DOCKER_TAG"
echo "I: GIT_TAG=$GIT_TAG"

if [[ -n $CI ]]; then
    {
        echo "asmttpd_version=$ASMTTPD_VERSION"
        echo "file_version=$FILE_VERSION"
        echo "docker_tag=$DOCKER_TAG"
        echo "git_tag=$GIT_TAG"
    } >> "$GITHUB_OUTPUT"
fi

git tag "$GIT_TAG"
git push --tags
