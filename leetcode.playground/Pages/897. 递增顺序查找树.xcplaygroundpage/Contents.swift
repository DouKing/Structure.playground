//: [Previous](@previous)
/**
 给你一个树，请你 按中序遍历 重新排列树，使树中最左边的结点现在是树的根，并且每个结点没有左子结点，只有一个右子结点。
 
   
 
 示例 ：
 
 输入：[5,3,6,2,4,null,8,1,null,null,null,7,9]
 
            5
           / \
          3   6
         / \   \
        2   4   8
       /       / \
      1       7   9
 
 输出：[1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
 
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
                           \
                            7
                             \
                              8
                               \
                                9
 
 提示：
 
 给定树中的结点数介于 1 和 100 之间。
 每个结点都有一个从 0 到 1000 范围内的唯一整数值。
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/increasing-order-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

//class Solution {
//    func increasingBST(_ root: TreeNode?) -> TreeNode? {
//        var values: [Int] = []
//        inorder(root, values: &values)
//        return create(with: values)
//    }
//
//    func inorder(_ root: TreeNode?, values: inout [Int]) {
//        guard let root = root else {
//            return
//        }
//        inorder(root.left, values: &values)
//        values.append(root.val)
//        inorder(root.right, values: &values)
//    }
//
//    func create(with values: [Int]?) -> TreeNode? {
//        guard let values = values, values.count > 0 else { return nil }
//        let ans = TreeNode(0)
//        var cur: TreeNode? = ans
//        for v in values {
//            cur?.right = TreeNode(v)
//            cur = cur?.right
//        }
//        return ans.right
//    }
//}

class Solution {
    var resNode: TreeNode?
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        let dummyNode = TreeNode(-1)
        resNode = dummyNode
        inorder(root)
        return dummyNode.right
    }
    
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inorder(root.left)
        resNode?.right = root
        root.left = nil
        resNode = root
        inorder(root.right)
    }
}

let solution = Solution()

let root = Tree.createTree(values: [5,3,6,2,4,nil,8,1,nil,nil,nil,nil,nil,7,9])
print(root!)
print(solution.increasingBST(root) ?? "xx")

print("Done!")
//: [Next](@next)
