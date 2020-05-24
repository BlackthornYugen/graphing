map(
  select(
    (.id | endswith($filter) )
  and
    (.data?.temperature?)
  )
)
        |
.[]
        |
[((.timestamp // .timespamp) | strftime("%Y-%m-%d %H:%M")), .data.temperature] 
   |
 @tsv
