//: [Previous](@previous)
/**
 给定一个二叉树，它的每个结点都存放一个 0-9 的数字，每条从根到叶子节点的路径都代表一个数字。
 
 例如，从根到叶子节点路径 1->2->3 代表数字 123。
 
 计算从根到叶子节点生成的所有数字之和。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例 1:
 
 输入: [1,2,3]
 
       1
      / \
     2   3
 
 输出: 25
 解释:
 从根到叶子节点路径 1->2 代表数字 12.
 从根到叶子节点路径 1->3 代表数字 13.
 因此，数字总和 = 12 + 13 = 25.
 
 示例 2:
 
 输入: [4,9,0,5,1]
 
          4
         / \
        9   0
       / \
      5   1
 
 输出: 1026
 解释:
 从根到叶子节点路径 4->9->5 代表数字 495.
 从根到叶子节点路径 4->9->1 代表数字 491.
 从根到叶子节点路径 4->0 代表数字 40.
 因此，数字总和 = 495 + 491 + 40 = 1026.
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sum-root-to-leaf-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var paths: [Int] = []
        var ans = 0
        dfs(root, paths: &paths, ans: &ans)
        return ans
    }
    
    func dfs(_ root: TreeNode?, paths: inout [Int], ans: inout Int) {
        guard let root = root else { return }
        paths.append(root.val)
        
        if root.left == nil, root.right == nil {
            let total = paths.reduce(0) { (result, value) -> Int in
                return result * 10 + value
            }
            ans += total
        }
        
        dfs(root.left, paths: &paths, ans: &ans)
        dfs(root.right, paths: &paths, ans: &ans)
        paths.removeLast()
    }
}

let solution = Solution()

let root1 = Tree.createTree(values: [1, 2, 3])
assert(solution.sumNumbers(root1) == 25)

let root2 = Tree.createTree(values: [4, 9, 0, 5, 1])
assert(solution.sumNumbers(root2) == 1026)

let root3 = Tree.createTree(values: [1])
assert(solution.sumNumbers(root3) == 1)

let root4 = Tree.createTree(values: [])
assert(solution.sumNumbers(root4) == 0)


print("Done!")
//: [Next](@next)
