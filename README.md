# apex-sh-alpine
A Docker container to run [up](https://up.docs.apex.sh) from Apex.

## Quickstart
This container needs a few things to operate:
 1. your app (with `up.json`) mounted as a volume on `/work`
 1. your AWS access key as an env var
 1. your AWS secret key as an env var

Run the following command in your directory with your app and replace the two environment variables with your AWS credentials.

```bash
cd /dir/with/your/app
docker run \
  --rm \
  -v $(pwd):/work \
  -e AWS_ACCESS_KEY_ID=<your key here> \
  -e AWS_SECRET_ACCESS_KEY=<your secret here> \
  tomsaleeba/apex-up-alpine:0.1
```

## TODO
 1. read AWS creds profile name from volume
 1. add git and ssh support for cloning repos
