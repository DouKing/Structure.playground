//: [Previous](@previous)
/**
 给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。
 
 示例 1:
 
        输入: [3, 2, 1]

        输出: 1

        解释: 第三大的数是 1.
 
 示例 2:
 
         输入: [1, 2]
         
         输出: 2
         
         解释: 第三大的数不存在, 所以返回最大的数 2 .
 
 示例 3:
 
         输入: [2, 2, 3, 1]
         
         输出: 1
         
         解释: 注意，要求返回第三大的数，是指第三大且唯一出现的数。
         存在两个值为2的数，它们都排第二。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/third-maximum-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        let count = nums.count
        
        if count == 1 {
            return nums[0]
        }
        if count == 2 {
            return nums[0] > nums[1] ? nums[0] : nums[1]
        }
        
        var first: Int? = nil
        var second: Int? = nil
        var third: Int? = nil
        
        for i in 0 ..< count {
            let n = nums[i]
            guard let firstNum = first else {
                first = n
                continue
            }
            if n > firstNum {
                first = n
                third = second
                second = firstNum
                continue
            }
            if n == firstNum {
                continue
            }
            
            guard let secondNum = second else {
                second = n
                continue
            }
            if n > secondNum {
                second = n
                third = secondNum
                continue
            }
            if n == secondNum {
                continue
            }
            
            guard let thirdNum = third else {
                third = n
                continue
            }
            if n > thirdNum {
                third = n
            }
        }
        return third != nil ? third! : first!
    }
}

let solution = Solution()
assert(solution.thirdMax([2]) == 2)
assert(solution.thirdMax([1, 2]) == 2)
assert(solution.thirdMax([3, 2, 1]) == 1)
assert(solution.thirdMax([3, 2, 2]) == 3)
assert(solution.thirdMax([3, 2, 3]) == 3)
assert(solution.thirdMax([3, 2, 2, 2]) == 3)
assert(solution.thirdMax([2, 2, 3, 1]) == 1)
assert(solution.thirdMax([3, 2, 2, 2, 1]) == 1)

print("Done!")
//: [Next](@next)
