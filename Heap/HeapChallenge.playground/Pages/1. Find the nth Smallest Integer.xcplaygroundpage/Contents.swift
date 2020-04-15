// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Heap Data Structure Challenges
 ## 1. Find the nth Smallest Integer
 Write a function to find the `nth` smallest integer in an unsorted array. For example:
 ```
 let integers = [3, 10, 18, 5, 21, 100]
 n = 3
 ```
 If  `n = 3`, the result should be `10`.
 */
// O(n log n): building the heap - O(n), every element removal - O(log n)
func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
    var heap = Heap(sort: <, elements: elements)

    var i = 0

    while !heap.isEmpty && i < n-1 {
        heap.remove()
        i += 1
    }

    return heap.peek()
}

let elements = [3, 10, 18, 5, 21, 100]
print("Elements: \(elements)")
print("3rd smallest element is \(getNthSmallestElement(n: 3, elements: elements))")

/*:
 [Next Challenge](@next)
 */
