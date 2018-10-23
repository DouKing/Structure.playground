class MinStack(object):

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.data = []
        self.mins = []

    def push(self, x):
        """
        :type x: int
        :rtype: void
        """
        self.data.append(x)
        if len(self.mins) == 0:
            self.mins.append(0)
        else:
            min = self.getMin()
            if x < min:
                self.mins.append(len(self.data) - 1)

    def pop(self):
        """
        :rtype: void
        """
        if len(self.data) == 0:
            return
        popIndex = len(self.data) - 1
        minIndex = self.mins[-1]
        if popIndex == minIndex:
            self.mins.pop()
        self.data.pop()

    def top(self):
        """
        :rtype: int
        """
        if len(self.data) < 1:
            return None

        return self.data[-1]


    def getMin(self):
        """
        :rtype: int
        """
        if len(self.data) < 1:
            return None

        minIndex = self.mins[-1]
        return self.data[minIndex]

# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()