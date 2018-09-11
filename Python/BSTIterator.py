#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import BinaryTree

class BSTIterator(object):
    index = 0
    def __init__(self, root):
        """
        :type root: TreeNode
        """
        self.list = []
        BinaryTree.inorderTraversal(root, self.inorderCallback)

    def inorderCallback(self, x):
        self.list.append(x.val)

    def hasNext(self):
        """
        :rtype: bool
        """
        count = len(self.list)
        return self.index < count

    def next(self):
        """
        :rtype: int
        """
        result = self.list[self.index]
        self.index = self.index + 1
        return result
