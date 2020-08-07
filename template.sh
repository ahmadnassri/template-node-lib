
#!/usr/bin/env bash

[ ! -z "$1" ] && [ ! -z "$2" ] && [ $1 = '--target' ] && export PREFIX=$2

# this directory
export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# gather input
read -p 'Project Title: ' PROJECT_TITLE
read -p 'Project Description: ' PROJECT_DESCRIPTION
read -p 'repository name: ' REPO_NAME
read -p 'package name: ' PACKAGE_NAME

export for envsubst
export PROJECT_TITLE=$PROJECT_TITLE
export PROJECT_DESCRIPTION=$PROJECT_DESCRIPTION
export REPO_NAME=$REPO_NAME
export PACKAGE_NAME=$PACKAGE_NAME
export DOLLAR='$' # used in README.template

# replace template content
find $DIR ! -path "$DIR/.git/*" ! -path "$DIR/template.sh" ! -path "$DIR/README.md" -type f -exec bash -c '
  SOURCE=${1}
  TARGET=${PREFIX:-$PWD}/${SOURCE#$DIR/}
  mkdir -p ${TARGET%/*}
  envsubst < $SOURCE > $TARGET.temp
  mv $TARGET.temp $TARGET
' -- {} \;

# (re)generate README
(cd ${PREFIX:-.} && docker-compose run readme)

# remove self if this is in-place
[ -z "$1" ] && rm -rf template.sh
