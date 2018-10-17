#!/usr/bin/env bash

PATH="$USR_GCLOUD_BIN_PATH:$PATH"
datalab --project $PROJECT create --zone $ZONE bsc-caserta-datatest