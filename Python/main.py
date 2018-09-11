#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import BinaryTree
import KthLargest

print 'Hello world!'

tree = BinaryTree.createTree([5, 2, 8, 1, 4, 6, 9])
print 'tree is BST:', BinaryTree.isValidBST(tree)
print BinaryTree.serialize(tree)

obj = KthLargest.KthLargest(3, [5, 2, 8, 1, 4, 6, 9])
print obj.add(12)
print obj.add(15)
print obj.add(10)
