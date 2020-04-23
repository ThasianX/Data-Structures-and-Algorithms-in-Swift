// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Depth-First Search Challenges
 ## 1. BFS or DFS
 
 For each of the following two examples, which traversal (depth-first or
 breadth-first) is better for discovering if a path exists between the
 two nodes? Explain why.
 
 ![Graph](dfschallenge1.png)

 Path from **A** to **F**.
 */
// Depth First because it's more suitable for destinations that are farther from the source. Depth first considers 1 path to its entirety, which makes it more suitable for farther destinations.
// On the other hand, breadth first considers all its neighbors as it finds its destination
/*:
 Path from **A** to **G**.
 */
// Breadth first. Same explanation as above. It'll consider A's neighbors first: B and G. Once it finds G, it'll stop.
//: [Next Challenge](@next)
