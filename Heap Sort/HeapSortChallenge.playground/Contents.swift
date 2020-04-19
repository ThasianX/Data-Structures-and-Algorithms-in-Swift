// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 # Heap Sort Challenges
 ## 1. Add Heap Sort to `Array`

 Add a `heapSort()` method to Array. This method should sort the array
 in ascending order.
 
 */

extension Array where Element: Comparable {

    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }

    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }

    mutating func siftDown(from index: Int, upTo size: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent

            if (left < size) && (self[left] > self[candidate]) {
                candidate = left
            }
            if (right < size) && (self[right] > self[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            swapAt(parent, candidate)
            parent = candidate
        }
    }

    mutating func heapSort() {
        // Makes array a heap by sifting down all parent nodes so they end up in the right spot
        for i in stride(from: (count / 2) - 1, through: 0, by: -1) {
            siftDown(from: i, upTo: count)
        }

        for i in indices.reversed() {
            swapAt(0, i)
            siftDown(from: 0, upTo: i)
        }
    }

}

var array = [6, 12, 2, 26, 8, 18, 21, 9, 5]
print("Unsorted: \(array)")
array.heapSort()
print("Sorted: \(array)")

/*:
 ## 2. Theory
 When performing a heap sort in ascending order, which of these starting
 arrays requires the fewest comparisons?
 - `[1,2,3,4,5]`
 - `[5,4,3,2,1]`
 */
// The second array because it's already in heap form.
/*:
 ## 3. Descending Order
 The chapter implementation of heap sort, sorts the elements in ascending order.
 How would you sort in descending order?
 */
// You would just make a min heap and perform the sorting algorithm
