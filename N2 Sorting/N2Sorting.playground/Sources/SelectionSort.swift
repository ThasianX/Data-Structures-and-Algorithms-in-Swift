import Foundation

// O(n^2)
public func selectionSort<T: MutableCollection>(_ collection: inout T) where T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }

    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)

        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }

        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
}
