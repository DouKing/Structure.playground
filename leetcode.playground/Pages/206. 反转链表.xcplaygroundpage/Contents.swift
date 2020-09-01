//: [Previous](@previous)
/**
反转一个单链表。

示例:

输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
进阶:
你可以迭代或递归地反转链表。你能否用两种方法解决这道题？



来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/reverse-linked-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func reverseList(_ head: ListNode?) -> ListNode? {
		var prev: ListNode? = nil
		var curr: ListNode? = head
		while let node = curr {
			let next = node.next
			node.next = prev
			prev = node
			curr = next
		}
		return prev
	}
}

let solution = Solution()

let head = List.create([1, 2, 3, 4, 5])
print(head!)
print(solution.reverseList(head)!)

print("Done!")
//: [Next](@next)
