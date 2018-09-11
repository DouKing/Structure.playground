#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import BinaryTree

class KthLargest(object):
    def __init__(self, k, nums):
        """
        :type k: int
        :type nums: List[int]
        """
        self.tree = None
        self.k = k
        for num in nums:
            self.add(num)

    def add(self, val):
        """
        :type val: int
        :rtype: int
        """
        self.tree = BinaryTree.insertBST(self.tree, val)
        return self.findKthLargest(self.k)

    def findKthLargest(self, k):
        return 0

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)
