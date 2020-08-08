//: [Previous](@previous)
/**
 设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。
 
 你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。
 
 示例:
 
 int k = 3;
 int[] arr = [4,5,8,2];
 KthLargest kthLargest = new KthLargest(3, arr);
 kthLargest.add(3);   // returns 4
 kthLargest.add(5);   // returns 5
 kthLargest.add(10);  // returns 5
 kthLargest.add(9);   // returns 8
 kthLargest.add(4);   // returns 8
 说明:
 你可以假设 nums 的长度≥ k-1 且k ≥ 1。
 
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-largest-element-in-a-stream
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class KthLargest {
    var values: [Int] = []
    let k: Int
    var size: Int = 0
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for n in nums {
            add(n)
        }
    }
    
    func add(_ val: Int) -> Int {
        if size >= k {
            if val > values[0] {
                values[0] = val
                shiftDown(0)
            }
        } else {
            values.append(val)
            shiftUp(size)
            size += 1
        }
        return values[0]
    }
    
    //上滤
    private func shiftUp(_ index: Int) {
        let e = values[index]
        var i = index
        while i > 0 {
            let parentIndex = (i - 1) >> 1
            let parent = values[parentIndex]
            if parent <= e {
                break
            }
            values[i] = parent
            i = parentIndex
        }
        values[i] = e
    }
    
    //下滤
    private func shiftDown(_ index: Int) {
        let e = values[index]
        let half = size >> 1
        var i = index
        while i < half { //必须是非叶子节点
            //左子节点下标
            var childIndex = (i << 1) + 1   //默认左节点为较小的
            var child = values[childIndex]      //默认取左边
            
            //右子节点下标
            let rightIndex = childIndex + 1
            if rightIndex < size && values[rightIndex] < child {
                child = values[rightIndex] //较小的子节点
                childIndex = rightIndex
            }
            
            if child >= e {
                break
            }
            values[i] = child
            i = childIndex
        }
        values[i] = e
    }
}

let kthLargest = KthLargest(3, [4, 5, 8, 2])
assert(kthLargest.add(3) == 4)
assert(kthLargest.add(5) == 5)
assert(kthLargest.add(10) == 5)
assert(kthLargest.add(9) == 8)
assert(kthLargest.add(4) == 8)

let kthLargest2 = KthLargest(5, [4, 5, 8, 2])
assert(kthLargest2.add(3) == 2)
assert(kthLargest2.add(5) == 3)
assert(kthLargest2.add(10) == 4)
assert(kthLargest2.add(9) == 5)
assert(kthLargest2.add(4) == 5)

print("Done!")
//: [Next](@next)
