//: [Previous](@previous)
/**
 给定一个非空且只包含非负数的整数数组 nums，数组的度的定义是指数组里任一元素出现频数的最大值。
 
 你的任务是在 nums 中找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。
 
   
 
 示例 1：
 
     输入：[1, 2, 2, 3, 1]
     输出：2
     解释：
     输入数组的度是2，因为元素1和2的出现频数最大，均为2.
     连续子数组里面拥有相同度的有如下所示:
     [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
     最短连续子数组[2, 2]的长度为2，所以返回2.
 
 示例 2：
 
     输入：[1,2,2,3,1,4,2]
     输出：6
   
 
 提示：
 
     nums.length 在1到 50,000 区间范围内。
     nums[i] 是一个在 0 到 49,999 范围内的整数。
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/degree-of-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    //要求最短，则必然是：出现次数最多的数，以其开头，以其结尾
    //可能有多个次数最多的数，所以需要多个取最小值
    func findShortestSubArray(_ nums: [Int]) -> Int {
        typealias Value = (Int, Int, Int) //次数，起始位置，结束位置
        guard nums.count > 0 else {
            return 0
        }
        var map: [Int: Value] = [:]
        
        for i in 0 ..< nums.count {
            let num = nums[i]
            if var value = map[num] {
                value.0 += 1
                value.2 = i
                map[num] = value
            } else {
                map[num] = (1, i, i)
            }
        }
        
        var maxCount = 0
        var minLen = 0
        for (_, value) in map {
            let count = value.0
            if count > maxCount {
                maxCount = count
                minLen = value.2 - value.1 + 1
            } else if count == maxCount {
                minLen = min(minLen, value.2 - value.1 + 1)
            }
        }
        
        return minLen
    }
}

let solution = Solution()
assert(solution.findShortestSubArray([1, 2, 2, 3, 1]) == 2)
assert(solution.findShortestSubArray([1,2,2,3,1,4,2]) == 6)

print("Done!")
//: [Next](@next)
