//: [Previous](@previous)
/*
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-common-prefix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

/*
 ["flower", "flow", "flight"]
      \       /        |
       \     /         |
        flow           |
          \           /
           \         /
            \       /
               fl
*/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        
        var prefix = strs.first!
        let count = strs.count
        for i in 1 ..< count {
            let s = strs[i]
            prefix = longestPrefix(str1: prefix, str2: s)
            if prefix.isEmpty {
                break
            }
        }
        
        return prefix
    }
    
    func longestPrefix(str1: String, str2: String) -> String {
        let length1 = str1.count
        let length2 = str2.count
        let length = min(length1, length2)
        var i = 0

        while i < length && (str1[.init(utf16Offset: i, in: str1)] == str2[.init(utf16Offset: i, in: str2)]) {
            i += 1
        }
        
        return String(str1.prefix(i))
    }
}

let solution = Solution()
assert(solution.longestCommonPrefix(["flower", "flow", "flight"]) == "fl")
assert(solution.longestCommonPrefix(["dog", "racecar", "car"]) == "")

print("Done!")

//: [Next](@next)
