// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 3: Reverse a linked list

 Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
 */
extension LinkedList {

    // Attempt 1 - Run time: O(n) but significant memory cost
    //    mutating func reverse() {
    //        var list = LinkedList<Value>()
    //
    //        while(!isEmpty) {
    //            list.push(pop()!)
    //        }
    //
    //        head = list.head
    //        tail = list.tail
    //    }

    // Attempt 2 - O(n) and more efficient memory
    mutating func reverse() {
        tail = head
        var previous = head
        var current = head?.next
        previous?.next = nil

        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }

        head = previous
    }

}

var list = LinkedList<Int>()
(0...5).forEach { list.append($0) }
list.reverse()
print(list)

// 0, 1, 2, 3, 4

//: [Next Challenge](@next)
