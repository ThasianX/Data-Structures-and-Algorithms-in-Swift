// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)

/*:
 # 2. Graph your Friends
 
 Vincent has three friends, Chesley, Ruiz, and Patrick. Ruiz has friends Ray, Sun, and a mutual friend with Vincent's. Patrick is friends with Cole, and Kerry. Cole is friends with Ruiz and Vincent. Create an adjacency list that represents this friendship graph. Which mutual friend do Ruiz and Vincent share?
 */
let friendGraph = AdjacencyList<String>()

let Vincent = friendGraph.createVertex(data: "Vincent")
let Chesley = friendGraph.createVertex(data: "Chesley")
let Ruiz = friendGraph.createVertex(data: "Ruiz")
let Patrick = friendGraph.createVertex(data: "Patrick")
let Ray = friendGraph.createVertex(data: "Ray")
let Sun = friendGraph.createVertex(data: "Sun")
let Cole = friendGraph.createVertex(data: "Cole")
let Kerry = friendGraph.createVertex(data: "Kerry")

friendGraph.addUndirectedEdge(between: Vincent, and: Chesley, weight: nil)
friendGraph.addUndirectedEdge(between: Vincent, and: Ruiz, weight: nil)
friendGraph.addUndirectedEdge(between: Vincent, and: Patrick, weight: nil)

friendGraph.addUndirectedEdge(between: Ruiz, and: Ray, weight: nil)
friendGraph.addUndirectedEdge(between: Ruiz, and: Sun, weight: nil)

friendGraph.addUndirectedEdge(between: Patrick, and: Cole, weight: nil)
friendGraph.addUndirectedEdge(between: Patrick, and: Kerry, weight: nil)

friendGraph.addUndirectedEdge(between: Cole, and: Ruiz, weight: nil)
friendGraph.addUndirectedEdge(between: Cole, and: Vincent, weight: nil)

print(friendGraph)

let vincentFriends = Set(friendGraph.edges(from: Vincent).map { $0.destination.data })
let ruizFriends = Set(friendGraph.edges(from: Ruiz).map { $0.destination.data })
let mutual = vincentFriends.intersection(ruizFriends)
print("Mutual friends of vincent and ruiz: \(mutual)")
