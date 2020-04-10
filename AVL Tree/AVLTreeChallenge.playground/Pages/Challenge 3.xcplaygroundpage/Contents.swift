// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## Challenge 3
 
 Since there are many variants of binary trees, it makes sense to group shared
 functionality in a protocol. The traversal methods are a good candidate for
 this.
 
 Create a TraversableBinaryNode protocol that provides a default implementation
 of the traversal methods so that conforming types get these methods for free.
 Have AVLNode conform to this.
 */
protocol TraversableBinaryNode {

    associatedtype Element

    var value: Element { get }

    var leftChild: Self? { get }
    var rightChild: Self? { get }

    func traverseInOrder(_ visit: (Element) -> Void)
    func traversePreOrder(_ visit: (Element) -> Void)
    func traversePostOrder(_ visit: (Element) -> Void)

}

extension TraversableBinaryNode {

    func traverseInOrder(_ visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit)
        visit(value)
        rightChild?.traverseInOrder(visit)
    }

    func traversePreOrder(_ visit: (Element) -> Void) {
        visit(value)
        leftChild?.traverseInOrder(visit)
        rightChild?.traverseInOrder(visit)
    }

    func traversePostOrder(_ visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit)
        rightChild?.traverseInOrder(visit)
        visit(value)
    }

}

extension AVLNode: TraversableBinaryNode {}

example(of: "using TraversableBinaryNode") {
    var tree = AVLTree<Int>()
    for i in 0..<15 {
        tree.insert(i)
    }
    print(tree)
    tree.root?.traverseInOrder { print($0) }
}
