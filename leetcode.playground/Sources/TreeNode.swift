import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public var parent: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    // 是否叶子节点
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return self === parent?.left
    }
    
    public var isRightChild: Bool {
        return self === parent?.right
    }
}

extension TreeNode: CustomStringConvertible {
    private static func show(node: TreeNode?, prefix: String = "  ", content: String = "") -> String {
        var nextPrefix = prefix + ((node?.isRightChild ?? true) ? "|" : " ")
        var result = prefix + "·--"
        if let node = node {
            let value = "\(node.val)"
            result += "\(value)\n"
            for _ in 0 ..< (value.count - 1) {
                nextPrefix += " "
            }
        } else {
            result += "x\n"
        }
        
        if node?.left != nil || node?.right != nil {
            result += show(node: node?.right, prefix: nextPrefix + "  ", content: result)
            result += show(node: node?.left, prefix: nextPrefix + "  ", content: result)
        }
        
        return result
    }
    
    public var description: String {
        return TreeNode.show(node: self)
    }
}

public class Tree {
    
    static public func createTree(values: [Int?]) -> TreeNode? {
        var queue: [TreeNode?] = []
        var root: TreeNode? = nil
        var curr: TreeNode? = nil
        var front: Int = 0, real: Int = -1
        for value in values {
            curr = nil
            if let value = value {
                curr = TreeNode(value)
            }
            real = real + 1
            queue.append(curr)
            if real == 0 {
                root = curr
            } else {
                if let curr = curr, let node = queue[front] {
                    if real % 2 == 1 {
                        node.left = curr
                    } else {
                        node.right = curr
                    }
                    curr.parent = node
                }
                if real % 2 == 0 {
                    front = front + 1
                }
            }
        }
        return root
    }

}
