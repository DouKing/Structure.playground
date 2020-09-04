//: [Previous](@previous)
/**
给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的 绝对值 至多为 k。



示例 1:

输入: nums = [1,2,3,1], k = 3
输出: true
示例 2:

输入: nums = [1,0,1,1], k = 1
输出: true
示例 3:

输入: nums = [1,2,3,1,2,3], k = 2
输出: false

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/contains-duplicate-ii
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
		var map: [Int: Int] = [:]
		var i = 0
		while i < nums.count {
			let num = nums[i]
			if let value = map[num], abs(value - i) <= k {
				return true
			}
			map[num] = i
			i += 1
		}
		return false
	}
}

let solution = Solution()

assert(solution.containsNearbyDuplicate([1, 2, 3, 1], 3))
assert(solution.containsNearbyDuplicate([1, 0, 1, 1], 1))

print("Done!")
//: [Next](@next)
