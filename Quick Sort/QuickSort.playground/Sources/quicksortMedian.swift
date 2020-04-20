import Foundation

public func quicksortMedian<T: Comparable>(_ a: inout [T],
                                           low: Int,
                                           high: Int) {
    if low < high {
        let pivotIndex = medianOfThree(&a, low: low, high: high)
        a.swapAt(pivotIndex, high)
        print("After finding median pivot: \(a)")
        let pivot = partitionLomuto(&a, low: low, high: high)
        print(a)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}

public func medianOfThree<T: Comparable>(_ a: inout [T],
                                         low: Int,
                                         high: Int) -> Int {
    let center = (low + high) / 2

    if a[low] > a[center] {
        a.swapAt(low, center)
    }

    if a[low] > a[high] {
        a.swapAt(low, high)
    }

    if a[center] > a[high] {
        a.swapAt(center, high)
    }

    return center
}
