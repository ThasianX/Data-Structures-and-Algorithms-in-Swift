// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
import Foundation

example(of: "bubble sort") {
    let start = CFAbsoluteTimeGetCurrent()

    var array = [9, 4, 10, 3]
    print("Unsorted: \(array)")
    bubbleSort(&array)
    print("Sorted: \(array)")

    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Took \(diff) seconds")
}

example(of: "selection sort") {
    let start = CFAbsoluteTimeGetCurrent()

    var array = [9, 4, 10, 3]
    print("Unsorted: \(array)")
    selectionSort(&array)
    print("Sorted: \(array)")

    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Took \(diff) seconds")
}

example(of: "insertion sort") {
    let start = CFAbsoluteTimeGetCurrent()

    var array = [9, 4, 10, 3]
    print("Unsorted: \(array)")
    insertionSort(&array)
    print("Sorted: \(array)")
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Took \(diff) seconds")
}
