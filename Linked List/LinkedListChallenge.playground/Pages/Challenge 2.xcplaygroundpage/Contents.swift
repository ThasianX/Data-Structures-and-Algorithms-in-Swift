// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 2: Find the middle node

 Create a function that finds the middle node of a linked list.
 */
// O(n)
func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var trailing = list.head
    var leading = list.head

    while(leading?.next != nil) {
        trailing = trailing?.next
        leading = leading?.next?.next
    }

    return trailing
}

var list = LinkedList<Int>()
(1...10).forEach { list.append($0) }
print("Full List: \(list)")

if let middleNode = getMiddle(list) {
    print("Half List: \(middleNode)")
}
// 1, 2, 3, 4, 5, [6], 7, 8, 9, 10
// 1, [2], 3

//: [Next Challenge](@next)
