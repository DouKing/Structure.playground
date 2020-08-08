//: [Previous](@previous)

import Foundation

class BinaryTreeNode {
  var value: Int
  var leftChild: BinaryTreeNode?
  var rightChild: BinaryTreeNode?
  init(_ value: Int) {
    self.value = value
  }
}

extension BinaryTreeNode: Equatable {
  static func == (lhs: BinaryTreeNode, rhs: BinaryTreeNode) -> Bool {
    return lhs.value == rhs.value
  }
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

//最大深度
func maxDepth(root: BinaryTreeNode?) -> Int {
  guard let root = root else { return 0 }
  return 1 + max(maxDepth(root: root.leftChild), maxDepth(root: root.rightChild))
}

//: 遍历
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

func nonRecursiveInorderTraversal(_ root: BinaryTreeNode?) -> [BinaryTreeNode] {
  var result: [BinaryTreeNode] = []
  var stack: [BinaryTreeNode] = []
  var node: BinaryTreeNode? = root
  while node != nil || !stack.isEmpty {
    if node != nil {
      stack.append(node!)
      node = node!.leftChild
    } else {
      node = stack.removeLast()
      result.append(node!)
      node = node!.rightChild
    }
  }
  
  print(result.map({ (node) -> Int in
    node.value
  }))
  return result
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

//morris中序遍历
func morrisTraversal(_ root: BinaryTreeNode?) {
  var ans: [Int] = []
  defer { print(ans) }
  
  let visit = { (v: Int) in
    ans.append(v)
  }

  var node = root
  while let current = node {
    if let left = current.leftChild {
      var pre = left
      while let n = pre.rightChild, n != current {
        pre = n
      }
      if let right = pre.rightChild {
        if right == current {
          visit(current.value)
          pre.rightChild = nil
          node = current.rightChild
        }
      } else {
        pre.rightChild = current
        node = current.leftChild
      }
    } else {
      visit(current.value)
      node = node?.rightChild
    }
  }
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
morrisTraversal(t)
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


//: BST

// 是否是二叉查找树
func isValidBST(root: BinaryTreeNode?) -> Bool {
  func _helper(node: BinaryTreeNode?, _ min: Int?, _ max: Int?) -> Bool {
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
  return _helper(node: root, nil, nil)
}

//插入值
func insertBST(root: BinaryTreeNode?, value: Int) -> BinaryTreeNode? {
  guard let root = root else {
    return nil
  }
  if value > root.value {
    if let right = root.rightChild {
      insertBST(root: right, value: value)
    } else {
      root.rightChild = BinaryTreeNode(value)
    }
  } else {
    if let left = root.leftChild {
      insertBST(root: left, value: value)
    } else {
      root.leftChild = BinaryTreeNode(value)
    }
  }
  return root
}

//删除节点
func deleteBST(root: BinaryTreeNode?, value: Int) -> BinaryTreeNode? {
  guard let root = root else { return nil }
  
  return root
}

let values = [5, 2, 8, 1, 4, 6, 9]
let root = createTree(values: values)
insertBST(root: root, value: 7)
let r = nonRecursiveInorderTraversal(root).map { (node) -> Int in
  node.value
}
r

print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||")

func buildTree(inorder: [Int], postorder: [Int]) -> BinaryTreeNode? {
  guard let rootVal = postorder.last else { return nil }
  let root = BinaryTreeNode(rootVal)
  
  let index = inorder.firstIndex(of: rootVal)!
  let leftInorder = Array(inorder[..<index])
  let rightInorder = Array(inorder[(index + 1)...])
  
  let newPostorder = Array(postorder.dropLast())
  
  let rightPostorder: [Int] = Array(newPostorder.suffix(rightInorder.count))
  let leftPostorder: [Int] = Array(newPostorder.prefix(newPostorder.count - rightInorder.count))
  
  root.leftChild = buildTree(inorder: leftInorder, postorder: leftPostorder)
  root.rightChild = buildTree(inorder: rightInorder, postorder: rightPostorder)
  
  return root
}

let inorder = [4, 2, 5, 7, 1, 3, 8, 6]
let postorder = [4, 7, 5, 2, 8, 6, 3, 1]
let tree2 = buildTree(inorder: inorder, postorder: postorder)
print("层级遍历:")
levelOrderTraverse(tree2)
print("先序遍历:")
nonRecursivePreorderTraversal(tree2)
print("中序遍历:")
nonRecursiveInorderTraversal(tree2)
print("后序遍历")
nonRecureivePostorderTraversal(tree2)

//: [Next](@next)
