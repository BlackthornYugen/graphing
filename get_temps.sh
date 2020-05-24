#!/usr/bin/env #!/usr/bin/env bash
set +x
scp -P 3514 admin@home.steelcomputers.com:a .
#jq --arg filter a0a --slurp --raw --from-file ~/jq/format_moz_1.jq < a

for id in `jq --slurp --from-file get_temp_ids.jq --raw-output a`; do
  echo
  jq --arg filter $id --slurp --raw-output --from-file \
    ~/jq/format_moz_1.jq < a
done
