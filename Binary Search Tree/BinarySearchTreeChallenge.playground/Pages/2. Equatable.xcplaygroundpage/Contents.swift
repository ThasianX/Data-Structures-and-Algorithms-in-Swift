// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #2. Equatable
 The binary search tree currently lacks `Equatable` conformance. Your challenge is to conform adopt the `Equatable` protocol.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

var bst2 = BinarySearchTree<Int>()
bst2.insert(3)
bst2.insert(1)
bst2.insert(4)
bst2.insert(0)
bst2.insert(2)
bst2.insert(5)
//bst2.insert(2)
//bst2.insert(5)
//bst2.insert(3)
//bst2.insert(1)
//bst2.insert(0)
//bst2.insert(4)

// Attempt 1 - O(n)
//extension BinarySearchTree: Equatable {
//
//    public static func == (lhs: BinarySearchTree<Element>, rhs: BinarySearchTree<Element>) -> Bool {
//        guard lhs.root != nil && rhs.root != nil else {
//            return false
//        }
//        var lhsCopy = lhs
//        var rhsCopy = rhs
//        while let lRoot = lhsCopy.root, let rRoot = rhsCopy.root {
//            if lRoot.value != rRoot.value {
//                return false
//            }
//            lhsCopy.remove(lRoot.value)
//            rhsCopy.remove(rRoot.value)
//        }
//        return true
//    }
//
//}

// Attempt 2 - O(n) - Much better solution. Don't have to make a copy of the tree
extension BinarySearchTree: Equatable {

    public static func == (lhs: BinarySearchTree<Element>, rhs: BinarySearchTree<Element>) -> Bool {
        isEqual(lhs.root, rhs.root)
    }

    private static func isEqual<Element: Equatable>(
        _ _leftNode: BinaryNode<Element>?,
        _ _rightNode: BinaryNode<Element>?) -> Bool {
        guard let leftNode = _leftNode,
            let rightNode = _rightNode else {
                return _leftNode == nil && _rightNode == nil
        }

        return leftNode.value == rightNode.value &&
            isEqual(leftNode.leftChild, rightNode.leftChild) &&
            isEqual(leftNode.rightChild, rightNode.rightChild)
    }

}

print("BST 1:\n\(bst)")
print("BST 2:\n\(bst2)")
print("Are the 2 BSTs above equal: \(bst == bst2)")

//: [Next Challenge](@next)
