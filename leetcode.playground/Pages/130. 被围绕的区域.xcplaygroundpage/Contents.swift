//: [Previous](@previous)
/**
 给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。
 
 找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
 
 示例:
 
 X X X X
 X O O X
 X X O X
 X O X X
 运行你的函数后，矩阵变为：
 
 X X X X
 X X X X
 X X X X
 X O X X
 解释:
 
 被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/surrounded-regions
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    var n = 0 //行数
    var m = 0 //列数
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty {
            return
        }
        n = board.count
        m = board[0].count
        
        guard m > 1 else {
            return
        }
        
        //将四条边上的 O 及与其相连的 O 都标记为 A
        //1.左右两列
        for i in 0 ..< n {
            dfs(&board, x: i, y: 0)
            dfs(&board, x: i, y: m - 1)
        }
        //2.上下两行
        for i in 1 ..< m - 1 {
            dfs(&board, x: 0, y: i)
            dfs(&board, x: n - 1, y: i)
        }
        
        //遍历整个岛屿,将 A 替换为 O,将 O 替换为 X
        for i in 0 ..< n {
            for j in 0 ..< m {
                let e = board[i][j]
                if e == "A" {
                    board[i][j] = "O"
                } else if e == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    //深度优先搜索,将 x,y 坐标和其邻接点标记为 A
    func dfs(_ board: inout [[Character]], x: Int, y: Int) {
        guard x >= 0, x < n, y >= 0, y < m else {
            return
        }
        
        guard board[x][y] == "O" else {
            return
        }
        
        board[x][y] = "A"
        dfs(&board, x: x - 1, y: y)
        dfs(&board, x: x + 1, y: y)
        dfs(&board, x: x, y: y - 1)
        dfs(&board, x: x, y: y + 1)
    }
}

func printBoard(_ board: [Any]) {
    for e in board {
        print(e)
    }
}

let solution = Solution()

var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
printBoard(board)

print("---------------------")

solution.solve(&board)
printBoard(board)

print("Done!")
//: [Next](@next)
