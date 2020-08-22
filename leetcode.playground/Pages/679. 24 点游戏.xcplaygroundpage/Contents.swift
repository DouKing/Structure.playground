//: [Previous](@previous)
/**
 你有 4 张写有 1 到 9 数字的牌。你需要判断是否能通过 *，/，+，-，(，) 的运算得到 24。
 
 示例 1:
 
 输入: [4, 1, 8, 7]
 输出: True
 解释: (8-4) * (7-1) = 24
 示例 2:
 
 输入: [1, 2, 1, 2]
 输出: False
 注意:
 
 除法运算符 / 表示实数除法，而不是整数除法。例如 4 / (1 - 2/3) = 12 。
 每个运算符对两个数进行运算。特别是我们不能用 - 作为一元运算符。例如，[1, 1, 1, 1] 作为输入时，表达式 -1 - 1 - 1 - 1 是不允许的。
 你不能将数字连接在一起。例如，输入为 [1, 2, 1, 2] 时，不能写成 12 + 12 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/24-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    let target = 24
    let epsilon = 0.000001
    let add = 0, multiply = 1, subtract = 2, divide = 4
    
    func judgePoint24(_ nums: [Int]) -> Bool {
        return solve(list: nums.map { Double($0) })
    }
    
    func solve(list: [Double]) -> Bool {
        let count = list.count
        if count == 0 {
            return false
        }
        if count == 1 {
            return abs(list[0] - Double(target)) < epsilon
        }
        
        //找两个数
        for i in 0 ..< count {
            for j in 0 ..< count {
                if i == j { continue }
                var list2: [Double] = []
                //先将剩余两个数放进去
                for k in 0 ..< count {
                    if k != i && k != j {
                        list2.append(list[k])
                    }
                }
                
                //再将计算结果放进去
                for k in add ... divide {
                    //加法和乘法满足交换律,只计算一遍
                    if (k == add || k == multiply) && i > j {
                        continue
                    }
                    
                    switch k {
                    case add:
                        list2.append(list[i] + list[j])
                    case multiply:
                        list2.append(list[i] * list[j])
                    case subtract:
                        list2.append(list[i] - list[j])
                    default:
                        //除数不能为 0, 小于 1e-6 看作 0
                        if abs(list[j]) < epsilon {
                            continue
                        } else {
                            list2.append(list[i] / list[j])
                        }
                    }
                    
                    if solve(list: list2) {
                        return true
                    }
                    if !list2.isEmpty {
                        list2.removeLast()
                    }
                }
                
            }
        }
        return false
    }
}

let solution = Solution()
solution.judgePoint24([3, 9, 7, 7])

print("Done!")
//: [Next](@next)
