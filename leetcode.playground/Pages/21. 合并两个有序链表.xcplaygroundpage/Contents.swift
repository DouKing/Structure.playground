//: [Previous](@previous)

/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
   
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let phead = ListNode(-1)
        
        var prev: ListNode? = phead
        var currentL1: ListNode? = l1
        var currentL2: ListNode? = l2
        
        while let node1 = currentL1, let node2 = currentL2 {
            if node1.val < node2.val {
                prev?.next = node1
                currentL1 = node1.next
            } else {
                prev?.next = node2
                currentL2 = node2.next
            }
            prev = prev?.next
        }
        
        if let node1 = currentL1 {
            prev?.next = node1
        } else {
            prev?.next = currentL2
        }
        
        return phead.next
    }
}

let l1 = List.create([1, 2, 4])
let l2 = List.create([1, 3, 4])

let solution = Solution()
let l3 = solution.mergeTwoLists(l1, l2)

print("Done!")
//: [Next](@next)
