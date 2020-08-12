import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node]
    
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

extension Node: CustomDebugStringConvertible {
    public var debugDescription: String {
        var visited: [Int] = []
        var result: [[Int]] = []

        dfs(self, visited: &visited, result: &result)
        
        return "\(result)"
    }
    
    func dfs(_ node: Node, visited: inout [Int], result: inout [[Int]]) {
        guard !visited.contains(node.val) else {
            return
        }
        visited.append(node.val)
        let arr = node.neighbors.map { $0.val }
        result.append(arr)
        
        for n in node.neighbors {
            dfs(n, visited: &visited, result: &result)
        }
    }
}
