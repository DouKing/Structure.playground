//: [Previous](@previous)
/**
 给出一个完全二叉树，求出该树的节点个数。
 
 说明：
 
 完全二叉树的定义如下：在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。
 
 示例:
 
 输入:
     
         1
        / \
       2   3
      / \  /
     4  5 6
 
 输出: 6
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-complete-tree-nodes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftLevel = countLevel(root.left)
        let rightLevel = countLevel(root.right)
        if leftLevel == rightLevel {
            //说明左子树是满二叉树
            //左子树节点个数+root 正好是 2^leftLevel, 即 1<<leftLevel
            //再加右子树节点个数
            return countNodes(root.right) + (1 << leftLevel)
        } else {
            //此时倒数第二层是满二叉树
            //右子树节点个数+root 正好是 2^rightLevel, 即 1<<rightLevel 个
            //再加左子树节点个数
            return countNodes(root.left) + (1 << rightLevel)
        }
    }
    
    func countLevel(_ root: TreeNode?) -> Int {
        var level = 0
        var curr = root
        while let node = curr {
            curr = node.left
            level += 1
        }
        return level
    }
}

let solution = Solution()
let root = Tree.createTree(values: [1,2,3,4,5,6])
solution.countNodes(root)

print("Done!")
//: [Next](@next)
