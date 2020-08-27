//: [Previous](@previous)
/**
 删除链表中等于给定值 val 的所有节点。
 
 示例:
 
 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5

 https://leetcode-cn.com/problems/remove-linked-list-elements/
 */
import Foundation

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        //伪头
        let sentinel = ListNode(0)
        sentinel.next = head
        
        var prev: ListNode? = sentinel
        var curr = head
        
        while let node = curr {
            if node.val == val {
                prev?.next = node.next
            } else {
                prev = curr
            }
            curr = node.next
        }
        
        return sentinel.next
    }
}

let solution = Solution()

let head = List.create([1, 2, 3, 6, 4, 5, 6])
solution.removeElements(head, 6)

print("Done!")
//: [Next](@next)
