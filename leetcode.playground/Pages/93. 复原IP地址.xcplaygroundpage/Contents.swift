//: [Previous](@previous)
/**
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 
 有效的 IP 地址正好由四个整数（每个整数位于 0 到 255 之间组成），整数之间用 '.' 分隔。
 
   
 
 示例:
 
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/restore-ip-addresses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    let segCount = 4
    lazy var segments: [Int] = {
        return Array<Int>(repeating: 0, count: self.segCount)
    }()
    var ans: [String] = []
    
    func restoreIpAddresses(_ s: String) -> [String] {
        dfs(s, segId: 0, segStart: 0)
        return ans
    }
    
    func dfs(_ s: String, segId: Int, segStart: Int) {
        //已经找到 4 段,并且遍历完了字符串
        if segId == segCount {
            if segStart >= s.count {
                var address = ""
                for n in 0 ..< segCount {
                    address.append("\(segments[n])")
                    if n != segCount - 1 {
                        address.append(".")
                    }
                }
                ans.append(address)
            }
            return
        }
        
        guard segStart < s.count else {
            return
        }
        
        //不能以 0 开头
        if s[s.index(s.startIndex, offsetBy: segStart)] == "0" {
            segments[segId] = 0
            dfs(s, segId: segId + 1, segStart: segStart + 1)
            return
        }
        
        //一般情况
        var addr = 0
        for end in segStart ..< s.count {
            addr = addr * 10 + Int(String(s[s.index(s.startIndex, offsetBy: end)]))!
            if addr > 0 && addr <= 0xff {
                segments[segId] = addr
                dfs(s, segId: segId + 1, segStart: end + 1)
            } else {
                break
            }
        }
    }
}

let solution = Solution()
let ans = solution.restoreIpAddresses("25525511135")
print(ans)

print("Done!")
//: [Next](@next)
