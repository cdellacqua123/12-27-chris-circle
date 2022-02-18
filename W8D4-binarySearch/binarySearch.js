function binarySearch(array, target) {
    if (array.length === 0) return -1

    let midIdx = Math.floor(array.length / 2)
    if (array[midIdx] === target) return midIdx

    if (array[midIdx] > target) {
        let leftArr = array.slice(0, midIdx)
        return binarySearch(leftArr, target)
    } else {
        let rightArr = array.slice(midIdx + 1)
        let bTest = binarySearch(rightArr, target)
        if (bTest === -1) {
            return -1
        } else {
            return bTest + midIdx + 1
        }
        // return bTest === -1 ? -1 : bTest + midIdx + 1
    }
}
// console.log([0, 1, 4, 6, 8, 9, 10].indexOf(8))
// console.log([0, 1, 4, 6, 8, 9, 10].indexOf(10))
// console.log([0, 1, 4, 6, 8, 9, 10].indexOf(-20))
// console.log([0, 1, 4, 6, 8, 9, 10].indexOf(11))

console.log(binarySearch([0, 1, 4, 6, 8, 9, 10], 8)) //4
console.log(binarySearch([0, 1, 4, 6, 8, 9, 10], 10)) //6
console.log(binarySearch([0, 1, 4, 6, 8, 9, 10], -20)) //-1
console.log(binarySearch([0, 1, 4, 6, 8, 9, 10], 11)) //-1
