// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
import Foundation

// Quicksort - Best and average: O(n log n). Worst: O(n^2)

print("---------Quicksort Lomuto---------")
var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print("Original: \(list)")
var start = CFAbsoluteTimeGetCurrent()
quicksortLomuto(&list, low: 0, high: list.count - 1)
var diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")

print("\n---------Quicksort Hoare---------")
var list2 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print("Original: \(list2)")
start = CFAbsoluteTimeGetCurrent()
quicksortHoare(&list2, low: 0, high: list2.count - 1)
diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")

print("\n---------Quicksort Median---------")
var list3 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print("Original: \(list3)")
start = CFAbsoluteTimeGetCurrent()
quicksortMedian(&list3, low: 0, high: list3.count - 1)
diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")

print("\n---------Quicksort DutchFlag---------")
var list4 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print("Original: \(list4)")
start = CFAbsoluteTimeGetCurrent()
quicksortDutchFlag(&list4, low: 0, high: list4.count - 1)
diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")

