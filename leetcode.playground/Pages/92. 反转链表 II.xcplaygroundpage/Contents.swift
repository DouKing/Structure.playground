//: [Previous](@previous)
/**
反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

说明:
1 ≤ m ≤ n ≤ 链表长度。

示例:

输入: 1->2->3->4->5->NULL, m = 2, n = 4
输出: 1->4->3->2->5->NULL

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
		guard let head = head else { return nil }

		var cur: ListNode? = head
		var prev: ListNode? = nil

		var left = m
		var right = n
		while left > 1 {
			prev = cur
			cur = cur?.next
			left -= 1
			right -= 1
		}

		let con = prev
		let tail = cur

		var third: ListNode? = nil
		while right > 0 {
			right -= 1

			third = cur?.next
			cur?.next = prev
			prev = cur
			cur = third
		}

		var root: ListNode? = head
		if let con = con {
			con.next = prev
		} else {
			root = prev
		}
		tail?.next = cur

		return root
	}
}

let solution = Solution()
let head = List.create([1, 2, 3, 4, 5])

solution.reverseBetween(head, 2, 4)

print("Done!")
//: [Next](@next)
