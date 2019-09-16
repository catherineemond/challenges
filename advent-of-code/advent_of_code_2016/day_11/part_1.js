/*
how do we represent the state?
  - a building object with floors
  - elevator
  - I need methods to determine if:
    - the move failed, i.e. a chip got burned
    - in progress
    - success, i.e. everything is on the fourth floor
*/
let building = {
  floors: [
    ['HM', 'LM'], // first floor
    ['HG'], // second floor
    ['LG'], // third floor
    [] // fourth floor
  ],
  elevator: 1, // where the elevator is at
}
