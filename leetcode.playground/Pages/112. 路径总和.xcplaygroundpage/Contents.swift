//: [Previous](@previous)
/**
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 给定如下二叉树，以及目标和 sum = 22，
 
           5
          / \
         4   8
        /   / \
       11  13  4
      /  \      \
     7    2      1
 返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        var values: [Int] = []
        return dfs(root, sum: sum, values: &values)
    }
    
    func dfs(_ root: TreeNode?, sum: Int, values: inout [Int]) -> Bool {
        guard let root = root else { return false }
        values.append(root.val)
        if root.left == nil && root.right == nil {
            let total = values.reduce(0) { (result, value) -> Int in
                return result + value
            }
            if total == sum {
                debugPrint(values)
                return true
            }
        }
        let leftHasSum = dfs(root.left, sum: sum, values: &values)
        let rightHasSum = dfs(root.right, sum: sum, values: &values)
        values.removeLast()
        return leftHasSum || rightHasSum
    }
}

let solution = Solution()

let root = Tree.createTree(values: [5, 4, 8, 11, 13, 4, 7, 2, nil, nil, 1])
solution.hasPathSum(root, 22)

print("Done!")

//: [Next](@next)
