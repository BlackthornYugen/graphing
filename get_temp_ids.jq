# get_temp_ids.jq
#
# Get all unique device ids that have temperature data

map(select((.data?.temperature?)))
               |
            map(.id)
               |
             unique
               |
             @tsv
