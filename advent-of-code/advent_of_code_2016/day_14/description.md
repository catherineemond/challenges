goal:
- generate 64 new keys

concepts:
- salt (the input)
- MD5 hash
- increasing integer index, starting at 0
- should return a string of lowercase hexadecimal digits

Not all the hashes are keys, a hash is a key if:
- it contains 3 of the same char in a row -> `777` (only the first triplet is important)
- one of the next 1000 hashes in the stream contains the same char 5 times in a row -> `77777`

Example:

- salt is 'abc'
- the first index that produces a triple is 18
  - we pass 'abc18' to the MD5 hash and get '...cc38887a5...'
- we then have to check the next 1000 hashes (index 19 to 1018)
  - none of them contains '88888', so our first hash is not a key
- the next index that produces a triple is 39
  - its hash contains 'eee'
- we then check the next 1000 hashes
  - the one at index 816 contains 'eeeee'
- index 39 is a key!
- and so forth until we have the index of the 64th key, in this example 22728
