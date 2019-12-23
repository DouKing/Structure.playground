//: [Previous](@previous)

import Foundation

public class BinarySearchTreeNode<T: Comparable> {
  public var value: T
  public var leftChild: BinarySearchTreeNode?
  public var rightChild: BinarySearchTreeNode?
  public var parent: BinarySearchTreeNode?
  
  public init(_ value: T) {
    self.value = value
  }
  
  public convenience init(values: [T]) {
    precondition(!values.isEmpty, "数组不能为空")
    self.init(values.first!)
    for value in values.dropFirst() {
      add(value: value)
    }
  }
  
  // 是否叶子节点
  public var isLeaf: Bool {
    return leftChild == nil && rightChild == nil
  }
  
  public var isLeftChild: Bool {
    return self === parent?.leftChild
  }
  
  public var isRightChild: Bool {
    return self === parent?.rightChild
  }
  
  //节点个数
  public var count: Int {
    return 1 + (leftChild?.count ?? 0) + (rightChild?.count ?? 0);
  }
  
  //最小值
  public var minimum: BinarySearchTreeNode {
    var node = self
    while let next = node.leftChild {
      node = next
    }
    return node
  }
  
  //最大值
  public var maximum: BinarySearchTreeNode {
    var node = self
    while let next = node.rightChild {
      node = next
    }
    return node
  }
}

extension BinarySearchTreeNode: CustomStringConvertible {
  public var description: String {
    var str = ""
    if let left = leftChild {
      str += "(\(left)) <- "
    }
    str += "\(value)"
    if let right = rightChild {
      str += " -> (\(right))"
    }
    return str
  }
}

extension BinarySearchTreeNode {
  //添加节点
  public func add(value: T) {
    if value < self.value {
      //添加到左子树
      if let left = leftChild {
        left.add(value: value)
      } else {
        leftChild = BinarySearchTreeNode(value)
        leftChild?.parent = self
      }
    } else if value > self.value {
      //添加到右子树
      if let right = rightChild {
        right.add(value: value)
      } else {
        rightChild = BinarySearchTreeNode(value)
        rightChild?.parent = self
      }
    }
  }
  
  public func add(node: BinarySearchTreeNode) {
    if node.value < self.value {
      if let left = leftChild {
        left.add(node: node)
      } else {
        leftChild = node
        node.parent = self
      }
    } else if node.value > self.value {
      if let right = rightChild {
        right.add(node: node)
      } else {
        rightChild = node
        node.parent = self
      }
    }
  }
  
  // 查找节点
  public func search(value: T) -> BinarySearchTreeNode? {
    var node: BinarySearchTreeNode? = self
    while let n = node {
      if n.value > value {
        node = n.leftChild
      } else if n.value < value {
        node = n.rightChild
      } else {
        return n
      }
    }
    
    return nil
  }
  
  //是否包含某值
  public func contains(value: T) -> Bool {
    return search(value: value) != nil
  }
  
  //删除节点
  public func remove() -> BinarySearchTreeNode? {
    var replacement: BinarySearchTreeNode? = nil
    
    if let right = rightChild {
      replacement = right.minimum
    } else if let left = leftChild {
      replacement = left.maximum
    }
    
    replacement?.remove()
    
    replacement?.rightChild = rightChild
    replacement?.leftChild = leftChild
    rightChild?.parent = replacement
    leftChild?.parent = replacement
    
    if let parent = parent {
      if isLeftChild {
        parent.leftChild = replacement
      } else {
        parent.rightChild = replacement
      }
    }
    replacement?.parent = parent
    
    parent = nil
    leftChild = nil
    rightChild = nil
    
    return replacement
  }
}


let node7 = BinarySearchTreeNode(7)
let node2 = BinarySearchTreeNode(2)
let node10 = BinarySearchTreeNode(10)
let node1 = BinarySearchTreeNode(1)
let node4 = BinarySearchTreeNode(4)
let node8 = BinarySearchTreeNode(8)
let node12 = BinarySearchTreeNode(12)
let node3 = BinarySearchTreeNode(3)
let node5 = BinarySearchTreeNode(5)
let node9 = BinarySearchTreeNode(9)
let node13 = BinarySearchTreeNode(13)

node7.add(node: node2)
node7.add(node: node10)
node7.add(node: node1)
node7.add(node: node4)
node7.add(node: node8)
node7.add(node: node12)
node7.add(node: node3)
node7.add(node: node5)
node7.add(node: node9)
node7.add(node: node13)

print(node7)
node12.remove()
print(node7)

//: [Next](@next)
