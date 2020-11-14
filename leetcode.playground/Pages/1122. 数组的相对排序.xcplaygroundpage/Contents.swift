//: [Previous](@previous)
/**
 给你两个数组，arr1 和 arr2，
 
 arr2 中的元素各不相同
 arr2 中的每个元素都出现在 arr1 中
 对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1 的末尾。
 
   
 
 示例：
 
 输入：arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
 输出：[2,2,2,1,4,3,3,9,6,7,19]
   
 
 提示：
 
 arr1.length, arr2.length <= 1000
 0 <= arr1[i], arr2[i] <= 1000
 arr2 中的元素 arr2[i] 各不相同
 arr2 中的每个元素 arr2[i] 都出现在 arr1 中
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/relative-sort-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var rank: [Int: Int] = [:]
        for i in 0 ..< arr2.count {
            rank[arr2[i]] = i
        }
        
        return arr1.sorted { (first, second) -> Bool in
            let indexFirst = rank[first]
            let indexSecond = rank[second]
            if let fi = indexFirst, let si = indexSecond {
                return fi < si
            } else if let _ = indexFirst {
                return true
            } else if let _ = indexSecond {
                return false
            } else {
                return first < second
            }
        }
    }
}

let solution = Solution()
solution.relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6])


print("Done!")
//: [Next](@next)
