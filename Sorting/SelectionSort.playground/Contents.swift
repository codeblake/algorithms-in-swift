var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0]

/// - Complexity: O(n^2)
func selectionSort(_ array: inout [Int]) {
	print(array)
	for i in 0..<array.count-1 {
		var min = array[i]
		var minIndex = 0
		for j in i+1..<array.count {
			print("Comparing", min, array[j])
			if array[j] < min {
				print("\(array[j]) is now min")
				min = array[j]
				minIndex = j
			}
		}
		let temp = array[i]
		print("Swapping \(temp) with \(min)")
		array[i] = min
		array[minIndex] = temp
		print(array)
		print()
	}
}

selectionSort(&numbers)
