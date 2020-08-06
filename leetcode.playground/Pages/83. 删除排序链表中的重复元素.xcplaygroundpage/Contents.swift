//: [Previous](@previous)
/*
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        while let node = current, let next = node.next {
            if node.val == next.val {
                node.next = next.next
            } else {
                current = next
            }
        }
        return head
    }
}

let head = List.create([1, 1, 2, 3, 3])
print(head!)

let solution = Solution()
print(solution.deleteDuplicates(head)!)


print("Done!")
//: [Next](@next)
