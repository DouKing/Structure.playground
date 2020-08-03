//: [Previous](@previous)
/*给你两个二进制字符串，返回它们的和（用二进制表示）。
 
 输入为 非空 字符串且只包含数字 1 和 0。
 
   
 
 示例 1:
 
 输入: a = "11", b = "1"
 输出: "100"
 示例 2:
 
 输入: a = "1010", b = "1011"
 输出: "10101"
   
 
 提示：
 
 每个字符串仅由字符 '0' 或 '1' 组成。
 1 <= a.length, b.length <= 10^4
 字符串如果不是 "0" ，就都不含前导零。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-binary
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var ans = ""
        var carry = 0
        let length = max(a.count, b.count)
        for i in 0 ..< length {
            if i < a.count {
                let index = a.count - i - 1
                let char = a[a.index(a.startIndex, offsetBy: index)]
                carry += char.wholeNumberValue!
            }
            if i < b.count {
                let index = b.count - i - 1
                let char = b[b.index(b.startIndex, offsetBy: index)]
                carry += char.wholeNumberValue!
            }
            
            ans += "\(carry % 2)"
            carry = carry >> 1
        }
        
        if carry > 0 {
            ans += "1"
        }
        
        return String(ans.reversed())
    }
}

let solution = Solution()
assert(solution.addBinary("11", "1") == "100")
assert(solution.addBinary("1010", "1011") == "10101")
assert(solution.addBinary("0", "0") == "0")

print("Done!")
//: [Next](@next)
