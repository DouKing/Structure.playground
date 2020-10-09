//: [Previous](@previous)
/**
 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
 
 岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。
 
 此外，你可以假设该网格的四条边均被水包围。
 
   
 
 示例 1:
 
 输入:
 
         [
             ['1','1','1','1','0'],
             ['1','1','0','1','0'],
             ['1','1','0','0','0'],
             ['0','0','0','0','0']
         ]
 输出: 1
 
 示例 2:
 
 输入:
 
         [
             ['1','1','0','0','0'],
             ['1','1','0','0','0'],
             ['0','0','1','0','0'],
             ['0','0','0','1','1']
         ]
 输出: 3
 解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-islands
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        guard rows > 0 else {
            return 0
        }
        let columns = grid[0].count
        guard columns > 0 else {
            return 0
        }
        var nums = 0
        var table = grid
        
        for r in 0 ..< rows {
            for c in 0 ..< columns {
                if table[r][c] != "1" { continue }
                nums += 1
                table[r][c] = "0"
                var queue: [Int] = []
                let idx = r * columns + c
                queue.append(idx)
                while !queue.isEmpty {
                    let idx = queue.removeLast()
                    let row = idx / columns
                    let column = idx % columns
                    if row - 1 >= 0 && table[row - 1][column] == "1" {
                        table[row - 1][column] = "0"
                        queue.append((row - 1) * columns + column)
                    }
                    if row + 1 < rows && table[row + 1][column] == "1" {
                        table[row + 1][column] = "0"
                        queue.append((row + 1) * columns + column)
                    }
                    if column - 1 >= 0 && table[row][column - 1] == "1" {
                        table[row][column - 1] = "0"
                        queue.append((row * columns) + column - 1)
                    }
                    if column + 1 < columns && table[row][column + 1] == "1" {
                        table[row][column + 1] = "0"
                        queue.append((row * columns) + column + 1)
                    }
                    
                    print(table)
                    print(queue)
                }
            }
        }
        
        return nums
    }
}

let solution = Solution()
//solution.numIslands([
//    ["1","1","1","1","0"],
//    ["1","1","0","1","0"],
//    ["1","1","0","0","0"],
//    ["0","0","0","0","0"]
//])
//
//solution.numIslands([
//    ["1"]
//])
//
//solution.numIslands([
//    ["0"]
//])
//
//solution.numIslands([
//    ["1", "0", "1"]
//])

solution.numIslands([
    ["1", "1", "1"],
    ["0", "1", "0"],
    ["1", "1", "1"],
])

print("Done!")
//: [Next](@next)
