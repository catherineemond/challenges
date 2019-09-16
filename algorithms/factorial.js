// Fibonacci and factorials are good simple examples for recursion
// (if teaching make sure to give a loop solution for comparison)
// How does Big O works with recursion?

// Make a function that computes a factorial recursively
// A factorial is when you take a number n and multiply by each preceding integer until one
// Example:
// factorial(5) -> 5 * 4 * 3 * 2 * 1
// conceptually -> n * (n - 1) * (n - 2) * (n - 3) ...

function factorial(n) {
  if (n < 2) return 1;
  return n * factorial(n - 1);
}

console.log(factorial(1) == 1); // 1
console.log(factorial(2) == 2); // 2 * 1
console.log(factorial(3) == 6); // 3 * 2 * 1
console.log(factorial(4) == 24); // 4 * 3 * 2 * 1
console.log(factorial(5) == 120);
