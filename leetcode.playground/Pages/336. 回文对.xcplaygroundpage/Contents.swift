//: [Previous](@previous)
/*
 给定一组 互不相同 的单词， 找出所有不同 的索引对(i, j)，使得列表中的两个单词， words[i] + words[j] ，可拼接成回文串。
 
   
 
 示例 1：
 
 输入：["abcd","dcba","lls","s","sssll"]
 输出：[[0,1],[1,0],[3,2],[2,4]]
 解释：可拼接成的回文串为 ["dcbaabcd","abcddcba","slls","llssssll"]
 示例 2：
 
 输入：["bat","tab","cat"]
 输出：[[0,1],[1,0]]
 解释：可拼接成的回文串为 ["battab","tabbat"]
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func palindromePairs(_ words: [String]) -> [[Int]] {
        let n = words.count
        var indices: [String: Int] = [:]
        for i in 0 ..< n {
            indices[String(words[i].reversed())] = i
        }
        
        var ret: [[Int]] = []
        for i in 0 ..< n {
            let word = words[i]
            if word.isEmpty { continue }
            let m = word.count
            for j in 0 ... m {
                //如果后缀是回文
                if isPalindrome(content: word, left: j, right: m - 1) {
                    let sub = subString(from: 0, to: j, in: word)
                    if let leftId = indices[sub], leftId != i {
                        ret.append([i, leftId])
                    }
                }
                
                //如果前缀是回文
                // j == 0 前缀空串为回文的情况和后缀空串为回文的情况是同一种情况, 上面的 if 已包含该情况
                if j != 0 && isPalindrome(content: word, left: 0, right: j - 1) {
                    let sub = subString(from: j, to: m, in: word)
                    if let rightId = indices[sub], rightId != i {
                        ret.append([rightId, i])
                    }
                }
            }
        }
        
        return ret
    }
    
    func character(at index: Int, in str: String) -> Character {
        str[str.index(str.startIndex, offsetBy: index)]
    }
    
    func subString(from: Int, to: Int, in str: String) -> String {
        String(str[str.index(str.startIndex, offsetBy: from) ..< str.index(str.startIndex, offsetBy: to)])
    }
    
    //判断是否包含回文
    func isPalindrome(content: String, left: Int, right: Int) -> Bool {
        let length = right - left + 1
        for i in 0 ..< (length >> 1) {
            let c1 = character(at: i + left, in: content)
            let c2 = character(at: right - i, in: content)
            if c1 != c2 {
                return false
            }
        }
        return true
    }
    
}

let solution = Solution()

print(solution.palindromePairs(["abcd","dcba","lls","s","sssll"]))
print(solution.palindromePairs(["bat","tab","cat"]))

print("Done!")
//: [Next](@next)
