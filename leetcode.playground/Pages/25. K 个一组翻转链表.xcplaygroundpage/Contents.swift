//: [Previous](@previous)
/**
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 
 k 是一个正整数，它的值小于或等于链表的长度。
 
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 进阶：
 
 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
   
 
 示例 1：
 
 
     输入：head = [1,2,3,4,5], k = 2
     输出：[2,1,4,3,5]
 
 示例 2：
 
 
     输入：head = [1,2,3,4,5], k = 3
     输出：[3,2,1,4,5]
 
 示例 3：
 
     输入：head = [1,2,3,4,5], k = 1
     输出：[1,2,3,4,5]
 
 示例 4：
 
     输入：head = [1], k = 1
     输出：[1]
 
 提示：
 
     列表中节点的数量在范围 sz 内
     1 <= sz <= 5000
     0 <= Node.val <= 1000
     1 <= k <= sz
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-nodes-in-k-group
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
  func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let head = head else { return nil }
    let dummy = ListNode(0)
    dummy.next = head

    var pre: ListNode? = dummy
    var curr: ListNode? = head
    while let node = curr {
      var trail: ListNode? = pre
      for _ in 0 ..< k {
        trail = trail?.next
        guard let _ = trail else {
          return dummy.next
        }
      }
      let next = trail?.next
      let reversed = myReverse(head: node, trail: trail)
      curr = reversed.0
      trail = reversed.1
      pre?.next = curr
      trail?.next = next
      pre = trail
      curr = trail?.next
    }
    
    return dummy.next
  }
  
  private func myReverse(head: ListNode?, trail: ListNode?) -> (ListNode?, ListNode?) {
    guard let head = head else { return (nil, nil) }
    var prev: ListNode? = nil //trail.next
    var curr: ListNode? = head
    while prev !== trail {
      let temp = curr?.next
      curr?.next = prev
      prev = curr
      curr = temp
    }
    return (trail, head)
  }
}

let solution = Solution()
solution.reverseKGroup(List.create([1,2,3,4,5]), 2)
solution.reverseKGroup(List.create([1,2,3,4,5]), 3)
solution.reverseKGroup(List.create([1]), 1)

print("Done!")
//: [Next](@next)
