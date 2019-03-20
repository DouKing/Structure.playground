//: [Previous](@previous)
//: [Next](@next)

import Foundation

//链表节点
class ListNode {
  var value: Int
  var next: ListNode?
  init(_ value: Int) {
    self.value = value
  }
}

//创建链表，返回头节点
func createList(_ values: [Int]) -> ListNode? {
  var head: ListNode? = nil
  var trail: ListNode? = nil
  values.forEach { (value) in
    let node = ListNode(value)
    if head == nil {
      head = node
    } else {
      trail!.next = node
    }
    trail = node
  }
  return head
}

//根据下标查询节点
func getNode(from head: ListNode?, at index: Int) -> ListNode? {
  var i = 0
  var node: ListNode? = head
  while i < index && node?.next != nil {
    node = node?.next
    i = i + 1
  }
  if i != index {
    return nil
  }
  return node
}

//插入节点
func insert(node: ListNode?, to head: ListNode, at index: Int) -> ListNode? {
  guard let node = node else { return head }
  guard index > 0 else {
    node.next = head
    return node
  }
  if let pNode = getNode(from: head, at: index - 1) {
    node.next = pNode.next
    pNode.next = node
  }
  return head
}

//删除节点
func deleteNode(from head: ListNode, at index: Int) -> ListNode? {
  guard index > 0 else {
    let next = head.next
    head.next = nil
    return next
  }
  if let pNode = getNode(from: head, at: index - 1) {
    let node = pNode.next
    pNode.next = node?.next
    node?.next = nil
  }
  return head
}

//修改节点
func updateNode(_ head: ListNode, at index: Int, use value: Int) -> ListNode {
  getNode(from: head, at: index)?.value = value
  return head
}

func printList(_ head: ListNode?) {
  var node = head
  var nodes: [Int] = []

  while node != nil {
    nodes.append(node!.value)
    node = node!.next
  }
  print(nodes)
}

/*
 给一个链表和一个值x，要求将链表中所有小于x的值放到左边，所有大于等于x的值放到右边。原链表的节点顺序不能变。
 例：1->5->3->2->4->2，给定x = 3。则我们要返回 1->2->2->3->5->4
 */
func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
  let prevDummy = ListNode(0)
  var prev = prevDummy
  let postDummy = ListNode(0)
  var post = postDummy
  
  let currDummy = ListNode(x)
  
  var node = head
  
  while node != nil {
    if node!.value < x {
      prev.next = node
      prev = node!
    } else if node!.value > x {
      post.next = node
      post = node!
    }
    node = node!.next
  }
  
  post.next = nil
  prev.next = currDummy
  currDummy.next =  postDummy.next
  
  return prevDummy.next
}

let listHead = createList([1, 5, 3, 2, 4, 2])
printList(listHead)

partition(listHead, 3)
printList(listHead)

/*
 给定一个从小到大的数组 [2, 3, 5, 8, 9, 10, 18, 26, 32]，要求往数组中插入6，使原数组依然从小到大排序。
 */
func modify() {
  let array = [2, 3, 5, 8, 9, 10, 18, 26, 32]
  let value = 6
  let head = createList(array)
  var i = 0
  var node = head!
  var v = node.value
  while node.next != nil && v < value {
    node = node.next!
    v = node.value
    i = i + 1
  }
  insert(node: ListNode(6), to: head!, at: i)
  printList(head)
}
modify()

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
