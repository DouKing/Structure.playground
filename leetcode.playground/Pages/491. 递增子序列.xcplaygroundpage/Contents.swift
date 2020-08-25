//: [Previous](@previous)
/**
 给定一个整型数组, 你的任务是找到所有该数组的递增子序列，递增子序列的长度至少是2。
 
 示例:
 
 输入: [4, 6, 7, 7]
 输出: [[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]]
 说明:
 
 给定数组的长度不会超过15。
 数组中的整数范围是 [-100,100]。
 给定数组中可能包含重复数字，相等的数字应该被视为递增的一种情况。
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/increasing-subsequences
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    var temp = Array<Int>()
    var ans = Array<Array<Int>>()
    
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        dfs(cur: 0, last: Int.min, nums: nums)
        return ans
    }
    
    func dfs(cur: Int, last: Int, nums: [Int]) {
        if cur == nums.count {
            if temp.count >= 2 {
                ans.append(temp)
            }
            return
        }
        
        if nums[cur] >= last {
            temp.append(nums[cur])
            dfs(cur: cur + 1, last: nums[cur], nums: nums)
            temp.removeLast()
        }
        if nums[cur] != last {
            dfs(cur: cur + 1, last: last, nums: nums)
        }
    }
}

Solution().findSubsequences([4, 6, 7, 7])

Solution().findSubsequences([6, 7])

Solution().findSubsequences([6])

print("Done!")
//: [Next](@next)
