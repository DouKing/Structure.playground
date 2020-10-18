//: [Previous](@previous)
/**
 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
         3
        / \
       9  20
         /  \
        15   7
 返回锯齿形层次遍历如下：
 
     [
         [3],
         [20,9],
         [15,7]
     ]
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var ans: [[Int]] = []
        var queue: [TreeNode] = []
        var fromLeft = true
        
        queue.append(root)
        while !queue.isEmpty {
            var level: [Int] = []
            let count = queue.count
            for _ in 0 ..< count {
                let node = queue.removeFirst()
                if fromLeft {
                    level.append(node.val)
                } else {
                    level.insert(node.val, at: 0)
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            ans.append(level)
            fromLeft = !fromLeft
        }
        
        return ans
    }
}

let solution = Solution()

let root = Tree.createTree(values: [3, 9, 20, nil, nil, 15, 7])
let ans = solution.zigzagLevelOrder(root)
print(ans)

print("Done!")
//: [Next](@next)
