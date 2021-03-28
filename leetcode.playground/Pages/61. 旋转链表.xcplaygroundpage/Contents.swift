//: [Previous](@previous)
/**
 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。
 
   
 
 示例 1：
 
 
     输入：head = [1,2,3,4,5], k = 2
     输出：[4,5,1,2,3]
 
 示例 2：
 
 
     输入：head = [0,1,2], k = 4
     输出：[2,0,1]
   
 
 提示：
 
     链表中节点的数目在范围 [0, 500] 内
     -100 <= Node.val <= 100
     0 <= k <= 2 * 109
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
  func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let headNode = head, let _ = headNode.next, k > 0 else { return head }
    
    var iter: ListNode? = headNode
    var n = 1 //节点个数
    while let node = iter?.next {
      iter = node
      n += 1
    }
    
    var add = n - k % n
    if add == n {
      return headNode
    }
    
    iter?.next = headNode
    
    while add > 0 {
      iter = iter?.next
      add -= 1
    }
    let ret = iter?.next
    iter?.next = nil
    return ret
  }
}

let solution = Solution()
solution.rotateRight(List.create([1,2,3,4,5]), 2)
solution.rotateRight(List.create([0,1,2]), 4)

print("Done!")
//: [Next](@next)
