//: [Previous](@previous)
/**
 统计所有小于非负整数 n 的质数的数量。
 
 示例:
 
 输入: 10
 输出: 4
 解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。

 https://leetcode-cn.com/problems/count-primes/
 */
import Foundation

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        
        var isPrimes = Array<Bool>(repeating: true, count: n)
        
        var i = 2
        while i * i < n {
            if isPrimes[i] {
                var j = i * i
                while j < n {
                    isPrimes[j] = false
                    j += i
                }
            }
            i += 1
        }
        
        var count = 0
        for i in 2 ..< n {
            if isPrimes[i] {
                count += 1
            }
        }
        return count
    }
}

let solution = Solution()

assert(solution.countPrimes(10) == 4)


print("Done!")
//: [Next](@next)
