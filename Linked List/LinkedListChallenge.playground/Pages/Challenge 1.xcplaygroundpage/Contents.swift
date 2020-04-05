// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Linked List Challenges
 ## Challenge 1: Print in reverse

 Create a function that prints the nodes of a linked list in reverse order.
 */
// Attempt 1 - No Recursion - O(n)
//func printInReverse<T>(_ list: LinkedList<T>) {
//    var copy = list
//    while(!copy.isEmpty) {
//        print(copy.removeLast()!)
//    }
//}

// Attempt 2 - O(n)
func printInReverse<T>(_ list: LinkedList<T>) {
    printInReverse(list.head)
}

private func printInReverse<T>(_ node: Node<T>?) {
    guard let node = node else { return }
    printInReverse(node.next)
    print(node.value)
}

var list = LinkedList<Int>()
(1...3).forEach { list.append($0) }
printInReverse(list)

//: [Next Challenge](@next)
