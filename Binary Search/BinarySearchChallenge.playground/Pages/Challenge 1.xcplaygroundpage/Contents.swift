// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 # Binary Search Challenge

 ### Challenge 1: Binary search as a free function

 Implement binary search as a free function. You should be able to run:

 ```swift
 let array = [1, 2, 10, 43, 55, 60, 150, 1420]
 binarySearch(for: 10, in: array) == 2
 ```
 
 */
// Attempt 1 - O(log n)
//public func binarySearch<T: Comparable>(for value: T, in array: Array<T>) -> Int? {
//    array.binarySearch(for: value)
//}

// Attempt 2 - O(log n) - more generic code
public func binarySearch<Elements: RandomAccessCollection>(for value: Elements.Element,
                                                           in elements: Elements,
                                                           in range: Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element: Comparable {
    let range = range ?? elements.startIndex..<elements.endIndex

    guard range.lowerBound < range.upperBound else {
        return nil
    }

    let size = elements.distance(from: range.lowerBound, to: range.upperBound)
    let middle = elements.index(range.lowerBound, offsetBy: size / 2)

    if elements[middle] == value {
        return middle
    } else if elements[middle] > value {
        return binarySearch(for: value, in: elements, in: range.lowerBound..<middle)
    } else {
        return binarySearch(for: value, in: elements, in: elements.index(after: middle)..<range.upperBound)
    }
}

let array = [1, 2, 10, 43, 55, 60, 150, 1420]
print("Array: \(array)")
print("Index of value 10 is 2: \(binarySearch(for: 10, in: array) == 2)")
/*:
 [Next Challenge](@next)
 */
