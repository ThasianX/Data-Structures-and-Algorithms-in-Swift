// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueArray<T> {

    private var array: [T] = []
    
    public init() { }

}

extension QueueArray: Queue {

    // Average: O(1). Worst: O(n)
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    // Average: O(n). Worst: O(n)
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }

    public var isEmpty: Bool {
        array.isEmpty
    }

    public var peek: T? {
        array.first
    }

}

extension QueueArray: CustomStringConvertible {

    public var description: String {
        String(describing: array)
    }

}


var queue = QueueArray<String>()
queue.enqueue("Kevin")
queue.enqueue("Jason")
queue.enqueue("Richard")
print("Queue: \(queue)")
queue.dequeue()
print("Queue after dequeue: \(queue)")
print("Peek: \(queue.peek)")

// Strengths
// Most operations are constant time except for `dequeue`
// Storage space is linear
// Easy to implement with array

// Weaknesses
// Removing an item from the front of queue can be inefficient
// Array has to resize when it gets full which can be costly for bigger arrays
