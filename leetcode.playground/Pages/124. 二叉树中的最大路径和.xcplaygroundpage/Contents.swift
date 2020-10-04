//: [Previous](@previous)
/**
 给定一个非空二叉树，返回其最大路径和。
 
 本题中，路径被定义为一条从树中任意节点出发，沿父节点-子节点连接，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。
 
   
 
 示例 1：
 
 输入：[1,2,3]
 
       1
      / \
     2   3
 
 输出：6
 示例 2：
 
 输入：[-10,9,20,null,null,15,7]
 
            -10
            / \
           9  20
             /  \
            15   7
 
 输出：42
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-maximum-path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result: Int = .min
        maxGain(root, result: &result)
        return result
    }
    
    func maxGain(_ root: TreeNode?, result: inout Int) -> Int {
        guard let root = root else { return 0 }
        
        //与0取最大值,是因为,如果为负数,则不选择该路径
        let leftMaxGain = max(maxGain(root.left, result: &result), 0)
        let rightMaxGain = max(maxGain(root.right, result: &result), 0)
        
        let pathSum = root.val + leftMaxGain + rightMaxGain
        result = max(result, pathSum)
        
        return max(leftMaxGain, rightMaxGain) + root.val
    }
}

let solution = Solution()
solution.maxPathSum(Tree.createTree(values: [1,2,3]))
solution.maxPathSum(Tree.createTree(values: [-10,9,20,nil,nil,15,7]))

print("Done!")
//: [Next](@next)
