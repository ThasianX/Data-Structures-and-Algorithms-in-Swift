// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #3. Comparing Trees
 Create a method that checks if the current tree contains all the elements of another tree.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

var bst2 = BinarySearchTree<Int>()
//bst2.insert(3)
//bst2.insert(1)
//bst2.insert(4)
//bst2.insert(0)
//bst2.insert(2)
//bst2.insert(5)
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)

// Attempt 1 - O(n)
//extension BinarySearchTree {
//
//    public func contains(_ tree: BinarySearchTree<Element>) -> Bool {
//        guard let root = tree.root else {
//            return false
//        }
//
//        if let rootNode = rootNodeIfExists(node: root) {
//            return rootNode.description == root.description
//        }
//
//        return false
//    }
//
//    private func rootNodeIfExists(node: BinaryNode<Element>) -> BinaryNode<Element>? {
//        var rootNode = root
//
//        while let current = rootNode {
//            if node.value == current.value {
//                return current
//            } else if node.value < current.value {
//                rootNode = current.leftChild
//            } else {
//                rootNode = current.rightChild
//            }
//        }
//
//        return nil
//    }
//
//}

// Attempt 2 - O(log n)
extension BinarySearchTree where Element: Hashable {

    public func contains(_ tree: BinarySearchTree<Element>) -> Bool {
        var searchNodes: Set<Element> = []
        tree.root?.traversePreOrder {
            searchNodes.insert($0)
        }

        var doesContain = true
        self.root?.traversePreOrderWithStop {
            if !searchNodes.contains($0) {
                doesContain = false
                return false
            }
            return true
        }

        return doesContain
    }

}

private extension BinaryNode {

    func traversePreOrderWithStop(visit: (Element) -> Bool) {
        if visit(value) {
            leftChild?.traversePreOrderWithStop(visit: visit)
            rightChild?.traversePreOrderWithStop(visit: visit)
        }
    }

}

print("BST 1:\n\(bst)")
print("BST 2:\n\(bst2)")
print("Does BST 1 contain BST 2: \(bst.contains(bst2))")
