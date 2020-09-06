//: [Previous](@previous)
/**
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 返回其自底向上的层次遍历为：
 
     [
        [15,7],
        [9,20],
        [3]
     ]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let root = root else { return result }
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var array = [Int]()
            for _ in 0 ..< queue.count {
                let treeNode = queue.removeFirst()
                array.append(treeNode.val)
                
                if let left = treeNode.left {
                    queue.append(left)
                }
                if let right = treeNode.right {
                    queue.append(right)
                }
            }
            
            result.insert(array, at: 0)
        }
        
        return result
    }
}

let solution = Solution()

let root = Tree.createTree(values: [3, 9, 20, nil, nil, 15, 7])
solution.levelOrderBottom(root)

print("Done!")
//: [Next](@next)
