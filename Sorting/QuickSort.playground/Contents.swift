func quickSort(_ array: inout [Int], _ start: Int, _ end: Int) {
	if start < end {
		let partitionIndex = partition(&array, start, end)
		quickSort(&array, start, partitionIndex-1)
		quickSort(&array, partitionIndex+1, end)
	}
}

func partition(_ array: inout [Int], _ start: Int, _ end: Int) -> Int {
	let pivot = array[end]
	var partitionIndex = start
	for i in start..<end {
		if array[i] <= pivot {
			array.swapAt(i, partitionIndex)
			partitionIndex += 1
		}
	}
	array.swapAt(partitionIndex, end)
	return partitionIndex
}

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
quickSort(&numbers, 0, numbers.count-1)
