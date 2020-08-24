//: [Previous](@previous)
/**
编写一个算法来判断一个数 n 是不是快乐数。

「快乐数」定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。如果 可以变为  1，那么这个数就是快乐数。

如果 n 是快乐数就返回 True ；不是，则返回 False 。



示例：

输入：19
输出：true
解释：
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1

https://leetcode-cn.com/problems/happy-number/
*/
import Foundation

class Solution {
	func next(_ n: Int) -> Int {
		var num = n
		var next = 0
		while num != 0 {
			let d = num % 10
			num = num / 10
			next += d * d
		}
		return next
	}

	// 非快乐数一定有环
	func isHappy(_ n: Int) -> Bool {
		var slow = n
		var fast = next(n)
		while fast != 1 && slow != fast {
			slow = next(slow)
			fast = next(next(fast))
		}
		return fast == 1
	}
}

let solution = Solution()
assert(solution.isHappy(19))
assert(!solution.isHappy(20))

print("Done!")
//: [Next](@next)
