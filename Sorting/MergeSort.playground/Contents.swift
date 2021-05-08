/// - Complexity: O(nlogn)
func mergeSort(_ array: [Int]) -> [Int] {
	if (array.count == 1) {	return array }
	let mid = array.count / 2
	let left = Array<Int>(array[..<mid])
	let right = Array<Int>(array[mid...])
	return merge(mergeSort(left), mergeSort(right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
	var mergedArray: [Int] = []
	var (i, j) = (0, 0)
	print("L/R Arrays:",left,right)
	while i < left.count && j < right.count {
		print("\(left[i]) < \(right[j]) ?", terminator: " -> ")
		if left[i] < right[j] {
			print("inserting (left):", left[i])
			mergedArray.append(left[i])
			i += 1
		} else {
			print("inserting (right):", right[j])
			mergedArray.append(right[j])
			j += 1
		}
	}
	print()
	// concatinate and return any leftover values (that are already sorted)
	return mergedArray + left[i...] + right[j...]
}

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0]
mergeSort(numbers)
