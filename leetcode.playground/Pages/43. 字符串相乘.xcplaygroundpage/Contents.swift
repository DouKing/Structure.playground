//: [Previous](@previous)
/**
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 
 示例 1:
 
 输入: num1 = "2", num2 = "3"
 输出: "6"
 示例 2:
 
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：
 
 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/multiply-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1.isEmpty || num2.isEmpty || num1 == "0" || num2 == "0" {
            return "0"
        }
        
        let m = num1.count
        let n = num2.count
        var result = Array<Int>(repeating: 0, count: m + n)
        
        var i = m - 1
        while i >= 0 {
            let first = Int(String(num1[num1.index(num1.startIndex, offsetBy: i)]))!
            var j = n - 1
            while j >= 0 {
                let second = Int(String(num2[num2.index(num2.startIndex, offsetBy: j)]))!
                result[i + j + 1] += first * second
                j -= 1
            }
            i -= 1
        }
        
        i = m + n - 1
        while i > 0 {
            let x = result[i]
            result[i - 1] += x / 10
            result[i] = x % 10
            i -= 1
        }
        
        let ans = result.suffix(from: result[0] == 0 ? 1 : 0)
        return ans.reduce("") { (result, e) -> String in
            result + "\(e)"
        }
    }
}

let solution = Solution()
assert(solution.multiply("2", "3") == "6")
assert(solution.multiply("123", "456") == "56088")
assert(solution.multiply("1234", "567") == "699678")

print("Done!")
//: [Next](@next)
