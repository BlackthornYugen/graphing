# format_moz_1.jq
#
# Format Mozilla IoT raw websocket data, filter to
# only devices with temperature data then filter.
def TZ_AMERICA_TORONTO: -(60 * 60 * 4); # (GMT-4)

map(
  select(
    ( .id | endswith($ARGS.named.filter // "") )  # Filter ids ending with
  and                                       # argument "filter" if defined
    (.data?.temperature?)                   # then filter so that we only get
  )                                         # objects with temperature data
)
  |
#  \ Iterate
#   \ through
#    \ filtered
#     \ array
#      \ objects
#       |
     . [ ]
        |
#       |
#       | Get timestamp (or timespamp)
#       | and adjust to America/Toronto
#      /
#     |
[((.timestamp // .timespamp) + TZ_AMERICA_TORONTO
   |
#  |
#  \
#   |   # Format time
  strftime( ($ARGS.named.timeformat // "%Y-%m-%d %H:%M"))), .data.temperature]
   |
#  | Output will be tab delimited
#  | <date> <TAB> <temperature>
  @tsv
