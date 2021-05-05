// 5! = 5 * 4 * 3 * 2 * 1

/// O(n)
func findFactorialIteratively(number: Int) -> Int {
	if number == 2 {
		return 2
	}
	var answer = 1
	for i in 2...number {
		answer *= i
	}
	return answer
}

/// O(n)
func findFactorialRecusively(number: Int) -> Int {
	if number == 2 {
		return 2
	}
	return number * findFactorialRecusively(number: number - 1)
}

print("Iteratively:",findFactorialIteratively(number: 5))

print("Recursively:",findFactorialRecusively(number: 5))
