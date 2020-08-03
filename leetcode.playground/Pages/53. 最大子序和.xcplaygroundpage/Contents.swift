//: [Previous](@previous)
/*
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

/*
 1.我们可以遍历整个数组, 求得所有子序和并比较, 当前子序为 sum, 结果为 ans
 2.我们可以把当前元素看作子序的最后一个元素, 那么 sum 即为该子序前面元素的和
 3.如果 sum > 0, 说明对该子序有增益效果, 应保留 sum 值并加上当前元素
 4.如果 sum <= 0, 说明该子序已达到最长长度, 当前元素应为新子序的起始元素, 应重置 sum 为当前元素
 5.新子序开始前, 比较 sum 和 ans, 取得最大值
 6.最后返回 ans
 7.时间复杂度 O(n)
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count < 1 {
            return 0
        }
        var ans = nums[0]
        var sum = 0
        
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            ans = max(ans, sum)
        }
        
        return ans
    }
}

let solution = Solution()
assert(solution.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6)

print("Done!")
//: [Next](@next)
