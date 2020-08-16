//: [Previous](@previous)
/**
 给定一个链表，判断链表中是否有环。
 
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
   
 
 示例 1：
 
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 
 示例 2：
 
 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 
 
 示例 3：
 
 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。
 
 
   
 
 进阶：
 
 你能用 O(1)（即，常量）内存解决此问题吗？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/linked-list-cycle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head, let next = head.next else { return false }
        var slow = head
        var fast = next
        while fast.val != slow.val {
            if let n = slow.next, let fn = fast.next, let fnn = fn.next {
                slow = n
                fast = fnn
            } else {
                return false
            }
        }
        return true
    }
}

let solution = Solution()

let node1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(-4)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2

assert(solution.hasCycle(node1))


print("Done!")
//: [Next](@next)
