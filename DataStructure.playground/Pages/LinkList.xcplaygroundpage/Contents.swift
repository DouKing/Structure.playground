//: [Previous](@previous)
//: [Next](@next)

import Foundation

//: ## 使用枚举实现

// 链表
indirect enum LinkedList<Element: Comparable> {
  case empty
  case node(Element, LinkedList<Element>)

  var length: Int {
    var total = 0
    var temp = self
    while case let .node(_, next) = temp {
      total = total + 1
      temp = next
    }
    return total
  }
}

extension LinkedList {
  //获取节点
  func node(at index: Int) -> LinkedList {
    guard case let .node(_, next) = self else {
      return .empty
    }
    if 0 == index {
      return self
    }
    return next.node(at: index - 1)
  }
  
  func element(at index: Int) -> Element? {
    let node = self.node(at: index)
    if case let .node(element, _) = node {
      return element
    }
    return nil
  }
  
  //修改节点
  mutating func modify(element: Element, at index: Int) {
    guard case let .node(e, n) = self else {
      return
    }
    if 0 == index {
      self = LinkedList.node(element, n)
    } else {
      var next = n
      next.modify(element: element, at: index - 1)
      self = LinkedList.node(e, next)
    }
  }
  
  //删除节点
  mutating func delete(element: Element) {
    guard case .node(let value, var next) = self else {
      return
    }
    next.delete(element: element)
    self = element == value ? next : LinkedList.node(value, next)
  }
  
  mutating func delete(at index: Int) {
    guard case .node(let e, var n) = self else {
      return
    }
    guard index > 0 else {
      self = n
      return
    }
    n.delete(at: index - 1)
    self = LinkedList.node(e, n)
  }
  
  mutating func deleteLast() {
    delete(at: self.length - 1)
  }
  
  //增加节点
  mutating func insert(_ element: Element, at index: Int) {
    guard index > 0 else {
      self = LinkedList.node(element, self)
      return
    }
    guard case .node(let e, var n) = self else {
      return
    }
    n.insert(element, at: index - 1)
    self = LinkedList.node(e, n)
  }
  
  mutating func insert(head: Element) {
    insert(head, at: 0)
  }
  
  mutating func append(_ trail: Element) {
    guard case .node(let value, var next) = self else {
      self = LinkedList.node(trail, .empty)
      return
    }
    next.append(trail)
    self = LinkedList.node(value, next)
  }
}

extension LinkedList: CustomStringConvertible {
  var description: String {
    switch self {
    case .empty:
      return ""
    case let .node(element, next):
      if case .empty = next {
        return "\(element)"
      }
      return "\(element) -> " + next.description
    }
  }
}

//var linkedList: LinkedList<Int> = .empty
//linkedList.append(0)
//linkedList.append(1)
//linkedList.append(2)
//linkedList.append(3)

var linkedList = LinkedList.node(1, .node(2, .node(3, .node(4, .node(5, .empty)))))
linkedList.element(at: 2)
linkedList.length

linkedList.modify(element: 0, at: 4)
linkedList.deleteLast()
linkedList.append(6)
linkedList.insert(5, at: 4)
linkedList.insert(head: 0)
