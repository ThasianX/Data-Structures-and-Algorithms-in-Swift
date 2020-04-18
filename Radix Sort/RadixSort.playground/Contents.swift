// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
import Foundation

extension Array where Element == Int {

    // This algorithm covers least significant digit radix sort. Another way would be to do most significant digit radix sort.
    //O(k*n) - k: number of significant digits of largest number, n: number of integers in the array
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1

        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)

            forEach { number in
                let remainingPart = number / digits
                let bucket = remainingPart % base
                buckets[bucket].append(number)
                if remainingPart > 0 {
                    done = false
                }
            }

            digits *= base
            self = buckets.flatMap { $0 }
        }
    }

}

example(of: "radix sort") {
    let start = CFAbsoluteTimeGetCurrent()

    var array = [88, 410, 1772, 20]
    print("Original array: \(array)")
    array.radixSort()
    print("Radix sorted: \(array)")

    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Took \(diff) seconds")
}
