//: [Previous](@previous)
/*
 给定一个二叉树，原地将它展开为一个单链表。
 
   
 
 例如，给定二叉树
 
     1
    / \
   2   5
  / \   \
 3   4   6
 
 将其展开为：
 
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

/*
 1. 当前节点(1)左子树的最右节点(4) 是点前节点(1)右子树的前驱
 2. 将当前节点(1)左子树 改为右子树
 3. 将当前节点(1)置为 当前节点的右节点(2)
 4. 重复 1~4
 */

class Solution {
    func flatten(_ root: TreeNode?) {
        var curr = root
        while let current = curr {
            if let next = current.left {
                var prev = next
                while let node = prev.right {
                    prev = node
                }
                
                prev.right = current.right
                current.left = nil
                current.right = next
            }
            curr = current.right
        }
    }
}

let root = Tree.createTree(values: [1, 2, 5, 3, 4, nil, 6])!
print(root)

let solution = Solution()
solution.flatten(root)
print(root)

print("Done!")
//: [Next](@next)
