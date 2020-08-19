//: [Previous](@previous)
/**
 给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
 
 具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。
 
   
 
 示例 1：
 
 输入："abc"
 输出：3
 解释：三个回文子串: "a", "b", "c"
 示例 2：
 
 输入："aaa"
 输出：6
 解释：6个回文子串: "a", "a", "a", "aa", "aa", "aaa"
   
 
 提示：
 
 输入的字符串长度不会超过 1000 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindromic-substrings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func midation(_ s: [Character], left: Int, right: Int, length: Int) -> Int {
        var l = left, r = right
        var ret = 0
        while l >= 0 && r < length && s[l] == s[r] {
            l -= 1
            r += 1
            ret += 1
        }
        return ret
    }
    
    func countSubstrings(_ s: String) -> Int {
        var ans = 0
        let length = s.count
        guard length > 0 else {
            return 0
        }
        let chars: [Character] = s.suffix(length)
        for i in 0 ..< length {
            ans += midation(chars, left: i, right: i, length: length)
            ans += midation(chars, left: i, right: i + 1, length: length)
        }
        return ans
    }
}

let solution = Solution()

assert(solution.countSubstrings("abc") == 3)
assert(solution.countSubstrings("aaa") == 6)

print("Done!")
//: [Next](@next)
