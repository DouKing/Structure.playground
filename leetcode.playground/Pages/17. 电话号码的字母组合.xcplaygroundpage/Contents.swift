//: [Previous](@previous)
/**
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 
 
 示例:
 
 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var ans = Array<String>()
        let phoneMap: [Character: String] = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz",
        ]
        var combination: [Character] = []
        backtrack(&ans,
                  phoneMap: phoneMap,
                  digits: digits.suffix(digits.count),
                  index: 0,
                  combination: &combination)
        return ans
    }
    
    func backtrack(
        _ ans: inout [String],
        phoneMap: [Character: String],
        digits: [Character],
        index: Int,
        combination: inout [Character]
    ) {
        if index == digits.count {
            if !combination.isEmpty {
                ans.append(String(combination))
            }
        } else {
            let digit = digits[index]
            if let letters = phoneMap[digit] {
                for letter in letters {
                    combination.append(letter)
                    backtrack(&ans, phoneMap: phoneMap, digits: digits, index: index + 1, combination: &combination)
                    combination.removeLast()
                }
            }
        }
    }
}

let solution = Solution()
let ans = solution.letterCombinations("")
print(ans)


print("Done!")
//: [Next](@next)
