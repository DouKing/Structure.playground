//: [Previous](@previous)
/**
 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 
 示例:
 
 输入: [1,2,3,null,5,null,4]
 输出: [1, 3, 4]
 解释:
 
         1            <---
       /   \
      2     3         <---
       \     \
        5     4       <---
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-right-side-view
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        return bfs(root)
    }
    
    private func bfs(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var maxDepth = -1
        var depthValueMap: [Int: Int] = [:]
        
        var nodeQueue: [TreeNode] = []
        var depthQueue: [Int] = []
        nodeQueue.append(root)
        depthQueue.append(0)
        
        while !nodeQueue.isEmpty {
            let node = nodeQueue.removeFirst()
            let depth = depthQueue.removeFirst()
            
            //更新最大深度
            maxDepth = max(depth, maxDepth)
            depthValueMap[depth] = node.val
            
            if let left = node.left {
                nodeQueue.append(left)
                depthQueue.append(depth + 1)
            }
            if let right = node.right {
                nodeQueue.append(right)
                depthQueue.append(depth + 1)
            }
        }
        
        var ans: [Int] = []
        var i = 0
        while i <= maxDepth {
            if let value = depthValueMap[i] {
                ans.append(value)
            }
            i += 1
        }
        return ans
    }
}

let solution = Solution()

let root = Tree.createTree(values: [1, 2, 3, nil, 4, nil, 5])
print(solution.rightSideView(root))

print("Done!")
//: [Next](@next)
