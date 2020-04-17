// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 3: Reverse a collection
//: Reverse a collection of elements by hand. Do not rely on the
//: reverse or reversed methods.
// O(n)
extension Collection where Self:MutableCollection & BidirectionalCollection {

    public mutating func reverse() {
        var start = startIndex
        var end = index(before: endIndex)

        while start < end {
            swapAt(start, end)
            formIndex(after: &start)
            formIndex(before: &end)
        }
    }

}

var array = [3, 4, 134, 3, 5, 6, 3, 5, 3, 1, 0]
print("Unreversed: \(array)")
array.reverse()
print("Reveresed: \(array)")
