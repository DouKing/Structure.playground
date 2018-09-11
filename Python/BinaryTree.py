#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import json

# Definition for a  binary tree node
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def createTree(values):
        queue = []
        root = None
        current = None
        front = 0
        real = -1
        for x in values:
            current = None
            if x is not None:
                current = TreeNode(x)
            real = real + 1
            queue.append(current)
            if real == 0:
                root = current
            else:
                node = queue[front]
                if node and current:
                    if real % 2 == 1:
                        node.left = current
                    else:
                        node.right = current
                if real % 2 == 0:
                    front = front + 1
                while front < len(queue) and queue[front] == None:
                    front = front + 1
        return root

def buildTree(inorder, postorder):
    """
    :type inorder: List[int]
    :type postorder: List[int]
    :rtype: TreeNode
    """
    if len(postorder) < 1:
        return None
    if len(postorder) == 1:
        val = postorder[0]
        return TreeNode(val)

    rootVal = postorder.pop()
    root = TreeNode(rootVal)

    idx = inorder.index(rootVal)
    leftInorder = inorder[:idx]
    rightInorder = inorder[idx + 1:]

    rightPostorder = []
    postCount = len(rightInorder)
    if postCount > 0:
        rightPostorder = postorder[-len(rightInorder):]
    leftPostorder = postorder[0:len(postorder) - postCount]

    root.left = buildTree(leftInorder, leftPostorder)
    root.right = buildTree(rightInorder, rightPostorder)
    return root

def buildTree2(preorder, inorder):
    """
    :type inorder: List[int]
    :type preorder: List[int]
    :rtype: TreeNode
    """
    if len(preorder) < 1:
        return None
    if len(preorder) == 1:
        val = preorder[0]
        return TreeNode(val)

    rootVal = preorder[0]
    preorder.remove(rootVal)
    root = TreeNode(rootVal)

    idx = inorder.index(rootVal)
    leftInorder = inorder[:idx]
    rightInorder = inorder[idx + 1:]

    rightPreorder = []
    preCount = len(rightInorder)
    if preCount > 0:
        rightPreorder = preorder[-len(rightInorder):]
    leftPreorder = preorder[0:len(preorder) - preCount]

    root.left = buildTree2(leftPreorder, leftInorder)
    root.right = buildTree2(rightPreorder, rightInorder)
    return root

def serialize(root):
    """Encodes a tree to a single string.

    :type root: TreeNode
    :rtype: str
    """
    def desc(x):
        if x:
            return x.val
        else:
            return None

    if not root:
        return []

    queue = [root]
    current = 0
    while current != len(queue):
        node = queue[current]
        current = current + 1
        if not node:
            continue
        if node.left:
            queue.append(node.left)
        else:
            queue.append(None)
        if node.right:
            queue.append(node.right)
        else:
            queue.append(None)
    l = map(desc, queue)
    return json.dumps(l)

def inorderTraversal(root, block):
    if not root:
        return
    inorderTraversal(root.left, block)
    block(root)
    inorderTraversal(root.right, block)

def searchBST(root, val):
    if not root:
        return None
    queue = [root]
    current = 0
    while current != len(queue):
        node = queue[current]
        current = current + 1
        if not node:
            continue
        if node.val == val:
            return node
        if node.left:
            queue.append(node.left)
        else:
            queue.append(None)
        if node.right:
            queue.append(node.right)
        else:
            queue.append(None)
    return None

def insertBST(root, val):
    if not root:
        return None
    if val > root.val:
        right = root.right
        if not right:
            root.right = TreeNode(val)
        else:
            insertBST(root.right, val)
    else:
        left = root.left
        if not left:
            root.left = TreeNode(val)
        else:
            insertBST(root.left, val)
    return root

def deleteBST(root, val):
    def findMax(node):
        if not node:
            return None
        right = node.right
        if not right:
            return node
        return findMax(right)

    if not root:
        return None

    left = root.left
    right = root.right

    if val > root.val:
        root.right = deleteBST(root.right, val)
    elif val < root.val:
        root.left = deleteBST(root.left, val)
    else:
        if left and right:
            temp = findMax(root.left)
            root.val = temp.val
            root.left = deleteBST(root.left, root.val)
        elif left:
            root = left
        elif right:
            root = right
        else:
            root = None

    return root

class BSTIterator(object):
    index = 0
    def __init__(self, root):
        """
        :type root: TreeNode
        """
        self.list = []
        inorderTraversal(root, self.inorderCallback)

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


class KthLargest(object):

    def __init__(self, k, nums):
        """
        :type k: int
        :type nums: List[int]
        """
        self.nums = nums
        self.k = k

    def add(self, val):
        """
        :type val: int
        :rtype: int
        """
        self.nums.append(val)


# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)

tree = createTree([5, 2, 8, 1, 4, 6, 9])
print serialize(tree)


i, v = BSTIterator(tree), []
while i.hasNext():
    v.append(i.next())

print v

node = searchBST(tree, 6)
if node:
    print node.val
else:
    print 'no node'

tree = insertBST(tree, 7)
print serialize(tree)

deleteBST(tree, 6)
print serialize(tree)