#!/bin/bash
# gcloud builds submit --config CONFIG_FILE_PATH SOURCE_DIRECTORY
gcloud builds submit

## Use Dockerfile build
# gcloud builds submit --tag gcr.io/sdns-prd-273508/cloudruntest

## Use Cloud Native Buildpack
## gcloud builds submit --pack builder=BUILDPACK_BUILDER, env=ENVIRONMENT_VARIABLE, image=IMAGE
# gcloud builds submit --pack image=gcr.io/cloudruntest
