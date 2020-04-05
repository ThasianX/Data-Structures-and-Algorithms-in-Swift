// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 4: Merge two lists

 Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
 */
// O(n)
func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else {
        return right
    }

    guard !right.isEmpty else {
        return left
    }

    var sortedList = LinkedList<T>()
    var leftHead = left.head
    var rightHead = right.head

    while(leftHead != nil && rightHead != nil) {
        let leftValue = leftHead!.value
        let rightValue = rightHead!.value
        if leftValue < rightValue {
            sortedList.append(leftValue)
            leftHead = leftHead?.next
        } else {
            sortedList.append(rightValue)
            rightHead = rightHead?.next
        }
    }

    if let leftHead = leftHead {
        sortedList.tail?.next = leftHead
    }

    if let rightHead = rightHead {
        sortedList.tail?.next = rightHead
    }

    return sortedList
}

var list1 = LinkedList<Int>()
list1.append(1)
list1.append(3)
list1.append(5)
var list2 = LinkedList<Int>()
list2.append(2)
list2.append(4)
list2.append(6)
list2.append(9)
list2.append(10)
list2.append(11)
print(mergeSorted(list1, list2))

//: [Next Challenge](@next)
