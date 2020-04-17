// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "bubble sort") {
    var array = [9, 4, 10, 3]
    print("Unsorted: \(array)")
    bubbleSort(&array)
    print("Sorted: \(array)")
}

example(of: "selection sort") {
    var array = [9, 4, 10, 3]
    print("Unsorted: \(array)")
    selectionSort(&array)
    print("Sorted: \(array)")
}

example(of: "insertion sort") {
    var array = [9, 4, 10, 3]
    print("Unsorted: \(array)")
    insertionSort(&array)
    print("Sorted: \(array)")
}
