#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import BinaryTree
import KthLargest
import MinStack

print 'Hello world!'

tree = BinaryTree.createTree([5, 2, 8, 1, 4, 6, 9])
print 'tree is BST:', BinaryTree.isValidBST(tree)
print BinaryTree.serialize(tree)

obj = KthLargest.KthLargest(3, [5, 2, 8, 1, 4, 6, 9])
print obj.add(12)
print obj.add(15)
print obj.add(10)

print '--------------'

stack = MinStack.MinStack()
stack.push(1)
stack.push(2)
stack.push(5)
stack.push(4)
stack.push(0)

