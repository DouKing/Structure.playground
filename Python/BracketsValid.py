#!/usr/bin/env python
# -*- coding: UTF-8 -*-

# 有效的括号：
# 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
#
# 有效字符串需满足：
#
# 左括号必须用相同类型的右括号闭合。
# 左括号必须以正确的顺序闭合。
# 注意空字符串可被认为是有效字符串。

class Solution(object):

    def isPair(self, s1, s2):
        if s1 == '(' and s2 == ')':
            return True
        if s1 == ')' and s2 == '(':
            return True

        if s1 == '{' and s2 == '}':
            return True
        if s1 == '}' and s2 == '{':
            return True

        if s1 == '[' and s2 == ']':
            return True
        if s1 == ']' and s2 == '[':
            return True

        return False

    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        stack = []
        for item in s:
            if len(stack) > 0:
                if item == ')' or item == '}' or item == ']':
                    top = stack[-1]
                    if self.isPair(top, item):
                        stack.pop()
                    else:
                        stack.append(item)
                else:
                    stack.append(item)

            else:
                stack.append(item)
        # 栈空说明匹配成功
        return len(stack) < 1