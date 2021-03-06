// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # AVL Tree Challenges
 ## Challenge 1
 How many **leaf** nodes are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height `h`?
 */
import Darwin

func leafNodes(inTreeOfHeight height: Int) -> Int {
    Int(pow(2.0, Double(height - 1)))
}

print(leafNodes(inTreeOfHeight: 4))

//: [Next Challenge](@next)
