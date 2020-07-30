//: [Previous](@previous)
/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 示例 1:
 
 输入: 123
 输出: 321
   示例 2:
 
 输入: -123
 输出: -321
 示例 3:
 
 输入: 120
 输出: 21
 注意:
 
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

/*
 正数
 最大值 2147483647
       2147483650   倒数第二位 5,溢出
       2147483648   最后一位大于 7,溢出
 
 负数
 最小值 -2147483648
       -2147483650 倒数第二位 5,溢出
       -2147483649 最后一位大于 8,溢出
 
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        var ans = 0
        var num = x
        
        let max = 214748364
        let min = -214748364
        while num != 0 {
            let tmp = num % 10
            
            if ans > max || (ans == max && tmp > 7) {
                return 0
            }
            
            if ans < min || (ans == min && tmp < -8) {
                return 0
            }
            
            ans = ans * 10 + tmp
            num /= 10
        }
        
        return ans
    }
}

let solution = Solution()
print(solution.reverse(123))
print(solution.reverse(-123))
print(solution.reverse(120))
print(solution.reverse(7463847412))
print(solution.reverse(-8463847412))

print(solution.reverse(7463847422))
print(solution.reverse(-9463847412))

//: [Next](@next)
