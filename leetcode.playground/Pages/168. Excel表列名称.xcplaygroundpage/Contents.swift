//: [Previous](@previous)
/**
 给定一个正整数，返回它在 Excel 表中相对应的列名称。
 
 例如，
 
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 ...
 示例 1:
 
 输入: 1
 输出: "A"
 示例 2:
 
 输入: 28
 输出: "AB"
 示例 3:
 
 输入: 701
 输出: "ZY"
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/excel-sheet-column-title
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func convertToTitle(_ n: Int) -> String {
        var num = n
        var res = ""
        while num > 0 {
            let c: UInt8 = UInt8((num - 1) % 26)
            // ("A" as Character).asciiValue! + c 通过 ASCII 码计算偏移量
            res = String(UnicodeScalar(("A" as Character).asciiValue! + c)) + res
            num = (num - 1) / 26
        }
        return res
    }
}

Character(UnicodeScalar(65))
Character(UnicodeScalar(97))
String(UnicodeScalar(66))

let solution = Solution()

for i in 1 ... 701 {
    print("\(i):\t\t\(solution.convertToTitle(i))")
}

print("Done!")
//: [Next](@next)
