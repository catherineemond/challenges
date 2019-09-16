# Timing is Everything

## Concepts:

- you press a *button*
- a *capsule* is dropped
- it tries to fall through *slots* in a set of rotating *discs*

## Rules:

- the disc have different sizes
- they pause their motion each second
- they seem to each have a fixed number of positions at which they stop
- the position with the slot will be 0
- the discs are spaced out so that:
  - after you push the button, one second elapses before the first disc is reached
  - and one second elapses until it reaches the one below

## Goal:

- find the first time (integer number) you have to push the button for all the discs to be at position 0 and the capsule to fall through

## High-level approach:

- disc objects
  - I can ask them at which position they are at a given time
  - take into account the delay for the capsule to reach it
    - disc 1 => start time + 1
    - disc 2 => start time + 2
    - ...
  - for each disk I am given:
    - its total number of positions
    - its initial position

## Ideas

- a brute force approach would be to simply check for each starting time if all disks are at position 0
- use the modulo operator to wrap around and find the right position.
