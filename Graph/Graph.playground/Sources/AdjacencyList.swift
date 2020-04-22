import Foundation

// Better for sparse graphs, ones with few edges
public class AdjacencyList<T: Hashable> {

    public typealias Element = T

    // Storage: O(V + E) - V: number of vertices. E: number of edges
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]

    public init() {}

}

extension AdjacencyList: Graph {

    // Amortized O(1)
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }

    // O(1)
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }

    // O(1)
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        adjacencies[source] ?? []
    }

    // O(V) - V: number of vertices
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        edges(from: source)
            .first { $0.destination == destination }?
            .weight
    }

}

extension AdjacencyList: CustomStringConvertible {

    public var description: String {
        var result = ""

        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for edge in edges {
                edgeString.append("\(edge.destination), ")
            }
            if !edgeString.isEmpty {
                edgeString.removeLast(2)
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
        }

        return result
    }

}
