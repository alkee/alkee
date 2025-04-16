#!/bin/bash
set -e # exit on error
script_dir_name=$(basename "$(dirname "$(realpath "$0")")")

echo "retieving version with git tag.."
git_describe=`git describe --tags --long`
# Strip prefix 'v' from the tag 
stripped=$(echo "$git_describe" | sed 's/^v//')
tag_version=$(echo $stripped | cut -d '-' -f 1)
patch=$(echo $stripped | cut -d '-' -f 2)
commit_hash=$(echo $stripped | cut -d '-' -f 3 | sed 's/^g//')

version="${tag_version}.${patch}"
echo "detected version = ${version}. commit hash=${commit_hash}"

