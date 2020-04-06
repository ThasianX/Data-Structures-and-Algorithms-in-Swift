// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous](@previous)
/*:
 ## 5. Double-ended queue

 A doubled-ended queue — a.k.a. a **deque** — is, as its name suggests, a queue where elements
 can be added or removed from the `front` or `back`.

 ### Recall:
 - A queue **(FIFO order)** allows you to add elements to the back and remove from the front.
 - A stack **(LIFO order)** allows you to add elements to the back, and remove from the back.

 Deque can be considered both a queue and a stack at the same time.

 A simple `Deque` protocol has been provided to help you build your data structure. An enum `Direction` has been provided to help describe whether you are adding or removing an element from the front or back of the deque. You can use any data structure you prefer to construct a `Deque`.

 > Note: In **DoubleLinkedList.swift** one additional property and function has been added:
 > 1. A property called `last` has been added to help get the tail element of a double-linked list.
 > 2. A function called `prepend(_:)` has been added to help you add an element to the front of a double-linked list.

 */
enum Direction {

    case front
    case back

}

protocol Deque {

    associatedtype Element
    var isEmpty: Bool { get }
    func peek(from direction: Direction) -> Element?
    mutating func enqueue(_ element: Element,
                          to direction: Direction) -> Bool
    mutating func dequeue(from direction: Direction) -> Element?

}

struct Deque1<T>: Deque {

    typealias Element = T
    private var list = DoublyLinkedList<T>()

    init() { }

    // O(1)
    var isEmpty: Bool {
        list.isEmpty
    }

    // O(1)
    func peek(from direction: Direction) -> T? {
        switch direction {
        case .front:
            return list.first?.value
        case .back:
            return list.last?.value
        }
    }

    // O(1)
    mutating func enqueue(_ element: T, to direction: Direction) -> Bool {
        switch direction {
        case .front:
            list.prepend(element)
        case .back:
            list.append(element)
        }
        return true
    }

    // O(1)
    mutating func dequeue(from direction: Direction) -> T? {
        switch direction {
        case .front:
            guard let first = list.first else {
                return nil
            }
            return list.remove(first)
        case .back:
            guard let last = list.last else {
                return nil
            }
            return list.remove(last)
        }
    }

}

extension Deque1: CustomStringConvertible {

    var description: String {
        String(describing: list)
    }

}

var deque = Deque1<Int>()
deque.enqueue(3, to: .front)
deque.enqueue(2, to: .front)
deque.enqueue(1, to: .front)
deque.enqueue(4, to: .back)
deque.enqueue(5, to: .back)
print("Original: \(deque)")

deque.dequeue(from: .front)
deque.dequeue(from: .front)
print("Dequeue front x2: \(deque)")
deque.dequeue(from: .back)
print("Dequeue back: \(deque)")
print("Peek :\(deque.peek(from: .front))")

//: [Next](@next)

