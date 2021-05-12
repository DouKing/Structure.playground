//: [Previous](@previous)
/**
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
 
   
 
 示例 1：
 
     输入：head = [1,3,2]
     输出：[2,3,1]
   
 
 限制：

     0 <= 链表长度 <= 10000
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var size = 0
        var root = head
        while let node = root {
            size += 1
            root = node.next
        }
        var result = Array<Int>(repeating: 0, count: size)
        
        root = head
        while let node = root {
            result[size - 1] = node.val
            size -= 1
            root = node.next
        }
        
        return result
    }
//    func reversePrint(_ head: ListNode?) -> [Int] {
//        var stack: [Int] = []
//        var root = head
//        while let node = root {
//            stack.append(node.val)
//            root = node.next
//        }
//        var result: [Int] = []
//        while !stack.isEmpty {
//            result.append(stack.removeLast())
//        }
//        return result
//    }
}

let solution = Solution()
solution.reversePrint(List.create([1,3,2]))

print("Done!")
//: [Next](@next)
