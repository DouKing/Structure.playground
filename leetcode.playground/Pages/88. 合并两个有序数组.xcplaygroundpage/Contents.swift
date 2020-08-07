//: [Previous](@previous)
/*
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。



 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。


 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var p = m + n - 1
        while p1 >= 0 && p2 >= 0 {
            let n1 = nums1[p1]
            let n2 = nums2[p2]
            if n2 > n1 {
                nums1[p] = n2
                p2 -= 1
            } else {
                nums1[p] = n1
                p1 -= 1
            }
            p -= 1
        }

        if p2 >= 0 {
            for i in 0 ... p2 {
                nums1[i] = nums2[i]
            }
        }
    }
}

let solution = Solution()
var nums1 = [1, 2, 3, 0, 0, 0]
let nums2 = [2, 5, 6]
solution.merge(&nums1, 3, nums2, 3)

assert(nums1 == [1, 2, 2, 3, 5, 6])

print("Done!")
//: [Next](@next)
