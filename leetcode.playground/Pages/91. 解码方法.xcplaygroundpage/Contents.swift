//: [Previous](@previous)
/**
 一条包含字母 A-Z 的消息通过以下映射进行了 编码 ：
 
     'A' -> 1
     'B' -> 2
     ...
     'Z' -> 26
 
 要 解码 已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为：
 
     "AAJF" ，将消息分组为 (1 1 10 6)
     "KJF" ，将消息分组为 (11 10 6)
 
 注意，消息不能分组为  (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。
 
 给你一个只含数字的 非空 字符串 s ，请计算并返回 解码 方法的 总数 。
 
 题目数据保证答案肯定是一个 32 位 的整数。
 
   
 
 示例 1：
     
     输入：s = "12"
     输出：2
     解释：它可以解码为 "AB"（1 2）或者 "L"（12）。
 
 示例 2：
 
     输入：s = "226"
     输出：3
     解释：它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
 
 示例 3：
 
     输入：s = "0"
     输出：0
     解释：没有字符映射到以 0 开头的数字。
     含有 0 的有效映射是 'J' -> "10" 和 'T'-> "20" 。
     由于没有字符，因此没有有效的方法对此进行解码，因为所有数字都需要映射。
 
 示例 4：
 
     输入：s = "06"
     输出：0
     解释："06" 不能映射到 "F" ，因为字符串含有前导 0（"6" 和 "06" 在映射中并不等价）。
   
 
 提示：
 
     1 <= s.length <= 100
     s 只包含数字，并且可能包含前导零。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/decode-ways
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

/*:
 ### dp[i] 为 str[0...i] 的总数
 
 1. 若 str[i] 为 0，那么如果 str[i-1] 是 '1' 或 '2'，dp[i] == dp[i-2]，因为 str[i-1]+str[i] 不能分开
 2. 若 str[i-1] 为 1，那么 dp[i] = dp[i-1] + dp[i-2]
    - str[i] str[i-1] 分开则是 dp[i-1]，合并则是 dp[i-2]
 3. 若 str[i-1] 为 2，且 1 <= str[i] <= 6，同上
 
 > 所以，dp[i] 仅与前两项有关
 */
class Solution {
    func numDecodings(_ s: String) -> Int {
        let length = s.count
        guard length > 0 else {
            return 0
        }
        let str: [Character] = s.suffix(length)
        if str[0] == "0" {
            return 0
        }
        
        var pre = 1, curr = 1
        for i in 1 ..< length {
            let tmp = curr
            if str[i] == "0" {
                if str[i - 1] == "1" || str[i - 1] == "2" {
                    curr = pre
                } else {
                    return 0
                }
            } else if str[i - 1] == "1" || (str[i - 1] == "2" && str[i] >= "1" && str[i] <= "6") {
                curr = curr + pre
            }
            pre = tmp
        }
        return curr
    }
}

let solution = Solution()
solution.numDecodings("12")
solution.numDecodings("226")
solution.numDecodings("0")
solution.numDecodings("06")

print("Done!")
//: [Next](@next)
