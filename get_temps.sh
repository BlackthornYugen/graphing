#!/usr/bin/env bash
#set -x

JQ_INPUT=a.json
FILTER_IDS=`jq --slurp --from-file get_temp_ids.jq --raw-output $JQ_INPUT`
scp servername_goes_here:a $JQ_INPUT

time jq --arg timeformat \%s --slurp --raw-output --from-file \
  ~/jq/format_moz_1.jq < $JQ_INPUT | tail -n3

for id in $FILTER_IDS; do
  echo -e \\n$id:
  jq --arg filter $id --slurp --raw-output --from-file \
    ~/jq/format_moz_1.jq < $JQ_INPUT
done
