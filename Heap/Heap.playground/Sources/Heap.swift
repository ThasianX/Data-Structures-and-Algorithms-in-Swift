import Foundation

public struct Heap<Element: Equatable> {

    private var elements: [Element]
    private let sort: (Element, Element) -> Bool

    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements

        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: i)
        }
    }

}

// MARK: Core Properties and Methods
extension Heap {

    public var isEmpty: Bool {
        elements.isEmpty
    }

    public var count: Int {
        elements.count
    }

    public func peek() -> Element? {
        elements.first
    }

    public func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }

    public func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }

    public func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }

}

// MARK: Add Operations
extension Heap {

    // O(log n)
    public mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: count - 1)
    }

}

// MARK: Remove Operations
extension Heap {

    // O(log n)
    public mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count-1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }

    public mutating func remove(at index: Int) -> Element? {
        guard index >= 0 && index < count else {
            return nil
        }

        if index == count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }

}

// MARK: Search Operations
extension Heap {

    public func index(of element: Element) -> Int? {
        index(of: element, startingAt: 0)
    }

    private func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }

        if sort(element, elements[i]) {
            return nil
        }

        if element == elements[i] {
            return i
        }

        if let index = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return index
        }

        if let index = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return index
        }

        return nil
    }

}

// MARK: Helper Functions
extension Heap {

    // O(log n)
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }

    // O(log n)
    private mutating func siftDown(from index: Int) {
        let left = leftChildIndex(ofParentAt: index)
        let right = rightChildIndex(ofParentAt: index)
        var candidate = index

        if left < count && sort(elements[left], elements[candidate]) {
            candidate = left
        }

        if right < count && sort(elements[right], elements[candidate]) {
            candidate = right
        }

        if candidate != index {
            elements.swapAt(index, candidate)
            siftDown(from: candidate)
        }
    }
    
}
