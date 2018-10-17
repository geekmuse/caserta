#!/usr/bin/env bash

PATH="$USR_GCLOUD_BIN_PATH:$PATH"
datalab --project $PROJECT create --no-connect --zone $ZONE $RESOURCE

echo "To use datalab, run: datalab connect --project $PROJECT --zone $ZONE --port 8081 $RESOURCE"