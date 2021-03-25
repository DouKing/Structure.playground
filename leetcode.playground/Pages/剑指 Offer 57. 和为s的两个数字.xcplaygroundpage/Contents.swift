//: [Previous](@previous)
/**
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。
 
   
 
 示例 1：
 
     输入：nums = [2,7,11,15], target = 9
     输出：[2,7] 或者 [7,2]
 
 示例 2：
 
     输入：nums = [10,26,30,31,47,60], target = 40
     输出：[10,30] 或者 [30,10]
     
 
 限制：
 
     1 <= nums.length <= 10^5
     1 <= nums[i] <= 10^6
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
  //双指针法
//  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var i = 0, j = nums.count - 1
//    while i < j {
//      let iVal = nums[i]
//      let jVal = nums[j]
//      if iVal + jVal == target {
//        return [iVal, jVal]
//      } else if iVal + jVal < target {
//        i += 1
//      } else {
//        j -= 1
//      }
//    }
//    return []
//  }
  
  // hash法
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else {
      return []
    }
    
    var map: [Int: Int] = [:]
    for (i, v) in nums.enumerated() {
      map[v] = i
    }
    
    for i in 0 ..< nums.count {
      let num1 = nums[i]
      let num2 = target - num1
      if map[num2] != i {
        return [num1, num2]
      }
    }
    
    return []
  }
}

let solution = Solution()
assert(solution.twoSum([2,7,11,15], 9) == [2,7])
assert(solution.twoSum([10,26,30,31,47,60], 40) == [10,30])

print("Done!")
//: [Next](@next)
