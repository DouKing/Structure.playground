//: [Previous](@previous)

import Foundation

public class Heap<T> {
	var values = [T]()
	private var compare: (T, T) -> Bool

	/// 根据 sort 创建堆
	///
	/// 	let heap = Heap<Int>(values: [0, 1, 2, 3, 4, 5, 6, 7]) { (parent, child) -> Bool in
	/// 		return parent > child	//父节点大于子节点，为最大堆，反之为最小堆
	///		}
	///
	/// - Parameter sort: 自定义比较，第一个参数为父节点，第二个参数为子节点
	public init(sort: @escaping (T, T) -> Bool) {
		self.compare = sort
	}

	public init(values: [T], sort: @escaping (T, T) -> Bool) {
		self.compare = sort
		build(from: values)
	}

	public var isEmpty: Bool {
		return values.isEmpty
	}

	public var count: Int {
		return values.count
	}


	/// 获取堆顶元素
	/// - Returns: Optional T
	public func peek() -> T? {
		return values.first
	}

	public func insert(_ value: T) {
		values.append(value)
		shiftUp(count - 1)
	}

	public func insert<S: Sequence>(_ values: S) where S.Element == T {
		for value in values {
			insert(value)
		}
	}

	/// 移除堆顶元素
	public func remove() -> T? {
		guard !isEmpty else {
			return nil
		}

		if count == 1 {
			return values.removeLast()
		}

		let value = values[0]
		values[0] = values.removeLast()
		//自上而下的下滤
		shiftDown(0)
		return value
	}

	private func build(from array: [T]) {
		values = array
		//自下而上的上滤
		for i in stride(from: (array.count >> 1) - 1, through: 0, by: -1) {
			shiftDown(i)
		}
	}

	//上滤
	private func shiftUp(_ index: Int) {
		let e = values[index]
		var i = index
		while i > 0 {
			let parentIndex = self.parentIndex(ofIndex: i)
			let parent = values[parentIndex]
			if compare(parent, e) {
				break
			}
			values[i] = parent
			i = parentIndex
		}
		values[i] = e
	}

	//下滤
	private func shiftDown(_ index: Int) {
		let size = count
		let e = values[index]
		let half = size >> 1
		var i = index
		while i < half { //必须是非叶子节点
			//左子节点下标
			var childIndex = leftChildIndex(ofIndex: i)
			var child = values[childIndex] //默认取左边

			//右子节点下标
			let rightIndex = childIndex + 1
			if rightIndex < size && compare(values[rightIndex], child) {
				child = values[rightIndex]
				childIndex = rightIndex
			}

			if compare(e, child) {
				break
			}
			values[i] = child
			i = childIndex
		}
		values[i] = e
	}

	@inline(__always) private func parentIndex(ofIndex i: Int) -> Int {
		return (i - 1) >> 1
	}

	@inline(__always) private func leftChildIndex(ofIndex i: Int) -> Int {
		return (i << 1) + 1
	}

	@inline(__always) private func rightChildIndex(ofIndex i: Int) -> Int {
		return (i << 1) + 2
	}
}

let heap = Heap<Int>(values: [0, 1, 2, 3, 4, 5, 6, 7]) { (parent, child) -> Bool in
	return parent > child
}

print(heap.values)

//: [Next](@next)
