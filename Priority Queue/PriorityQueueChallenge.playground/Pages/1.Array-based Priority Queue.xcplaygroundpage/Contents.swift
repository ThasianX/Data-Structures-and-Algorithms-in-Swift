
// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Priority Queue Challenges
 ## 1. Array-based Priority Queue
 You know how to use a heap to construct a priority queue by conforming
 to the `Queue` protocol. Now construct a priority queue using an `Array`.
 */
public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct PriorityQueue2<Element: Equatable> {

    private let sort: (Element, Element) -> Bool
    private var elements: [Element]

    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements.sorted(by: sort).reversed()
    }

}

extension PriorityQueue2: Queue {

    var isEmpty: Bool {
        elements.isEmpty
    }

    var peek: Element? {
        elements.last
    }

    // O(n)
    mutating func enqueue(_ element: Element) -> Bool {
        var i = elements.count - 1
        while i >= 0 && sort(elements[i], element) {
            i -= 1
        }

        elements.insert(element, at: i+1)
        return true
    }

    // O(1)
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }

}

var priorityQueue = PriorityQueue2(sort: <, elements: [10])
priorityQueue.dequeue()
priorityQueue.enqueue(5)
priorityQueue.enqueue(100)
priorityQueue.enqueue(200)
priorityQueue.enqueue(6)
priorityQueue.enqueue(20)
while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}
//: [Next Challenge](@next)
