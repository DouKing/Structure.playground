#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import random

def swapAt(list, i, j):
    temp = list[i]
    list[i] = list[j]
    list[j] = temp

class KthLargest(object):
    def __init__(self, k, nums):
        """
        :type k: int
        :type nums: List[int]
        """
        self.numbers = nums
        self.k = k

    def add(self, val):
        """
        :type val: int
        :rtype: int
        """
        self.numbers.append(val)
        return self.findKthLargest(self.k)

    def findKthLargest(self, k):
        count = len(self.numbers)
        return self.randomizedSelect(0, count - 1, count - k)

    def randomizedSelect(self, low, high, k):
        if low < high:
            p = self.randomizedPartition(low, high)
            if k == p:
                return self.numbers[p]
            elif k < p:
                return self.randomizedSelect(low, p - 1, k)
            else:
                return self.randomizedSelect(p + 1, high, k)
        else:
            return self.numbers[low]

    def randomizedPartition(self, low, high):
        pivot = self.randomPivot(low, high)
        i = low
        for j in range(low, high):
            if self.numbers[j] <= pivot:
                swapAt(self.numbers, i, j)
                i = i + 1
        swapAt(self.numbers, i, high)
        return i

    def randomPivot(self, low, high):
        pivotIndex = random.randint(low, high)
        swapAt(self.numbers, pivotIndex, high)
        return self.numbers[high]

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)
