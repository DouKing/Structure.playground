//
//  MyCircleQueue.hpp
//  alg
//
//  Created by DouKing on 2018/9/29.
//

#ifndef MyCircleQueue_hpp
#define MyCircleQueue_hpp

#include <stdio.h>
class MyCircularQueue {
public:
  /** Initialize your data structure here. Set the size of the queue to be k. */
  MyCircularQueue(int k);

  /** Insert an element into the circular queue. Return true if the operation is successful. */
  bool enQueue(int value);

  /** Delete an element from the circular queue. Return true if the operation is successful. */
  bool deQueue();

  /** Get the front item from the queue. */
  int Front();

  /** Get the last item from the queue. */
  int Rear();

  /** Checks whether the circular queue is empty or not. */
  bool isEmpty();

  /** Checks whether the circular queue is full or not. */
  bool isFull();

  void description();

private:
  int *array;
  int length = 0;
  int front = -1;
  int trail = -1;
};

#endif /* MyCircleQueue_hpp */
