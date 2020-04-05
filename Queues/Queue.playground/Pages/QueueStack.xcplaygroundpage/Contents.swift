// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueStack<T> {

    private var leftStack: [T] = []
    private var rightStack: [T] = []

    public init() { }

}

extension QueueStack: Queue {

    // Average: O(1). Worst: O(n)
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }

    // Average: O(1)[Amortized O(1)]. Worst: O(n)
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }

    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }

    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }

}

extension QueueStack: CustomStringConvertible {

    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }

}


var queue = QueueStack<String>()
queue.enqueue("Kevin")
queue.enqueue("Jason")
queue.enqueue("Richard")
print("Queue: \(queue)")
queue.dequeue()
print("Queue after dequeue: \(queue)")
print("Peek: \(queue.peek)")

// Strengths
// Amortized constant time dequeue
// Stack implementations are dynamic and not fixed
// Beats linked list in terms of spacial locality: array elements are next to each other in memory blocks and are easily accessible by the system cache. For linked lists, the elements aren't in contiguous blocks of memory so it could lead to mroe cache misses which will increase access time

// Weaknesses
// Worst case performance is O(n) when the right queue needs to be reversed or runs out of capacity
