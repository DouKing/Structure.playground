//: [Previous](@previous)
/**
给你一棵所有节点为非负值的二叉搜索树，请你计算树中任意两节点的差的绝对值的最小值。

示例：

输入：

	1
	 \
	  3
	 /
	2

输出：
1

解释：
最小绝对差为 1，其中 2 和 1 的差的绝对值为 1（或者 2 和 3）。


提示：

树中至少有 2 个节点。
本题与 783 https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes/ 相同


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func getMinimumDifference(_ root: TreeNode?) -> Int {
		guard let root = root else {
			return 0
		}

		var stack: [TreeNode] = []
		var curr: TreeNode? = root
		var pre = -1
		var ans = Int.max
		while curr != nil || !stack.isEmpty {
			if let node = curr {
				stack.append(node)
				curr = node.left
			} else {
				let node = stack.removeLast()
				if pre != -1 {
					ans = min(ans, node.val - pre)
				}
				pre = node.val
				curr = node.right
			}
		}

		return ans
	}
}

let root = Tree.createTree(values: [4, 2, 6, 1, 3, 5, 7])!
print(root)

Solution().getMinimumDifference(root)

print("Done!")
//: [Next](@next)
