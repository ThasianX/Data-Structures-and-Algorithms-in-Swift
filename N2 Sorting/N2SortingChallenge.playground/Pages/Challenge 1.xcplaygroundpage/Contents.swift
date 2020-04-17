// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: # n² Sorting Challenges
//: ## Challenge 1: Group elements
//: Given a collection of Equatable elements, bring all instances of a given
//: value in the array to the right side of the array.
// O(n)
extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {

    public mutating func rightAlign(value: Element) {
        var start = startIndex
        var end = index(before: endIndex)

        while start < end {
            while self[start] != value {
                formIndex(after: &start)
            }

            while self[end] == value {
                formIndex(before: &end)
            }

            guard start < end else {
                return
            }

            swapAt(start, end)
        }
    }

}

var array = [3, 4, 134, 3, 5, 6, 3, 5, 3, 1, 0]

array.rightAlign(value: 3)
print(array)

//: [Next Challenge](@next)
