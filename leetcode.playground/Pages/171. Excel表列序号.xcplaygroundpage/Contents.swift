//: [Previous](@previous)
/**
给定一个Excel表格中的列名称，返回其相应的列序号。

例如，

A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28
...
示例 1:

输入: "A"
输出: 1
示例 2:

输入: "AB"
输出: 28
示例 3:

输入: "ZY"
输出: 701
致谢：
特别感谢 @ts 添加此问题并创建所有测试用例。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/excel-sheet-column-number
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class Solution {
	func titleToNumber(_ s: String) -> Int {
		var ans = 0
		for c in s {
			let num = c.asciiValue! - ("A" as Character).asciiValue! + 1
			ans = ans * 26 + Int(num)
		}
		return ans
	}
}

let solution = Solution()

let arr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
					 "AA", "AB", "ZY"]
for i in arr {
	print("\(i) \t\t\(solution.titleToNumber(i))")
}

print("Done!")
//: [Next](@next)
