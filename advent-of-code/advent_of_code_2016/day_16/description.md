# Dragon Checksum

## Concepts

- overwrite disks with random-looking data
- update the local security system with a new checksum
- generate the data using a modified 'dragon curve'

## Rules

### Expand data

- input represents the initial state
- repeat following steps until there is enough data
  - call the data you have `a`
  - make a copy of `a` called `b`
  - reverse the order of chars in `b`
  - in `b` replace all instances of 0 with 1, and all 1 with 0
  - the resulting data is `a` + 0 + `b`

### Generate checksum

- once the data is generated you need to create a checksum
  - calculate checksum *only* for the data that fits on disk (even if you generated more)
  - consider each pair of chars (non-consecutive)
    - if they match (00 or 11) ? 1 : 0
  - the final string should be exactly half the length of the original
  - if the length is *even*, repeat the process until you end up with a odd-length checksum

## Input

length = 272
puzzle input = 11100010111110100
