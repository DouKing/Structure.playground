//: [Previous](@previous)
/**
 给定一个非负整数 c ，你要判断是否存在两个整数 a 和 b，使得 a2 + b2 = c 。
 
   
 
 示例 1：
 
     输入：c = 5
     输出：true
     解释：1 * 1 + 2 * 2 = 5
 
 示例 2：
 
     输入：c = 3
     输出：false
 
 示例 3：
 
     输入：c = 4
     输出：true
 
 示例 4：
 
     输入：c = 2
     输出：true
 
 示例 5：
 
     输入：c = 1
     输出：true
   
 
 提示：
 
        0 <= c <= 2^31 - 1
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sum-of-square-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var left = 0
        var right = Int(sqrt(Double(c)))
        while left <= right {
            let value = left * left + right * right
            if value == c {
                return true
            } else if value < c {
                left += 1
            } else {
                right -= 1
            }
        }
        return false
    }
}

let solution = Solution()
assert(solution.judgeSquareSum(5))
assert(!solution.judgeSquareSum(3))
assert(solution.judgeSquareSum(2))
assert(solution.judgeSquareSum(4))
assert(solution.judgeSquareSum(1))

print("Done!")
//: [Next](@next)
