//
//  main.cpp
//  cpp
//
//  Created by DouKing on 2018/9/30.
//

#include <iostream>
#include "MyCircleQueue.hpp"
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

int main(int argc, const char * argv[]) {
  testCircleQueue();
  return 0;
}
