//: [Previous](@previous)
/**
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 
   
 
 示例 1：
 
     输入：n = 3
     输出：["((()))","(()())","(())()","()(())","()()()"]
 
 示例 2：
 
     输入：n = 1
     输出：["()"]
   
 
 提示：
 
 1 <= n <= 8
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans: [String] = []
        var cur: String = ""
        backtrack(ans: &ans, cur: &cur, open: 0, close: 0, max: n)
        return ans
    }
    
    //递归回溯，长度为 n 的序列，就是长度为 n-1 的序列前加上 ‘(’ 或 ‘)’
    //拼接 ‘(’ 或 ‘)’ 的前提：原序列是有效的
    //有效序列：‘(’ 和 ‘)’ 的数量各占一半，先有 ‘(’，后有 ‘)’
    func backtrack(ans: inout [String], cur: inout String, open: Int, close: Int, max: Int) {
        if cur.count == max << 1 {
            ans.append(cur)
            return
        }
        if open < max {
            cur.append("(")
            backtrack(ans: &ans, cur: &cur, open: open + 1, close: close, max: max)
            cur.removeLast()
        }
        
        //一定是先拼 ‘(’，所以只有 close < open 才能拼 ‘)’
        if close < open {
            cur.append(")")
            backtrack(ans: &ans, cur: &cur, open: open, close: close + 1, max: max)
            cur.removeLast()
        }
    }
}

let solution = Solution()
assert(solution.generateParenthesis(3) == ["((()))","(()())","(())()","()(())","()()()"])
assert(solution.generateParenthesis(1) == ["()"])

print("Done!")
//: [Next](@next)
