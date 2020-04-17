import Foundation

// O(n^2)
public func insertionSort<T: BidirectionalCollection & MutableCollection>(_ collection: inout T) where T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }

    for current in collection.indices {
        var shifting = current
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            shifting = previous
        }
    }
}
