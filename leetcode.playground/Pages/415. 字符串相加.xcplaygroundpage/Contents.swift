//: [Previous](@previous)
/*
 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。
 
   
 
 提示：
 
 num1 和num2 的长度都小于 5100
 num1 和num2 都只包含数字 0-9
 num1 和num2 都不包含任何前导零
 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var ans = ""
        var carry = 0
        
        let length = max(num1.count, num2.count)
        for i in 0 ..< length {
            if i < num1.count {
                let index = num1.count - i - 1
                let char = num1[num1.index(num1.startIndex, offsetBy: index)]
                carry += char.wholeNumberValue!
            }
            if i < num2.count {
                let index = num2.count - i - 1
                let char = num2[num2.index(num2.startIndex, offsetBy: index)]
                carry += char.wholeNumberValue!
            }
            
            ans += "\(carry % 10)"
            carry = carry / 10
        }
        
        if carry > 0 {
            ans += "\(carry)"
        }
        
        return String(ans.reversed())
    }
}

let solution = Solution()
assert(solution.addStrings("123", "456") == "579")
assert(solution.addStrings("888", "999") == "1887")
assert(solution.addStrings("888", "9990") == "10878")

print("Done!")
//: [Next](@next)
