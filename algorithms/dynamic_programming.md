# Definitions:

- *optimal substructure*: the solution to a problem can be obtained by the combination of optimal solutions to its sub-problems
- *overlapping sub-problems* (e.g. fibonacci): we solve the same sub-problems over and over
- *top-down approach*:
    - if the solution can be formulated recursively using the solution to the sub-problems
    - AND if the sub-problems are overlapping
    - => we can use memoization to store the solutions to the sub-problems
    - when we attempt to solve a sub-problem, we first check to see if it has already been solved
- *bottom-up approach*:
    - try solving the sub-problems first
    - use their solutions to arrive at the solution of bigger problems
    - usually done in tabular form

**Tabulation** uses a bottom up approach.
**Memoization** uses a top down approach.

> Dynamic Programming is mainly an optimization over plain recursion. [...] The idea is simply to store the results of subproblems, so that we do not have to recompute them when needed later.

Geeks for Geeks (https://www.geeksforgeeks.org/dynamic-programming/)

> [Dynamic Programing] refers to simplifying a complicated problem by breaking it down into simpler sub-problems in a recursive manner.

Wikipedia (https://en.wikipedia.org/wiki/Dynamic_programming)

# Practical problem solving:

If the problem can be solved with Dynamic Programming , we have to go through these 3 steps:

- define the sub-problems
- find the overlapping sub-problems
- solve the base cases

# Examples:

- Dijkstra's algorithm for the shortest path problem
- Fibonacci sequence
- Tower of Hanoi
- Egg dropping puzzle
- Knapsack problem
- Coin change
- longest common substring
