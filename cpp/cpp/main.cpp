//
//  main.cpp
//  cpp
//
//  Created by DouKing on 2018/9/30.
//

#include <iostream>
#include "MyCircleQueue.hpp"
#include "MyStack.cpp"

using namespace std;

static void testCircleQueue() {
  MyCircularQueue queue = MyCircularQueue(3);
  cout << queue.enQueue(1) << endl;
  cout << queue.enQueue(2) << endl;
  cout << queue.enQueue(3) << endl;
  cout << queue.enQueue(4) << endl;
  cout << queue.Rear() << endl;
  cout << queue.isFull() << endl;
  cout << queue.deQueue() << endl;
  queue.description();
  cout << queue.enQueue(4) << endl;
  cout << queue.Rear() << endl;
}

void testMyStack() {
  MyStack s;
  s.push(1);
  s.push(2);
  s.push(3);
  while (!s.empty()) {
    cout << "my stack top is: " << s.pop() << endl;
  }

  s.push(4);
  s.push(5);
  s.push(6);
  while (!s.empty()) {
    int top = s.top();
    s.pop();
    cout << "my stack top is: " << top << endl;
  }
}

int main(int argc, const char * argv[]) {
  testCircleQueue();
  testMyStack();
  return 0;
}
