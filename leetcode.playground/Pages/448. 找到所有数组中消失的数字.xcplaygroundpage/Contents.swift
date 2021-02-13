//: [Previous](@previous)
/**
 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。
 
 找到所有在 [1, n] 范围之间没有出现在数组中的数字。
 
 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。
 
 示例:
 
 ```
 
     输入:
     [4,3,2,7,8,2,3,1]
     
     输出:
     [5,6]
 
 ```
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    //因为所有元素均在 [1, n] 之间，如果每个元素只出现一次，则元素与下标一一对应
    //将元素当作下标去取值，将其值 +n，则元素应该都大于 n，不大于 n 的元素就是没加过 n 的
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        let n = nums.count
        guard n > 0 else {
            return []
        }
        for num in nums {
            let i = (num - 1) % n //有可能已经加过 n， 所以要取模
            nums[i] += n
        }
        var ret: [Int] = []
        for i in 0 ..< n {
            //如果该下标对应的数字不大于 n，说明该下标未被取出过
            if nums[i] <= n {
                ret.append(i + 1)
            }
        }
        return ret
    }
}

let solution = Solution()
solution.findDisappearedNumbers([4,3,2,7,8,2,3,1])

print("Done!")
//: [Next](@next)
