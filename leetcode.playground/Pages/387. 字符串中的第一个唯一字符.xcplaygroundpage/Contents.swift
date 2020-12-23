//: [Previous](@previous)
/**
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 
   
 
 示例：
 
 s = "leetcode"
 返回 0
 
 s = "loveleetcode"
 返回 2
   
 
 提示：你可以假定该字符串只包含小写字母。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-unique-character-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let length = s.count
        guard length > 0 else { return -1 }
        let chars = s.suffix(length)
        var map: [Character: Int] = [:]
        for char in chars {
            map[char] = (map[char] ?? 0) + 1
        }
        
        var ans = -1
        for (i, char) in chars.enumerated() {
            if map[char] == 1 {
                ans = i
                break
            }
        }
        
        return ans
    }
}

let solution = Solution()
assert(solution.firstUniqChar("leetcode") == 0)
assert(solution.firstUniqChar("loveleetcode") == 2)

print("Done!")
//: [Next](@next)
