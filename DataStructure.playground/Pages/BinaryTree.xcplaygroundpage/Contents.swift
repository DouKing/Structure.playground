//: [Previous](@previous)
//: [Next](@next)

import Foundation

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
      return "value: \(value) left = [\(left.description)], right = [\(right.description)]"
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
  
  public func traverseLevelOrder(process: (T) -> Void) {
    var level: [BinaryTree<T>] = []
    level.append(self)
    
    while !level.isEmpty {
      let node = level.removeFirst()
      if case .node(let left, let value, let right) = node {
        process(value)
        if case .node = left {
          level.append(left)
        }
        if case .node = right {
          level.append(right)
        }
      }
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
  .node(
    .node(
      .node(
        .empty,
        5,
        .empty),
      4,
      .node(
        .empty,
        6,
        .empty)),
    2,
    .node(
      .node(
        .empty,
        8,
        .empty),
      7,
      .node(
        .empty,
        9,
        .empty))),
  1,
  .node(
    .node(
      .node(
        .empty,
        12,
        .empty),
      10,
      .node(
        .empty,
        13,
        .empty)),
    3,
    .node(
      .node(
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

var levelOrderArray: [Int] = []
tree.traverseLevelOrder { (s) in
  levelOrderArray.append(s)
}

inOrderArray
preOrderArray
levelOrderArray

tree
tree.reverse()

//: 打印路径
var stack: [Int] = []
func pathSum(root: BinaryTree<Int>) {
  if case let .node(left, value, right) = root {
    stack.append(value)
    if case .empty = left, case .empty = right {
      print("path: \(stack)")
    }
    pathSum(root: left)
    pathSum(root: right)
    stack.removeLast()
  }
}

pathSum(root: tree)


