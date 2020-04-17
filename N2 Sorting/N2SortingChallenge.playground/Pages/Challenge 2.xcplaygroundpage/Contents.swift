// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 2: Find a duplicate
//: Given a collection of Equatable elements, return the first element
//: that is a duplicate in the collection.
//Attempt 1 - O(n^2) - WRONG
//extension Collection where Element: Equatable {
//
//    public var firstDuplicate: Element? {
//        guard count >= 2 else {
//            return nil
//        }
//
//        for current in indices {
//            var second = index(after: current)
//
//            while second < endIndex {
//                if self[current] == self[second] {
//                    return self[current]
//                }
//                second = index(after: second)
//            }
//        }
//
//        return nil
//    }
//
//}

// Attempt 2 - O(n) - No sort
extension Collection where Element: Hashable {

    public var firstDuplicate: Element? {
        var set: Set<Element> = []
        for value in self {
            if set.contains(value) {
                return value
            }
            set.insert(value)
        }
        return nil
    }

}

let array = [2, 4, 5, 5, 2]
print("Array: \(array)")
print("First duplicate: \(array.firstDuplicate!)")

//: [Next Challenge](@next)
