import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode: Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        
    }
}

extension ListNode: CustomDebugStringConvertible {
    public var debugDescription: String {
//        var node: ListNode? = self
//        var str = ""
//        while let n = node {
//            str += "\(n.val) -> "
//            node = n.next
//        }
//        str += "nil"
//        return str
        
        var visited: Set<ListNode> = Set()
        return desc(node: self, visited: &visited)
    }
    
    private func desc(node: ListNode?, visited: inout Set<ListNode>) -> String {
        var node: ListNode? = self
        var str = ""
        var pos: ListNode? = nil
        while let n = node {
            if visited.contains(n) {
                pos = n
                break
            } else {
                str += "\(n.val) -> "
                visited.insert(n)
                node = n.next
            }
        }
        if let pos = pos {
            str += "\(pos.val)"
        } else {
            str += "nil"
        }
        return str
    }
}

public class List {
    public static func create(_ vals: [Int]) -> ListNode? {
        if vals.isEmpty {
            return nil
        }
        
        let head: ListNode = ListNode(vals.first!)
        var current: ListNode = head
        for i in 1 ..< vals.count {
            let node = ListNode(vals[i])
            current.next = node
            
            current = node
        }
        
        return head
    }
}
