//: [Previous](@previous)
/**
根据一棵树的中序遍历与后序遍历构造二叉树。

注意:
你可以假设树中没有重复的元素。

例如，给出

中序遍历 inorder = [9,3,15,20,7]
后序遍历 postorder = [9,15,7,20,3]
返回如下的二叉树：

	 3
	/ \
   9  20
	 /  \
	15   7

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
		guard inorder.count > 0 else {
			return nil
		}
		guard inorder.count > 1 else {
			return TreeNode(inorder[0])
		}

		let rootVal = postorder.last!
		let root = TreeNode(rootVal)

		let rootIdx = inorder.firstIndex(of: rootVal)!
		let leftInorder = inorder.prefix(upTo: rootIdx)
		let rightInorder = inorder.suffix(from: rootIdx + 1)

		let rightPostorder = postorder.dropLast().suffix(rightInorder.count)
		let leftPostorder = postorder.prefix(leftInorder.count)

		root.left = buildTree(Array(leftInorder), Array(leftPostorder))
		root.right = buildTree(Array(rightInorder), Array(rightPostorder))

		return root
	}
}

let solution = Solution()
let tree = solution.buildTree([9,3,15,20,7], [9,15,7,20,3])!
print(tree)

let tree2 = solution.buildTree([9,3], [3,9])!
print(tree2)

let tree3 = solution.buildTree([9,3], [9,3])!
print(tree3)

print("Done!")
//: [Next](@next)
