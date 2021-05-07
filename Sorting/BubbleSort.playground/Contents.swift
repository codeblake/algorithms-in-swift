/// - Complexity: 0(n^2)
func bubbleSort(array: inout [Int]) -> [Int] {
	var length = array.count
	while length > 1 {
		for i in 0..<length-1 {
			if array[i] > array[i+1] {
				let temp = array[i]
				array[i] = array[i+1]
				array[i+1] = temp
			}
		}
		length -= 1
	}
	return array
}

var a = [4,3,1,2]
bubbleSort(array: &a)

