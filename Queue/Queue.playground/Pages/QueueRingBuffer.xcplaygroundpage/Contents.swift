// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueRingBuffer<T> {

    private var ringBuffer: RingBuffer<T>

    public init(count: Int) {
        ringBuffer = RingBuffer(count: count)
    }

}

extension QueueRingBuffer: Queue {

    // Average: O(1). Worst: O(1)
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }

    // Average: O(1). Worst: O(1)
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }

    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }

    public var peek: T? {
        ringBuffer.first
    }

}

extension QueueRingBuffer: CustomStringConvertible {

    public var description: String {
        String(describing: ringBuffer)
    }

}


var queue = QueueRingBuffer<String>(count: 10)
queue.enqueue("Kevin")
queue.enqueue("Jason")
queue.enqueue("Richard")
print("Queue: \(queue)")
queue.dequeue()
print("Queue after dequeue: \(queue)")
print("Peek: \(queue.peek)")

// Strengths
// Fixed size - worse case for space complexity is as bad as average case
// Constant time enqueue and dequeue

// Weaknesses
// Fixed size so enqueue can fail
