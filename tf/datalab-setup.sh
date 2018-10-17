#!/usr/bin/env bash

PATH="$USR_GCLOUD_BIN_PATH:$PATH"
echo "Check out this page first: https://cloud.google.com/datalab/docs/quickstart"
gcloud components update
gcloud components install datalab
