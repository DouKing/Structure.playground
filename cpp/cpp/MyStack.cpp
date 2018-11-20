//
//  MyStack.cpp
//  cpp
//
//  Created by DouKing on 2018/11/20.
//

#include <stdio.h>
#include <iostream>
#include <queue>

using namespace std;

class MyStack {
private:
  queue<int> queueA;
  queue<int> queueB;

public:
  /** Initialize your data structure here. */
  MyStack() {

  }

  /** Push element x onto stack. */
  void push(int x) {
    queueA.push(x);
  }

  /** Removes the element on top of the stack and returns that element. */
  int pop() {
    if (queueA.empty()) {
      return NULL;
    }
    while (queueA.size() > 1) {
      int front = queueA.front();
      queueA.pop();
      queueB.push(front);
    }

    int front = queueA.front();
    queueA.pop();

    while (queueB.size() > 0) {
      int top = queueB.front();
      queueB.pop();
      queueA.push(top);
    }

    return front;
  }

  /** Get the top element. */
  int top() {
    if (queueA.empty()) {
      return NULL;
    }
    while (queueA.size() > 1) {
      int front = queueA.front();
      queueA.pop();
      queueB.push(front);
    }

    int front = queueA.front();

    queueA.pop();
    queueB.push(front);

    while (queueB.size() > 0) {
      int top = queueB.front();
      queueB.pop();
      queueA.push(top);
    }

    return front;
  }

  /** Returns whether the stack is empty. */
  bool empty() {
    return queueA.empty();
  }
};

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = new MyStack();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.top();
 * bool param_4 = obj.empty();
 */
