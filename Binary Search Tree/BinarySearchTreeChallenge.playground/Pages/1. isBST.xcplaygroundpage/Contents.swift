// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Binary Search Tree Challenges
 ### #1. Binary Tree or Binary Search Tree?
 
 Create a function that checks if a binary tree is a binary search tree.
 */
// Attempt 1 - O(n)
//func isBinarySearchTree(node: BinaryNode<Int>) -> Bool {
//    var isBST = true
//
//    if let left = node.leftChild {
//        if node.value > left.value {
//            isBST = isBST && isBinarySearchTree(node: left)
//        } else {
//            isBST = false
//        }
//    }
//
//    if let right = node.rightChild {
//        if node.value < right.value {
//            isBST = isBST && isBinarySearchTree(node: right)
//        } else {
//            isBST = false
//        }
//    }
//
//    return isBST
//}

// Attempt 2 - O(n) - Better code
func isBinarySearchTree(node: BinaryNode<Int>) -> Bool {
    return isBinarySearchTree(node, min: nil, max: nil)
}

private func isBinarySearchTree(_ node: BinaryNode<Int>?,
                                min: Int?,
                                max: Int?) -> Bool {
    guard let node = node else {
        return true
    }

    if let min = min, node.value < min {
        return false
    }

    if let max = max, node.value > max {
        return false
    }

    return isBinarySearchTree(node.leftChild, min: nil, max: node.value) &&
        isBinarySearchTree(node.rightChild, min: node.value, max: nil)
}


var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print("Tree:\n\(bst)")
if isBinarySearchTree(node: bst.root!) {
    print("The above tree is a BST\n")
} else {
    print("The above tree is not a BST\n")
}

var notBST = BinaryNode<Int>(value: 8)
var ten = BinaryNode<Int>(value: 10)
var two = BinaryNode<Int>(value: 2)
var eleven = BinaryNode<Int>(value: 11)
notBST.leftChild = ten
notBST.rightChild = two
two.leftChild = eleven

print("Not a BST:\n\(notBST)")
if isBinarySearchTree(node: notBST) {
    print("The above tree is a BST")
} else {
    print("The above tree is not a BST")
}


//: [Next Challenge](@next)

