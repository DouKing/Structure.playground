//: [Previous](@previous)
/**
给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。

请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。

示例 1:

输入: 1->2->3->4->5->NULL
输出: 1->3->5->2->4->NULL
示例 2:

输入: 2->1->3->5->6->4->7->NULL
输出: 2->3->6->7->1->5->4->NULL
说明:

应当保持奇数节点和偶数节点的相对顺序。
链表的第一个节点视为奇数节点，第二个节点视为偶数节点，以此类推。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/odd-even-linked-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func oddEvenList(_ head: ListNode?) -> ListNode? {
		guard let head = head else { return nil }
		let evenHead = head.next
		var odd: ListNode? = head, even = evenHead
		while let eNode = even, let eNext = eNode.next {
			odd?.next = eNext
			odd = eNext
			eNode.next = eNext.next
			even = eNext.next
		}
		odd?.next = evenHead
		return head
	}
}

let solution = Solution()

solution.oddEvenList(List.create([1,2,3,4,5]))
solution.oddEvenList(List.create([2,1,3,5,6,4,7]))

print("Done!")
//: [Next](@next)
