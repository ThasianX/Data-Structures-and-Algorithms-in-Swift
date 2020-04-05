// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 5: Remove all occurrences of a specific element

 Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the `remove(at:)` method that you implemented for the linked list.
 */
// Attempt 1 - O(n)
//extension LinkedList where Value: Equatable {
//
//    mutating func removeAll(_ value: Value) {
//        while head?.value == value {
//            head = head?.next
//        }
//
//        var current = head
//
//        while current != nil {
//            while current?.next?.value == value {
//                current?.next = current?.next?.next
//            }
//            current = current?.next
//        }
//    }
//
//}

// Attempt 2 - O(n)
extension LinkedList where Value: Equatable {

    mutating func removeAll(_ value: Value) {
        while head?.value == value {
            head = head?.next
        }

        var previous = head
        var current = head?.next

        while let currentNode = current {
            if currentNode.value == value {
                previous?.next = currentNode.next
                current = previous?.next
            } else {
                previous = current
                current = current?.next
            }
        }

        tail = previous
    }

}

var list1 = LinkedList<Int>()
list1.append(3)
list1.append(3)
list1.append(0)
list1.append(3)
list1.append(3)
list1.append(3)
list1.append(1)
list1.append(3)
list1.append(3)
list1.append(3)
list1.append(4)
list1.removeAll(3)
print(list1)
