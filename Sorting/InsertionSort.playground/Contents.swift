/// - Complexity: O(n^2)
func insertionSort(_ array: inout [Int]) {
	for i in 0 ..< array.count-1 {
		print(array)
		var j = i+1
		while j > 0 {
			print("Comparing:", array[j], array[j-1])
			if array[j] < array[j-1] {
				print("Swapping:", array[j],array[j-1])
				let temp = array[j]
				array[j] = array[j-1]
				array[j-1] = temp
				j -= 1
			} else {
				print("No swap")
				break
			}
		}
		print()
	}
}

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0]
insertionSort(&numbers)
