//: [Previous](@previous)
//: [Next](@next)

import Foundation

class BinaryTreeNode {
  var value: Int
  var leftChild: BinaryTreeNode?
  var rightChild: BinaryTreeNode?
  init(_ value: Int) {
    self.value = value
  }
}

//最大深度
func maxDepth(root: BinaryTreeNode?) -> Int {
  guard let root = root else { return 0 }
  return 1 + max(maxDepth(root: root.leftChild), maxDepth(root: root.rightChild))
}

private func _helper(node: BinaryTreeNode?, _ min: Int?, _ max: Int?) -> Bool {
  guard let node = node else { return true }
  // 所有右子节点必须大于根节点
  if let min = min, node.value <= min {
    return false
  }
  // 所有左子节点必须小于根节点
  if let max = max, node.value >= max {
    return false
  }

  return _helper(node: node.leftChild, min, node.value)
      && _helper(node: node.rightChild, node.value, max)
}

// 是否是二叉查找树
func isValidBST(root: BinaryTreeNode?) -> Bool {
  return _helper(node: root, nil, nil)
}

// 创建二叉树
func createTree(values: [Int?]) -> BinaryTreeNode? {
  var queue: [BinaryTreeNode?] = []
  var root: BinaryTreeNode? = nil
  var curr: BinaryTreeNode? = nil
  var front: Int = 0, real: Int = -1
  for value in values {
    curr = nil
    if value != nil {
      curr = BinaryTreeNode(value!)
    }
    real = real + 1
    queue.append(curr)
    if real == 0 {
      root = curr
    } else {
      if curr != nil && queue[front] != nil {
        if real % 2 == 1 {
          queue[front]?.leftChild = curr
        } else {
          queue[front]?.rightChild = curr
        }
      }
      if real % 2 == 0 {
        front = front + 1
      }
    }
  }
  return root
}

//层级遍历
func levelOrderTraverse(_ root: BinaryTreeNode?) {
  var result = [BinaryTreeNode]()
  var level = [BinaryTreeNode]()
  if root != nil {
    level.append(root!)
  }
  while level.count != 0 {
    var nextLevel = [BinaryTreeNode]()
    for node in level {
      result.append(node)
      if let lefeNode = node.leftChild {
        nextLevel.append(lefeNode)
      }
      if let rightNode = node.rightChild {
        nextLevel.append(rightNode)
      }
    }
    level = nextLevel
  }
  let ans = result.map {
    $0.value
  }

  print(ans)
}

//先序遍历
func preorderTraversal(_ root: BinaryTreeNode?) {
  if root == nil {
    return
  }
  print(root!.value)
  preorderTraversal(root!.leftChild)
  preorderTraversal(root!.rightChild)
}

func nonRecursivePreorderTraversal(_ root: BinaryTreeNode?) {
  var result: [Int] = []
  var stack: [BinaryTreeNode] = []
  var node: BinaryTreeNode? = root
  while node != nil || !stack.isEmpty {
    if node != nil {
      result.append(node!.value)
      stack.append(node!)
      node = node!.leftChild
    } else {
      node = stack.removeLast()
      node = node!.rightChild
    }
  }

  print(result)
}

//中序遍历
func inorderTraversal(_ root: BinaryTreeNode?) {
  if root == nil {
    return
  }
  inorderTraversal(root!.leftChild)
  print(root!.value)
  inorderTraversal(root!.rightChild)
}

func nonRecursiveInorderTraversal(_ root: BinaryTreeNode?) {
  var result: [Int] = []
  var stack: [BinaryTreeNode] = []
  var node: BinaryTreeNode? = root
  while node != nil || !stack.isEmpty {
    if node != nil {
      stack.append(node!)
      node = node!.leftChild
    } else {
      node = stack.removeLast()
      result.append(node!.value)
      node = node!.rightChild
    }
  }

  print(result)
}

//后序遍历
func postorderTraversal(_ root: BinaryTreeNode?) {
  if root == nil {
    return
  }
  postorderTraversal(root!.leftChild)
  postorderTraversal(root!.rightChild)
  print(root!.value)
}

