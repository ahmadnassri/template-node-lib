
#!/usr/bin/env bash

[ ! -z "$1" ] && [ ! -z "$2" ] && [ $1 = '--target' ] && export PREFIX=$2

# gather input
read -p 'Project Title: ' PROJECT_TITLE
read -p 'Project Description: ' PROJECT_DESCRIPTION
read -p 'repository name: ' REPO_NAME
read -p 'package name: ' PACKAGE_NAME

# export for envsubst
export PROJECT_TITLE=$PROJECT_TITLE
export PROJECT_DESCRIPTION=$PROJECT_DESCRIPTION
export REPO_NAME=$REPO_NAME
export PACKAGE_NAME=$PACKAGE_NAME
export DOLLAR='$' # used in README.template

# replace template content
find . ! -path './.git/*' ! -name 'template.sh' -type f -exec bash -c '
  TARGET=${PREFIX:-.}/${1#./}
  mkdir -p ${TARGET%/*}
  envsubst < $1 > $TARGET.temp
  mv $TARGET.temp $TARGET
' -- {} \;

# (re)generate README
(cd ${PREFIX:-.} && docker-compose run readme)

# remove self if this is in-place
[ -z "$1" ] && rm -rf template.sh
