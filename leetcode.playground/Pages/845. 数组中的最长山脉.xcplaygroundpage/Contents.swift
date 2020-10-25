//: [Previous](@previous)
/**
 我们把数组 A 中符合下列属性的任意连续子数组 B 称为 “山脉”：
 
 B.length >= 3
 存在 0 < i < B.length - 1 使得 B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... > B[B.length - 1]
 （注意：B 可以是 A 的任意子数组，包括整个数组 A。）
 
 给出一个整数数组 A，返回最长 “山脉” 的长度。
 
 如果不含有 “山脉” 则返回 0。
 
   
 
 示例 1：
 
 输入：[2,1,4,7,3,2,5]
 输出：5
 解释：最长的 “山脉” 是 [1,4,7,3,2]，长度为 5。
 示例 2：
 
 输入：[2,2,2]
 输出：0
 解释：不含 “山脉”。
   
 
 提示：
 
 0 <= A.length <= 10000
 0 <= A[i] <= 10000
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-mountain-in-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        let n = A.count
        guard n > 2 else {
            return 0
        }
        var ans = 0
        var left = 0
        while left + 2 < n {
            var right = left + 1
            if A[left] < A[right] {
                //找山顶
                while right + 1 < n && A[right] < A[right + 1] {
                    right += 1
                }
                
                if right + 1 < n && A[right] > A[right + 1] {
                    //此时 right 是山顶
                    //找山脚
                    while right + 1 < n && A[right] > A[right + 1] {
                        right += 1
                    }
                    //此时 right 在山脚
                    ans = max(ans, right - left + 1)
                } else {
                    right = right + 1
                }
            }
            left = right
        }
        
        return ans
    }
}

let solution = Solution()
assert(solution.longestMountain([2,1,4,7,3,2,5]) == 5)
assert(solution.longestMountain([2,2,2]) == 0)

print("Done!")
//: [Next](@next)
