> A Docker container to run Apex [up](https://up.docs.apex.sh). I created it to run in a CircleCI workflow to perform Continuous Deployment. See https://github.com/tomsaleeba/foo-api for an example app that uses this container.

Currently running up version: 0.6.8

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
  tomsaleeba/apex-up-alpine:0.3.4
```
This will deploy to the `staging` stage of API Gateway. See below for when you want to deploy to `production`.

## Production deploys
If you want to deploy to production, you should also supply an extra envrionmental variable:
```bash
  -e IS_PROD=1 \ # 0 = staging (default), 1 = production
```

## Deleting a stack
If you want to delete the stack (API Gateway, Lambda, etc) then supply this environment variable:
```bash
  -e IS_DELETE=1 \ # 0 = deploy (default), 1 = delete
```
Note: this will delete both `production` and `staging` stages AND everything else.

## Up profile value
It doesn't (seem to) matter if you define a `profile` in your `up.json`, this will still deploy appropriately. For reference, we define the AWS credentials with only a `default` entry.
