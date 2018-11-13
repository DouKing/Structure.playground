#!/usr/bin/env python
# -*- coding: UTF-8 -*-

class MyQueue(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.stackA = []
        self.stackB = []

    def push(self, x):
        """
        Push element x to the back of queue.
        :type x: int
        :rtype: void
        """
        self.stackA.append(x)

    def pop(self):
        """
        Removes the element from in front of queue and returns that element.
        :rtype: int
        """
        if len(self.stackB) < 1:
            if len(self.stackA) < 1:
                return None
            self._reset()

        return self.stackB.pop()

    def peek(self):
        """
        Get the front element.
        :rtype: int
        """
        if len(self.stackB) < 1:
            if len(self.stackA) < 1:
                return None
            self._reset()

        return self.stackB[-1]

    def empty(self):
        """
        Returns whether the queue is empty.
        :rtype: bool
        """
        return len(self.stackA) < 1 and len(self.stackB) < 1

    def _reset(self):
        while len(self.stackA) > 0:
            self.stackB.append(self.stackA.pop())


# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()