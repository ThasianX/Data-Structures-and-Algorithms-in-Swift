// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 # Prim's Algorithm Challenges
 
 ## 1. Construct a MST with points
 
 Given a set of points, construct a minimum spanning tree connecting the points into a graph.
 ![Graph](challenge1.png)
 */
import UIKit

extension CGPoint: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }

    public func distance(to point: CGPoint) -> Double {
        let xDist = Double(point.x - x)
        let yDist = Double(point.y - y)
        return sqrt(xDist*xDist + yDist*yDist)
    }

}

extension Prim where T == CGPoint {

    public func produceMinimumSpanningTree(with points: [CGPoint]) -> (cost: Double, mst: Graph) {
        produceMinimumSpanningTree(for: completeGraph(for: points))
    }

    func completeGraph(for points: [CGPoint]) -> Graph {
        let completedGraph = Graph()

        var vertices = [Vertex<CGPoint>]()

        for point in points {
            vertices.append(completedGraph.createVertex(data: point))
        }

        vertices.forEach { currentVertex in
            vertices.forEach { vertex in
                if currentVertex != vertex {
                    completedGraph.addUndirectedEdge(
                        between: currentVertex,
                        and: vertex,
                        weight: currentVertex.data.distance(to: vertex.data))
                }
            }
        }

        return completedGraph
    }

}

let points = [CGPoint(x: 4, y: 0), // 0
    CGPoint(x: 6, y: 16), // 1
    CGPoint(x: 10, y: 1), // 2
    CGPoint(x: 3, y: 17), // 3
    CGPoint(x: 18, y: 7), // 4
    CGPoint(x: 5, y: 14)] // 5

let (cost,mst) = Prim().produceMinimumSpanningTree(with: points)

print(mst)
print(cost)
//: ### Sample Test Case
//: ![Table](challenge1_final.png)
