//: [Previous](@previous)
/**
 给你一个字符串 s ，请你去除字符串中重复的字母，使得每个字母只出现一次。需保证 返回结果的字典序最小（要求不能打乱其他字符的相对位置）。
 
 注意：该题与 1081 https://leetcode-cn.com/problems/smallest-subsequence-of-distinct-characters 相同
 
   
 
 示例 1：
 
 输入：s = "bcabc"
 输出："abc"
 示例 2：
 
 输入：s = "cbacdcbc"
 输出："acdb"
   
 
 提示：
 
 1 <= s.length <= 104
 s 由小写英文字母组成
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicate-letters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let length = s.count
        guard length > 0 else {
            return s
        }
        let chars: [Character] = s.suffix(length)
        
        var vis = Array(repeating: false, count: 26) //每个字母在栈中是否出现过
        var num = Array(repeating: 0, count: 26)     //每个字母出现的次数
        for i in 0 ..< length {
            let idx = index(chars[i])
            num[idx] = num[idx] + 1
        }
        
        var stack: [Character] = []     //定义一个栈
        for char in chars {
            let idx = index(char)
            //如果已在栈中,不能加入栈
            if !vis[idx] {
                //加入栈之前,需要判断其与栈顶元素的字典序大小
                //循环遍历栈顶元素字典序大小,如果大于该字母,将其出栈
                while !stack.isEmpty, let top = stack.last, top > char {
                    //只有栈顶元素还有剩余数量时,才能将其出栈
                    if num[index(top)] > 0 {
                        stack.removeLast()
                        vis[index(top)] = false
                    } else {
                        break
                    }
                }
                stack.append(char)
                vis[idx] = true
            }
            //更新该字母的剩余数量
            num[idx] -= 1
        }
        
        return String(stack)
    }
    
    func index(_ char: Character) -> Int {
        return Int(char.asciiValue!) - Int(("a" as Character).asciiValue!)
    }
}

let solution = Solution()
assert(solution.removeDuplicateLetters("bcabc") == "abc")
assert(solution.removeDuplicateLetters("cbacdcbc") == "acdb")

print("Done!")
//: [Next](@next)
