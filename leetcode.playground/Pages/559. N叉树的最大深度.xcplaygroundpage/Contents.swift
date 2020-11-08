//: [Previous](@previous)
/**
 给定一个 N 叉树，找到其最大深度。
 
 最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。
 
 例如，给定一个 3叉树 :
 
         1
        /|\
       3 2 4
      / \
      5  6
 
 我们应返回其最大深度，3。
 
 说明:
 
 树的深度不会超过 1000。
 树的节点总不会超过 5000。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Node {
    var val: Int
    var children: [Node]
    init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        if root.children.isEmpty {
            return 1
        }
        var maxV = 0
        for node in root.children {
            maxV = max(maxV, maxDepth(node))
        }
        return maxV + 1
    }
}

//: [Next](@next)
