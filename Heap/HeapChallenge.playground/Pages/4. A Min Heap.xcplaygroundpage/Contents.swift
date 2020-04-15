// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 4. A Min Heap?
 Write a function to check if a given array is a min heap.
 */
func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
}

// O(n)
func isMinHeap<Element: Comparable>(elements: [Element]) -> Bool {
    guard !elements.isEmpty else {
        return true
    }
    return isMinHeap(elements: elements, from: 0)
}

func isMinHeap<Element: Comparable>(elements: [Element], from index: Int) -> Bool {
    let left = leftChildIndex(ofParentAt: index)
    let right = rightChildIndex(ofParentAt: index)

    if left < elements.count {
        let value = elements[index]
        if value > elements[left] {
            return false
        }
        if right < elements.count && value > elements[right] {
            return false
        }
        return isMinHeap(elements: elements, from: left) && isMinHeap(elements: elements, from: right)
    }

    return true
}

let elements = [1, 3, 12, 5, 10, 18, 21, 6, 8, 11, 15, 100, 20]
print("Elements: \(elements)")
print("Is min heap: \(isMinHeap(elements: elements))")

