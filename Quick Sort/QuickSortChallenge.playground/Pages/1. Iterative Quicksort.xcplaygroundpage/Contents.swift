// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Quicksort Challenges
 ## 1. Iterative Quicksort

 Implement Quicksort iteratively. Choose any partition strategy you learned in this chapter.
 */

// Your answer here
public func quicksortIterative<T: Comparable>(_ a: inout [T],
                                              low: Int,
                                              high: Int) {
    var stack = Stack<Int>()
    stack.push(low)
    stack.push(high)

    while !stack.isEmpty {
        let h = stack.pop()!
        let l = stack.pop()!

        let pivot = partitionLomuto(&a, low: l, high: h)

        if (pivot - 1) > l {
            stack.push(l)
            stack.push(pivot - 1)
        }

        if (pivot + 1) < h {
            stack.push(pivot + 1)
            stack.push(h)
        }
    }
}

var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print("Original: \(list)")
quicksortIterative(&list, low: 0, high: list.count - 1)
print("Sorted: \(list)")
//: [Next Challenge](@next)


