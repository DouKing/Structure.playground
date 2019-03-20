//: [Previous](@previous)

import Foundation

//: 使用邻接表实现 稀疏连接图

class Vertex<T: Hashable, V> {
    let id: T
    private var connectedTo: [T: V] = [:]

    init(id: T) {
        self.id = id
    }

    func add(neighbor: T, weight: V? = nil) {
        self.connectedTo[neighbor] = weight
    }

    func connections() -> [T] {
        return Array(connectedTo.keys)
    }

    func weight(to neighbor: T) -> V? {
        return self.connectedTo[neighbor]
    }
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(id) contect to: \(connectedTo)"
    }
}

class Graph<T: Hashable, V> {
    private var vertexs: [T: Vertex<T, V>] = [:]

    func addVertex(_ value: T) -> Vertex<T, V> {
        let vertex = Vertex<T, V>(id: value)
        self.vertexs[value] = vertex
        return vertex
    }

    func add(vertex: Vertex<T, V>) {
        self.vertexs[vertex.id] = vertex
    }

    func vertex(with value: T) -> Vertex<T, V>? {
        return self.vertexs[value]
    }

    func addEdge(frontValue: T, backValue: T, weight: V? = nil) {
        var front = self.vertexs[frontValue]
        if front == nil {
            front = self.addVertex(frontValue)
        }
        var back = self.vertexs[backValue]
        if back == nil {
            back = self.addVertex(backValue)
        }
        front!.add(neighbor: backValue, weight: weight)
    }

    func allVertexs() -> [T] {
        return Array(self.vertexs.keys)
    }
}

extension Graph: CustomStringConvertible {
    var description: String {
        return "\(self.vertexs)"
    }
}

typealias VertexST = Vertex<Int, Int>
typealias GraphST = Graph<Int, Int>

let graph = GraphST()
for v in 1...5 {
    graph.addVertex(v)
}
graph.addEdge(frontValue: 1, backValue: 2, weight: 1)
graph.addEdge(frontValue: 2, backValue: 3, weight: 2)
graph.addEdge(frontValue: 3, backValue: 4, weight: 3)
graph.addEdge(frontValue: 4, backValue: 5, weight: 4)
graph.addEdge(frontValue: 5, backValue: 1, weight: 5)
graph.allVertexs()

graph


//: [Next](@next)
