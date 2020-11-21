//: [Previous](@previous)
/**
 给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
 
 进阶：
 
 你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
   
 
 示例 1：
 
 
 输入：head = [4,2,1,3]
 输出：[1,2,3,4]
 示例 2：
 
 
 输入：head = [-1,5,3,4,0]
 输出：[-1,0,3,4,5]
 示例 3：
 
 输入：head = []
 输出：[]
   
 
 提示：
 
 链表中节点的数目在范围 [0, 5 * 104] 内
 -105 <= Node.val <= 105
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        //计算链表长度
        var length = 0
        var curr: ListNode? = head
        while let node = curr {
            length += 1
            curr = node.next
        }
        
        let dummyNode = ListNode(0, head)
        var subLength = 1
        //自底向上合并
        while subLength < length {
            var pre = dummyNode, curr = dummyNode.next
            while let node = curr {
                let head1 = node
                
                //找head2
                var i = 1
                while i < subLength && curr?.next != nil {
                    curr = curr?.next
                    i += 1
                }
                let head2 = curr?.next
                
                //断掉heade1 next链接
                curr?.next = nil
                curr = head2
                
                //找head2尾部,断掉链接
                i = 1
                while i < subLength && curr != nil && curr?.next != nil {
                    curr = curr?.next
                    i += 1
                }
                var next: ListNode? = nil
                if let node = curr?.next {
                    next = node
                    curr?.next = nil
                }
                
                //合并
                let mergedNode = merge(head1, head2)
                pre.next = mergedNode
                while let node = pre.next {
                    pre = node
                }
                
                curr = next
            }
            
            subLength = subLength << 1
        }
        
        return dummyNode.next
    }
    
    //合并两个有序链表
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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

let soluion = Solution()

soluion.sortList(List.create([4,2,1,3]))
soluion.sortList(List.create([-1,5,3,4,0]))
soluion.sortList(List.create([]))

print("Done!")
//: [Next](@next)
