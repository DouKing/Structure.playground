//: [Previous](@previous)
/*
 实现 strStr() 函数。
 
 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
 
 示例 1:
 
 输入: haystack = "hello", needle = "ll"
 输出: 2
 示例 2:
 
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 说明:
 
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-strstr
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        
        let haystackLength = haystack.count
        let needleLength = needle.count
        let distance = haystackLength - needleLength
        
        guard distance >= 0 else {
            return -1
        }
        
        let range = 0 ... distance
        for i in range {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(startIndex, offsetBy: needleLength)
            let subStr = haystack[startIndex ..< endIndex]
            if subStr == needle {
                return i
            }
        }
        
        return -1
    }
}

let solution = Solution()
assert(solution.strStr("hello", "ll") == 2)
assert(solution.strStr("hello", "l") == 2)
assert(solution.strStr("hello", "lo") == 3)
assert(solution.strStr("hello", "o") == 4)
assert(solution.strStr("hello", "h") == 0)
assert(solution.strStr("hello", "hello") == 0)
assert(solution.strStr("hello", "") == 0)
assert(solution.strStr("hello", " ") == -1)
assert(solution.strStr("hello", "aa") == -1)
assert(solution.strStr("hello", "abcdef") == -1)

print("Done!")
//: [Next](@next)
