//
//  MyCircleQueue.cpp
//  alg
//
//  Created by DouKing on 2018/9/29.
//

#include "MyCircleQueue.hpp"
#include <iostream>
using namespace std;

/** Initialize your data structure here. Set the size of the queue to be k. */
MyCircularQueue::MyCircularQueue(int k) {
  length = k;
  array = new int[k];
  for (int i = 0; i < length; i++) {
    array[i] = NULL;
  }
}

/** Insert an element into the circular queue. Return true if the operation is successful. */
bool MyCircularQueue::enQueue(int value) {
  if (isFull()) {
    return false;
  }
  trail++;
  if (trail >= length) {
    trail = 0;
  }
  array[trail] = value;
  if (front < 0) {
    front = 0;
  }
  return true;
}

/** Delete an element from the circular queue. Return true if the operation is successful. */
bool MyCircularQueue::deQueue() {
  if (isEmpty()) {
    return false;
  }
  array[front] = NULL;

  if (front == trail) {
    front = -1;
    trail = -1;
  } else {
    front++;
  }
  return true;
}

/** Get the front item from the queue. */
int MyCircularQueue::Front() {
  if (isEmpty()) {
    return -1;
  }
  return array[front];
}

/** Get the last item from the queue. */
int MyCircularQueue::Rear() {
  if (isEmpty()) {
    return -1;
  }
  return array[trail];
}

/** Checks whether the circular queue is empty or not. */
bool MyCircularQueue::isEmpty() {
  return front < 0 && trail < 0;
}

/** Checks whether the circular queue is full or not. */
bool MyCircularQueue::isFull() {
  return (trail - front == length - 1) || (front - trail == 1);
}

void MyCircularQueue::description() {
  cout << "front is " << front << endl;
  cout << "trail is " << trail << endl;
  for (int i = 0; i < length; i++) {
    cout << "the value at " << i << " is: " << array[i] << endl;
  }
  cout << endl;
}
