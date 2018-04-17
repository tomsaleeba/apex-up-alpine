#!/usr/bin/sh
[ -n "$IS_PROD" ] || IS_PROD=0
[ -n "$IS_DELETE" ] || IS_DELETE=0
the_dir=~/.aws
mkdir -p $the_dir
printf "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
" > $the_dir/credentials
if [ $IS_PROD -gt 0 ]; then
  echo "Production mode is ON"
  action="deploy"
  env_fragment="production"
fi
if [ $IS_DELETE -gt 0 ]; then
  echo "Delete mode is ON"
  if [ $IS_PROD -gt 0 ]; then
    echo "Ignoring IS_PROD flag, 'stack delete' affects ALL stages"
  fi
  export CI=true # need this for the --format arg to work
  action='stack delete --force --format="plain" --verbose'
  env_fragment=""
fi
echo up version: $(up version)
up $action $env_fragment
if [ $IS_DELETE -le 0 ]; then
  echo "URL of deployment:"
  up url $env_fragment
fi
