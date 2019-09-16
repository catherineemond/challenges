# Two Steps Forward

## Concepts

- starting position S: top-left
- secure vault V: bottom-right
- 4x4 grid of small rooms
  - `#` is a wall
  - `-` or `|` is a door
- passcode (puzzle input)

## Goal

- Find the shortest path to the vault
- return the actual path, not just the length

## Rules

- the doors in the current room are either closed or open based on:
  - the hexadecimal MD5 hash of the passcode
  - followed by a sequence of uppercase letters representing the path taken so far
    - U(p)
    - D(own)
    - L(eft)
    - R(ight)
  - only the first four chars of the hash are used, they represent the doors:
    - 1 -> up
    - 2 -> down
    - 3 -> left
    - 4 -> right
  - b, c, d, e, f -> the door is open
  - any number or a -> the door is closed

## Notes

- How do I model this?
  - I need to take into account the grid, because some rooms will have walls
    - 4x4 grid
  - I need to keep track of the path taken
  - I need to find the *shortest path* -> need to refresh on proper algorithm
