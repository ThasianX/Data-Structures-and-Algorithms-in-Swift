// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "creating and manually linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)

    node1.next = node2
    node2.next = node3

    print(node1)
}

func createList() -> LinkedList<Int> {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    return list
}

example(of: "push") {
    print(createList())
}

example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)

    print(list)
}

example(of: "inserting at a particular index") {
    var list = createList()
    print("List before inserting: \(list)")

    var middleNode = list.node(at: 1)!
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    print("List after inserting: \(list)")
}

example(of: "pop") {
    var list = createList()
    print("List before popping: \(list)")

    let poppedValue = list.pop()
    print("List after popping: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}

example(of: "removing last node") {
    var list = createList()
    print("List before removing last: \(list)")

    let removedValue = list.removeLast()
    print("List after removing last: \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "removing after a particular node") {
    var list = createList()
    print("List before removing at particular index: \(list)")

    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    print("List after removing at index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "using collection") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }
    print("List: \(list)")

    print("First element: \(list.first!)")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")

    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

example(of: "array copy on write and value semantics") {
    let array1 = [1, 2]
    var array2 = array1

    print("array1: \(array1)")
    print("array2: \(array2)")

    print("----After adding 3 to array 2----")
    array2.append(3)
    print("array1: \(array1)")
    print("array2: \(array2)")
}

example(of: "linked list copy on write and value semantics") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    var list2 = list1

    print("----After appending 3 to list2----")
    list2.append(3)
    print("list1: \(list1)")
    print("list2: \(list2)")

    print("Removing middle node on list2")
    if let node = list2.node(at: 0) {
        list2.remove(after: node)
    }
    print("list2: \(list2)")
}

extension LinkedList {

    public mutating func pushAndDontCopy(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

}

example(of: "sharing nodes and head first insertions with copy on write") {
    var list1 = LinkedList<Int>()
    (1...3).forEach { list1.append($0) }
    var list2 = list1

    list2.pushAndDontCopy(20)
    list1.pushAndDontCopy(40)
    print("list1: \(list1)")
    print("list2: \(list2)")
    // Notice how both lists differ in their heads. The unidirectional nature of the linked list means that head-first insertions automatically comply to copy on write
}

