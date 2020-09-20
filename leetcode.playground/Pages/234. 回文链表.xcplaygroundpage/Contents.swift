//: [Previous](@previous)
/**
 请判断一个链表是否为回文链表。
 
 示例 1:
 
 输入: 1->2
 输出: false
 示例 2:
 
 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let head = head else { return true }
        let firstHalfEnd = endOfFirstHalf(head)
        //翻转后半段
        let secondHalfStart = reverseList(firstHalfEnd?.next)
        
        var result = true
        var p1: ListNode? = head
        var p2: ListNode? = secondHalfStart
        while result, let second = p2 {
            if p1!.val != second.val {
                result = false
            }
            p2 = p2?.next
            p1 = p1?.next
        }
        //复原后半段
        firstHalfEnd?.next = reverseList(secondHalfStart)
        return result
    }
    
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
    
    func endOfFirstHalf(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        while let f = fast, let n = f.next {
            slow = slow?.next
            fast = n.next
        }
        return slow
    }
}

let solution = Solution()

let head1 = List.create([1, 2, 2, 1])
assert(solution.isPalindrome(head1))
assert(!solution.isPalindrome(List.create([1, 2])))

let head2 = List.create([1])
assert(solution.isPalindrome(head2))
assert(solution.isPalindrome(List.create([1, 2, 3, 2, 1])))

print("Done!")
//: [Next](@next)
