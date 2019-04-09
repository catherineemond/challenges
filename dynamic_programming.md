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


# Examples:

- Dijkstra's algorithm for the shortest path problem
- Fibonacci sequence
- Tower of Hanoi
- Egg dropping puzzle
- Knapsack problem
- Coin change
- longest common substring
