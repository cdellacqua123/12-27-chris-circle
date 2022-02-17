Array.prototype.mergeSort = function (callback) {
    if (this.length < 2) return this;
    let midIdx = this.length / 2;

    // leftCall = this.slice(0, midIdx).mergeSort(callback);
    let leftArray = this.slice(0, midIdx);
    let rightArray = this.slice(midIdx);
    let leftCall = leftArray.mergeSort(callback);
    let rightCall = rightArray.mergeSort(callback);
    
    return merge(leftCall, rightCall, callback)
};


function merge(left, right, callback) {
    let merged = []
    while ((left.length !== 0) && (right.length !== 0)) {
        if (callback(left[0], right[0]) === -1) {
            merged.push(left.shift())
        } else {
            merged.push(right.shift())
        }
    }
    return merged.concat(left, right)
};

function revCb (x, y) {
    if (x === y) {
        return 0;
    } else if (x < y) {
        return 1;
    } else {
        return -1;
    }
}

function normCb(x, y) {
    if (x === y) {
        return 0;
    } else if (x > y) {
        return 1;
    } else {
        return -1;
    }
}

console.log([5, 4, 7, 9, 3, 6, 0].mergeSort(revCb)) //[ 9, 7, 6, 5, 4, 3, 0 ]
console.log([5, 4, 7, 9, 3, 6, 0].mergeSort(normCb)) // [ 0, 3, 4, 5, 6, 7, 9 ]

// console.log(['a', 'b', 'c'].concat(['a'], ['d', 'e', 'f'])) ==> ["a", "b", "c", "a", "d", "e", "f"]