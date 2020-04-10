// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "repeated insertions in sequence") {
    var tree = AVLTree<Int>()
    (0..<15).forEach { tree.insert($0) }
    print(tree)
}

example(of: "removing a value") {
    var tree = AVLTree<Int>()
    tree.insert(15)
    tree.insert(10)
    tree.insert(16)
    tree.insert(18)
    print("Before removal:\n\(tree)")
    tree.remove(10)
    print("After removing 10:\n\(tree)")
}
