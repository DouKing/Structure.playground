//: [Previous](@previous)
/**
 给定二叉搜索树的根结点 root，返回值位于范围 [low, high] 之间的所有结点的值的和。
 
   
 
 示例 1：
 
           10
          /  \
         5   15
        / \    \
       3   7   18
 
     输入：root = [10,5,15,3,7,null,18], low = 7, high = 15
     输出：32
 
 示例 2：
    
              10
            /    \
           5     15
          / \    / \
         3   7  13  18
        /   /
       1   6
     输入：root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
     输出：23
   
 
 提示：
 
     树中节点数目在范围 [1, 2 * 104] 内
     1 <= Node.val <= 105
     1 <= low <= high <= 105
     所有 Node.val 互不相同
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-of-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
//    bfs
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        var sum = 0
        var queue: [TreeNode?] = []
        queue.append(root)
        
        while !queue.isEmpty {
            guard let node = queue.removeFirst() else { continue }
            if node.val > high {
                queue.append(node.left)
            } else if node.val < low {
                queue.append(node.right)
            } else {
                sum += node.val
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        return sum
    }
    
//    dfs
//    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
//        guard let root = root else { return 0 }
//        if root.val > high {
//            return rangeSumBST(root.left, low, high)
//        } else if root.val < low {
//            return rangeSumBST(root.right, low, high)
//        } else {
//            return root.val + rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
//        }
//    }
}

let solution = Solution()
solution.rangeSumBST(Tree.createTree(values: [10,5,15,3,7,nil,18]), 7, 15)
solution.rangeSumBST(Tree.createTree(values: [10,5,15,3,7,13,18,1,nil,6]), 6, 10)


print("Done!")
//: [Next](@next)
