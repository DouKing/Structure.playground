//: [Previous](@previous)
/*
 给定两个二叉树，编写一个函数来检验它们是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

 示例 1:

 输入:
  1         1
 / \       / \
2   3     2   3

 [1,2,3],   [1,2,3]

 输出: true
 示例 2:

 输入:
   1          1
  /            \
 2              2

 [1,2],     [1,null,2]

 输出: false
 示例 3:

 输入:
   1         1
  / \       / \
 2   1     1   2

 [1,2,1],   [1,1,2]

 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/same-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if let p = p, let q = q { //都不为空
            return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
        } else if let _ = p { // p 不为空
            return false
        } else if let _ = q { // q 不为空
            return false
        } else { //都为空
            return true
        }
    }
}

let solution = Solution()
assert(solution.isSameTree(Tree.createTree(values: [1, 2, 3]),
                           Tree.createTree(values: [1, 2, 3])))

assert(!solution.isSameTree(Tree.createTree(values: [1, 2]),
                           Tree.createTree(values: [1, nil, 2])))


print("Done!")
//: [Next](@next)
