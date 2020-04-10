// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## Challenge 2
 
 How many **nodes** are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height `h`?
 */
import Darwin

// Attempt 1 - Unoptimal - O(n)
//func nodes(inTreeOfHeight height: Int) -> Int {
//    (1...height).reduce(0, { nodes, height in
//        nodes + leafNodes(inTreeOfHeight: height)
//    })
//}
//
//func leafNodes(inTreeOfHeight height: Int) -> Int {
//    Int(pow(2.0, Double(height - 1)))
//}

// Attempt 2 - Optimal - O(1)
func nodes(inTreeOfHeight height: Int) -> Int {
    Int(pow(2.0, Double(height+1))) - 1
}


print(nodes(inTreeOfHeight: 3))

//: [Next Challenge](@next)
