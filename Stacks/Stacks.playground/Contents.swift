// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct Stack<Element> {

    private var storage: [Element] = []

    public init() { }

    public init(_ elements: [Element]) {
        storage = elements
    }

}

extension Stack: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Element...) {
        storage = elements
    }

}

// MARK: Essential Operations
extension Stack {

    public mutating func push(_ element: Element) {
        storage.append(element)
    }

    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }

}

// MARK: Non-essential operations
extension Stack {

    public func peek() -> Element? {
        storage.last
    }

    public var isEmpty: Bool {
        storage.isEmpty
    }

}

extension Stack: CustomStringConvertible {

    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

example(of: "initializing an empty stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)

    print(stack)

    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)

    print(stack)

    stack.pop()
    print("Stack after popped: \(stack)")
}

example(of: "initializing a stack from array literals") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]

    print(stack)

    stack.pop()
    print("Stack after popped: \(stack)")
}
