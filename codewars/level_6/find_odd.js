/*
Given an array, find the int that appears an odd number of times.
There will always be only one integer that appears an odd number of times.
------------------------------------------------------------------------------
input: an array, of which only one element appears an odd number of times

output: an integer, the element that appears an odd number of times

algorithm:
  - iterate over the array and build a count object
  - retrieve the key that has an odd count (either filter or find)
*/

function findIt(array) {
  let count = {};

  array.forEach((el) => {
    count[el] ? count[el] += 1 : count[el] = 1;
  });

  // return Object.keys(count).find((el) => count[el] % 2 === 1); // this will return a string number
  return Object.keys(count).map(Number).find((el) => count[el] % 2 === 1);
}

console.log(findIt([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])) // 5
console.log(findIt([1,1,2,-2,5,2,4,4,-1,-2,5])) // -1
console.log(findIt([20,1,1,2,2,3,3,5,5,4,20,4,5])) // 5
console.log(findIt([10])) // 10
console.log(findIt([1,1,1,1,1,1,10,1,1,1,1])) // 10