func nonRecureivePostorderTraversal(_ root: BinaryTreeNode?) {
  class Node {
    let elem: BinaryTreeNode?
    var n: Int
    init(elem: BinaryTreeNode?, n: Int = 0) {
      self.elem = elem
      self.n = n
    }
  }
  var result: [BinaryTreeNode] = []
  var stack: [Node] = []
  var node: Node = Node(elem: root, n: 0)
  while node.elem != nil || !stack.isEmpty {
    if node.elem != nil {
      node.n = node.n + 1
      stack.append(node)
      node = Node(elem: node.elem!.leftChild, n: 0)
    } else {
      node = stack.last!
      node.n = node.n + 1
      if node.n == 3 {
        node = stack.removeLast()
        result.append(node.elem!)
        node = Node(elem: nil, n: 0)
      } else {
        node = Node(elem: node.elem!.rightChild, n: 0)
      }
    }
  }
  let ans = result.map {
    $0.value
  }
  print(ans)
}

//翻转二叉树
func reversalBinaryTree(_ root: BinaryTreeNode?) {
  guard let root = root else { return }
  let tempLeftChild = root.leftChild
  root.leftChild = root.rightChild
  root.rightChild = tempLeftChild

  reversalBinaryTree(root.leftChild)
  reversalBinaryTree(root.rightChild)
}

let t = createTree(values: [1, 2, 3, 4, 5, nil, 6, nil, nil, nil, 7, nil, nil, 8])
print("层级遍历:")
levelOrderTraverse(t)
print("先序遍历:")
preorderTraversal(t)
nonRecursivePreorderTraversal(t)
print("中序遍历:")
inorderTraversal(t)
nonRecursiveInorderTraversal(t)
print("后序遍历")
postorderTraversal(t)
nonRecureivePostorderTraversal(t)

print("==========  翻转后  ==========")
reversalBinaryTree(t)
print("层级遍历:")
levelOrderTraverse(t)
print("先序遍历:")
preorderTraversal(t)
print("中序遍历:")
inorderTraversal(t)
print("后序遍历")
postorderTraversal(t)


//: 枚举实现二叉树
indirect enum BinaryTree<T: Comparable> {
  case empty
  case node(BinaryTree<T>, T, BinaryTree<T>)

  var count: Int {
    switch self {
    case .empty:
      return 0
    case let .node(left, _, right):
      return 1 + left.count + right.count
    }
  }

  var maxDepth: Int {
    switch self {
    case .empty:
      return 0
    case let .node(left, _, right):
      return 1 + max(left.maxDepth, right.maxDepth)
    }
  }
}

extension BinaryTree: CustomStringConvertible {
  public var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
    case .empty:
      return ""
    }
  }
}

extension BinaryTree {
  public func traverseInOrder(process: (T) -> Void) {
    if case let .node(left, value, right) = self {
      left.traverseInOrder(process: process)
      process(value)
      right.traverseInOrder(process: process)
    }
  }

  public func traversePreOrder(process: (T) -> Void) {
    if case let .node(left, value, right) = self {
      process(value)
      left.traversePreOrder(process: process)
      right.traversePreOrder(process: process)
    }
  }

  public func traversePostOrder(process: (T) -> Void) {
    if case let .node(left, value, right) = self {
      left.traversePostOrder(process: process)
      right.traversePostOrder(process: process)
      process(value)
    }
  }

  mutating func reverse() {
    guard case .node(var left, let value, var right) = self else {
      return
    }
    right.reverse()
    left.reverse()
    self = BinaryTree.node(right, value, left)
  }
}

var tree = BinaryTree.node(
  BinaryTree.node(
    BinaryTree.node(
      BinaryTree.node(
        .empty,
        5,
        .empty),
      4,
      BinaryTree.node(
        .empty,
        6,
        .empty)),
    2,
    BinaryTree.node(
      BinaryTree.node(
        .empty,
        8,
        .empty),
      7,
      BinaryTree.node(
        .empty,
        9,
        .empty))),
  1,
  BinaryTree.node(
    BinaryTree.node(
      BinaryTree.node(
        .empty,
        12,
        .empty),
      10,
      BinaryTree.node(
        .empty,
        13,
        .empty)),
    3,
    BinaryTree.node(
      BinaryTree.node(
        .empty,
        14,
        .empty),
      11,
      .empty)))

var inOrderArray: [Int] = []
tree.traverseInOrder { (s) in
  inOrderArray.append(s)
}

var preOrderArray: [Int] = []
tree.traversePreOrder { (s) in
  preOrderArray.append(s)
}

inOrderArray
preOrderArray

tree
tree.reverse()




