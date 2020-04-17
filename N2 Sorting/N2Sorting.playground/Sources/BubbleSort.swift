import Foundation

// O(n^2) - average and worst. O(n) - best.
public func bubbleSort<T: MutableCollection>(_ collection: inout T) where T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }

    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex

        while current < end {
            let next = collection.index(after: current)
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }

        if !swapped {
            return
        }
    }
}
