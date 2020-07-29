//: [Previous](@previous)
/*
 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。
 
 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。
 
 示例1:
 
 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 示例 2:
 
 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 示例 3:
 
 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 示例 4:
 
 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-pattern
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let num = pattern.count
        let contents = str.components(separatedBy: " ")
        if contents.count != num { return false }
        
        var dic: [String.Element: String] = [:]
        
        var i = 0
        for s in pattern {
            let value = dic[s]
            let content = contents[i]
            
            if let value = value {
                if content != value {
                    return false
                }
            } else {
                if dic.values.contains(content) {
                    return false
                }
                dic[s] = content
            }
            
            i += 1
        }
        
        return true
    }
}

let solution = Solution()

solution.wordPattern("abba", "cat dog dog cat")
solution.wordPattern("abba", "cat cat dog cat")
solution.wordPattern("abba", "cat dog dog dog")
solution.wordPattern("abba", "dog dog dog dog")
solution.wordPattern("aaaa", "cat cat dog cat")

//: [Next](@next)
