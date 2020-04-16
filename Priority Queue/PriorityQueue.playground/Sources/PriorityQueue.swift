import Foundation

public struct PriorityQueue<Element: Equatable> {

    private var heap: Heap<Element>

    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }

}

extension PriorityQueue: Queue {

    public var isEmpty: Bool {
        heap.isEmpty
    }

    public var peek: Element? {
        heap.peek()
    }

    // O(log n)
    public mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    // O(log n)
    public mutating func dequeue() -> Element? {
        heap.remove()
    }

}
