//: [Previous](@previous)
/**
 给定仅有小写字母组成的字符串数组 A，返回列表中的每个字符串中都显示的全部字符（包括重复字符）组成的列表。例如，如果一个字符在每个字符串中出现 3 次，但不是 4 次，则需要在最终答案中包含该字符 3 次。
 
 你可以按任意顺序返回答案。
 
   
 
 示例 1：
 
 输入：["bella","label","roller"]
 输出：["e","l","l"]
 示例 2：
 
 输入：["cool","lock","cook"]
 输出：["c","o"]
   
 
 提示：
 
 1 <= A.length <= 100
 1 <= A[i].length <= 100
 A[i][j] 是小写字母
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-common-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func commonChars(_ A: [String]) -> [String] {
        guard !A.isEmpty else {
            return []
        }
        var minFreq: [Int] = Array(repeating: Int.max, count: 26)
        let base = ("a" as Character).asciiValue!
        
        for word in A {
            var freq: [Int] = Array(repeating: 0, count: 26)
            for char in word {
                let index = Int(char.asciiValue! - base)
                freq[index] += 1
            }
            
            for i in 0 ..< 26 {
                minFreq[i] = min(minFreq[i], freq[i])
            }
        }
        
        var ans: [String] = []
        for i in 0 ..< 26 {
            let count = minFreq[i]
            if count < 1 { continue }
            let ascii = UInt8(i) + base
            let char = Character(UnicodeScalar(ascii))
            for _ in 0 ..< count {
                ans.append(String(char))
            }
        }
        
        return ans
    }
}

let solution = Solution()
solution.commonChars(["bella","label","roller"])
solution.commonChars(["cool","lock","cook"])
solution.commonChars(["cool"])

print("Done!")
//: [Next](@next)
