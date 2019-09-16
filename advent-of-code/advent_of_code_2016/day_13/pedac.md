maze set-up:
- every location is addressed by pair of positive int (x, y)
- each coordinate is either wall or open space
- no diagonal movement
- the maze start at (0,0) (is there a reason to take this into account? -- yes)
- we are in the entrance at (1,1)
- it seems to extend infinitely toward positive x and y
- negative values are invalid

some rules:
- to determine if a (x, y) coordinate is wall or open
  - find x*x + 3*x + 2*x*y + y + y*y
  - add to this the input number
  - convert to binary
  - count the number of bits that are 1
  - if that number is even -> open space
  - if that number is odd -> wall
- how to find all neighbors for a given position
  - at max there will be 4 neighbors
  - screen out the invalid ones (edges, negative values)

goals:
- first part:
  - find the shortest path to coordinate (31, 39), starting from position (1, 1)
  - return the number of steps required
- second part:
  - find the number of different locations visited in 50 steps or less

notes and ideas:
- look at pathfinding
- look at graph search algorithms
  - breadth first search?
  - Dijkstra's algorithm (I don't think it's needed here)
  - A*
- how do we represent the data?
  - input: a graph, with graph nodes representing locations
  - output: the path found, made of graph nodes

breadth-first search implementation (from: https://www.redblobgames.com/pathfinding/a-star/introduction.html)
- repeat these steps until the frontier is empty:
  - pick and remove a location from the frontier
  - expand it by looking at its neighbors
    - any neighbors not yet visited:
      - add to the frontier
      - add to the visited set
- implement early exit
