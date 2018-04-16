#!/usr/bin/sh
the_dir=~/.aws
mkdir -p $the_dir
printf "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
" > $the_dir/credentials
if [ $IS_PROD ]; then
  extra_deploy_cmd="deploy production"
  extra_url_cmd="production"
fi
echo "up version:"
up version
up $extra_deploy_cmd
echo "URL of deployment:"
up url $extra_url_cmd
