//: [Previous](@previous)
/*
 二叉搜索树中的两个节点被错误地交换。
 
 请在不改变其结构的情况下，恢复这棵树。
 
 示例 1:
 
 输入: [1,3,null,null,2]
 
       1
     /
   3
     \
       2
 
 输出: [3,1,null,null,2]
 
       3
     /
   1
     \
       2
 示例 2:
 
 输入: [3,1,4,null,null,2]
 
          3
         / \
        1   4
       /
      2
 
 输出: [2,1,4,null,null,3]
 
          2
         / \
        1   4
       /
      3
 进阶:
 
 使用 O(n) 空间复杂度的解法很容易实现。
 你能想出一个只使用常数空间的解决方案吗？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/recover-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func recoverTree(_ root: TreeNode?) {
        var p: TreeNode? = nil
        var x: TreeNode? = nil
        var y: TreeNode? = nil
        
        var node = root
        while let current = node {
            if let left = current.left {
                var pre = left
                while let n = pre.right, n.val != current.val {
                    pre = n
                }
                if let right = pre.right {
                    if right.val == current.val {
                        if let p = p, p.val > current.val {
                            y = current
                            if x == nil {
                                x = p
                            }
                        }
                        p = current
                        
                        pre.right = nil
                        node = current.right
                    }
                } else {
                    pre.right = current
                    node = current.left
                }
            } else {
                if let p = p, p.val > current.val {
                    y = current
                    if x == nil {
                        x = p
                    }
                }
                p = current
                
                node = current.right
            }
        }
        
        if let x = x, let y = y {
            let tmp = x.val
            x.val = y.val
            y.val = tmp
        }
    }
}

let root = Tree.createTree(values: [1, 3, nil, nil, 2])
print(root!)

let solution = Solution()
solution.recoverTree(root)
print(root!)

print("Done!")
//: [Next](@next)
