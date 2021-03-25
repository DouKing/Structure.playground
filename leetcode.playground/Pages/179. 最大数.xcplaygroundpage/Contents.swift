//: [Previous](@previous)
/**
 给定一组非负整数 nums，重新排列它们每个数字的顺序（每个数字不可拆分）使之组成一个最大的整数。
 
 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。
    
 示例 1：
 
   输入：nums = [10,2]
   输出："210"
 
 示例 2：
 
   输入：nums = [3,30,34,5,9]
   输出："9534330"
 
 示例 3：
 
   输入：nums = [1]
   输出："1"
 
 示例 4：
 
   输入：nums = [10]
   输出："10"
   
 
 提示：
 
   1 <= nums.length <= 100
   0 <= nums[i] <= 109
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/largest-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
  func largestNumber(_ nums: [Int]) -> String {
    var strs = nums.map { "\($0)" }
    strs.sort { ($0 + $1) > ($1 + $0) }
    guard let str = strs.first else {
      return "0"
    }
    if str == "0" {
      return "0"
    }
    let result = strs.joined(separator: "")
    return result
  }
}

let solution = Solution()
assert(solution.largestNumber([10,2]) == "210")
assert(solution.largestNumber([3,30,34,5,9]) == "9534330")
assert(solution.largestNumber([1]) == "1")
assert(solution.largestNumber([0]) == "0")
assert(solution.largestNumber([0, 0, 0]) == "0")

print("Done!")
//: [Next](@next)
