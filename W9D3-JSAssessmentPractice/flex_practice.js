// Write a function, `exponent(b, n)`, that calculates b^n recursively. 
// Your solution should accept negative values for n. Do NOT use ** or Math.pow
function exponent(b, n) {
    if (n === 0) return 1
    if (n === 1) return b
    if (n > 0) {
        return b * exponent(b, n - 1)
    } else {
        return 1 / b * exponent(b, n + 1)
    }
}
// Write a function, `factors(num)`, that returns an array containing the factors
// of a number in ascending order.
function factors(num) {
    let arr = []
    for (let i = 1; i <= num; i++) {
        if (num % i === 0) arr.push(i);
    }
    return arr
}
// Write a `String.prototype.symmetricSubstrings` method that returns an array
// of substrings which are palindromes in alphabetical order. Only include 
// substrings of length > 1.
// e.g. "cool".symmetricSubstrings() => ["oo"]
String.prototype.symmetricSubstrings = function () {
    let palindromes = []
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length; j++) {
            let sub = this.slice(i, j + 1)
            if (sub === sub.split('').reverse().join('')) {
                palindromes.push(sub)
            }
        }
    }
    return palindromes.sort()
}
// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. Do NOT use the built-in
// `Array.prototype.forEach`.
Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i])
    }
    // let i = 0
    // while (i < this.length) {
    //     callback(this[i])
    //     i++
    // }
}
// Write an `Array.prototype.mySome(callback)` method which takes a callback 
// and returns true if the callback returns true for ANY element in the array. 
// Otherwise, return false. 
// Use the `Array.prototype.myEach` method you defined above. Do NOT call the
// built-in `Array.prototype.some` or `Array.prototype.forEach` methods.
Array.prototype.mySome = function (callback) {
    let status = false
    this.myEach(ele => {
        if (callback(ele)) status = true
    })
    return status
}
// Write an `Array.prototype.quickSort(callback)` method that quick sorts an array. 
// It should take an optional callback that compares two elements, returning -1 
// if the first element should appear before the second, 0 if they are equal, and
// 1 if the first element should appear after the second. Do NOT call the 
// built-in Array.prototype.sort method in your implementation.
//
// Here's a summary of the quick sort algorithm:
//
// Choose a pivot element, then iterate over the rest of the array, moving the 
// remaining elements on to the appropriate side of the pivot. Recursively quick 
// sort each side of the array until a base case is reached. 

// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**

// Write a `Function.prototype.myCall(context)` method, that accepts an object, 
// and any number of additional arguments. It should call the function with the
// passed-in object as `this`, also passing the remaining arguments. Do NOT use
// the built-in `Function.prototype.call` or `Function.prototype.apply` methods 
// in your implementation.

// Write a `Function.prototype.myCurry(numArgs)` method that collects arguments 
// until the number of arguments collected is equal to the original `numArgs` 
// value and then invokes the curried function.

Function.prototype.myCurry = function (numArgs) {
    const args = []
    const that = this
    return function _myCurry(arg) {
        args.push(arg)
        if (args.length === numArgs) {
            return that(...args)
        } else {
            return _myCurry
        }
    }
}