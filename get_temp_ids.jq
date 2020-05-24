map(select((.data?.temperature?)))
  |
map( .id )
  |
unique
  |
@tsv
