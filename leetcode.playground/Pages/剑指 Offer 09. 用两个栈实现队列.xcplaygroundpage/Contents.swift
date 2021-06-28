//: [Previous](@previous)
/**
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )
 
   
 
 示例 1：
 
     输入：
     ["CQueue","appendTail","deleteHead","deleteHead"]
     [[],[3],[],[]]
     输出：[null,null,3,-1]
 
 示例 2：
 
     输入：
     ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
     [[],[],[5],[2],[],[]]
     输出：[null,-1,null,null,5,2]
 
 提示：
 
     1 <= values <= 10000
     最多会对 appendTail、deleteHead 进行 10000 次调用
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class CQueue {
    var stack1: [Int] = []
    var stack2: [Int] = []
    
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        stack1.append(value)
    }
    
    func deleteHead() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
        }
        
        if stack2.isEmpty {
            return -1
        }
        return stack2.removeLast()
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */

let queue = CQueue()
queue.appendTail(3)
queue.deleteHead()
queue.deleteHead()

print("Done!")

//: [Next](@next)
