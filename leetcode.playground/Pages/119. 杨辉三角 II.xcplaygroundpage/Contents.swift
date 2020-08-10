//: [Previous](@previous)
/**
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 
         1
        1 1
       1 2 1
      1 3 3 1
     1 4 6 4 1
 
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 
 示例:
 
 输入: 3
 输出: [1,3,3,1]
 进阶：
 
 你可以优化你的算法到 O(k) 空间复杂度吗？
 
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/pascals-triangle-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else {
            return [1]
        }
        guard rowIndex > 1 else {
            return [1, 1]
        }
        let lasRow = getRow(rowIndex - 1)
        var ans = Array<Int>(repeating: 1, count: rowIndex + 1)
        for i in 1 ..< rowIndex {
            ans[i] = lasRow[i] + lasRow[i - 1]
        }
        return ans
    }
}

let solution = Solution()
solution.getRow(3)
solution.getRow(4)

print("Done!")
//: [Next](@next)
