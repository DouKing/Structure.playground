//: [Previous](@previous)
/**
 给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。
 
 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 
 示例:
 
 给定的有序链表： [-10, -3, 0, 5, 9],
 
 一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：
 
           0
          / \
        -3   9
       /   /
     -10  5
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/convert-sorted-list-to-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func getMedian(left: ListNode?, right: ListNode?) -> ListNode? {
        var fast = left
        var slow = left
        while fast !== right && fast?.next !== right {
            fast = fast?.next
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
    
    func createTree(left: ListNode?, right: ListNode?) -> TreeNode? {
        guard let left = left else { return nil }
        print("left: \(left.val)\t\tright: \(right?.val ?? -999)")
        if let right = right, left === right {
            return nil
        }
        
        guard let mid = getMedian(left: left, right: right) else { return nil }
        let root = TreeNode(mid.val)
        root.left = createTree(left: left, right: mid)
        root.right = createTree(left: mid.next, right: right)
        return root
    }
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        return createTree(left: head, right: nil)
    }
}

let l1: ListNode? = nil
let l2: ListNode? = ListNode(3)
l1 !== l2


let solution = Solution()

let list = List.create([-10, -3, 0, 5, 9])

let tree = solution.sortedListToBST(list)
print(tree ?? "null")

print("Done!")
//: [Next](@next)
