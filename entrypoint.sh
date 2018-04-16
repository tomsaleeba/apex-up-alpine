#!/usr/bin/sh
the_dir=~/.aws
mkdir -p $the_dir
printf "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
" > $the_dir/credentials
up $@
