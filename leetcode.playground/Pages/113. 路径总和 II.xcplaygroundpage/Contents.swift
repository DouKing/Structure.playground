//: [Previous](@previous)
/**
 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 给定如下二叉树，以及目标和 sum = 22，
 
           5
          / \
         4   8
        /   / \
       11  13  4
      /  \    / \
     7    2  5   1
 返回:
 
     [
         [5,4,11,2],
         [5,8,4,5]
     ]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-sum-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var values: [Int] = []
        var result: [[Int]] = []
        dfs(root, sum: sum, values: &values, result: &result)
        return result
    }
    
    func dfs(_ root: TreeNode?, sum: Int, values: inout [Int], result: inout [[Int]]) {
        guard let root = root else { return }
        values.append(root.val)
        
        if root.left == nil && root.right == nil {
            let total = values.reduce(0) { (x, y) -> Int in
                return x + y
            }
            if total == sum {
                result.append(values)
            }
        }
        
        dfs(root.left, sum: sum, values: &values, result: &result)
        dfs(root.right, sum: sum, values: &values, result: &result)
        values.removeLast()
    }
}

let solution = Solution()

let root = Tree.createTree(values: [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, nil, 5, 1])
print(root!)
solution.pathSum(root, 22)

print("Done!")
//: [Next](@next)
