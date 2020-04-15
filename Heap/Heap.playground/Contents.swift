// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var heap = Heap(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7])

print("Index of 7 in heap: \(heap.index(of: 7)!)")

print("Heap ordering: ", terminator: "")
while !heap.isEmpty {
    print("\(heap.remove()!) ", terminator: "")
}
print()
