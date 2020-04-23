// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//: ![sampleGraph](sampleGraph.png)
extension Graph where Element: Hashable {

    // Time: O(V + E)
    // Space: O(V)`
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack = Stack<Vertex<Element>>()
        var pushed = Set<Vertex<Element>>()
        var visited = [Vertex<Element>]()

        stack.push(source)
        pushed.insert(source)
        visited.append(source)

        outer: while let vertex = stack.peek() {
            let neighbors = edges(from: vertex)

            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }

            for edge in neighbors {
                let destination = edge.destination
                if !pushed.contains(destination) {
                    stack.push(destination)
                    pushed.insert(destination)
                    visited.append(destination)
                    continue outer
                }
            }

            stack.pop()
        }

        return visited
    }

}


let graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")

graph.add(.undirected, from: a, to: b, weight: nil)
graph.add(.undirected, from: a, to: c, weight: nil)
graph.add(.undirected, from: a, to: d, weight: nil)
graph.add(.undirected, from: b, to: e, weight: nil)
graph.add(.undirected, from: c, to: g, weight: nil)
graph.add(.undirected, from: e, to: f, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)
graph.add(.undirected, from: f, to: g, weight: nil)
graph.add(.undirected, from: f, to: c, weight: nil)

let vertices = graph.depthFirstSearch(from: a)
vertices.forEach { vertex in
    print(vertex)
}
