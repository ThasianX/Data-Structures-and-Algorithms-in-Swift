// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class QueueLinkedList<T> {

    private var list = DoublyLinkedList<T>()

    public init() { }

}

extension QueueLinkedList: Queue {

    // Average: O(1). Worst: O(1)
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }

    // Average: O(1). Worst: O(1)
    public func dequeue() -> T? {
        guard !list.isEmpty, let first = list.first else {
            return nil
        }
        return list.remove(first)
    }

    public var peek: T? {
        list.first?.value
    }

    public var isEmpty: Bool {
        list.isEmpty
    }

}

extension QueueLinkedList: CustomStringConvertible {

    public var description: String {
        String(describing: list)
    }
    
}


var queue = QueueLinkedList<String>()
queue.enqueue("Kevin")
queue.enqueue("Jason")
queue.enqueue("Richard")
print("Queue: \(queue)")
queue.dequeue()
print("Queue after dequeue: \(queue)")
print("Peek: \(queue.peek)")

// Strengths
// Constant time enqueue and dequeue

// Weaknesses
// High overhead: each element has to have extra storage for the forward and back reference
// Everytime you create a new element, it requires a relatively expensive dynamic allocation
