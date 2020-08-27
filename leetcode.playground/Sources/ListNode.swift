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

extension ListNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var node: ListNode? = self
        var str = ""
        while let n = node {
            str += "\(n.val) -> "
            node = n.next
        }
        str += "nil"
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
