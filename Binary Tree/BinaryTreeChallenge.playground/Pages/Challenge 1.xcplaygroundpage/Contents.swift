// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Binary Tree Challenges
 
 ## #1. Height of a Tree
 
 Given a binary tree, find the height of the tree. The height of the binary tree
 is determined by the distance between the root and the furthest leaf. The
 height of a binary tree with a single node is zero, since the single node is
 both the root and the furthest leaf.
 */
var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    let twelve = BinaryNode(value: 12)
    let ten = BinaryNode(value: 10)

    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    eight.leftChild = twelve
    twelve.leftChild = ten

    return seven
}()

print(tree)

extension BinaryNode {

    func height() -> Int {
        1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
    }

}

print("Tree height: \(tree.height())")

//: [Next Challenge](@next)
