// 0,1,1,2,3,5,8,13,21,34,55,89,144...

/// O(n)
func fibonacciIterative(n: Int) -> Int {
	if n < 2 { return n }
	var a = 0
	var b = 1
	var result = 0
	for _ in 2 ... n {
		result = a + b
		a = b
		b = result
	}
	return result
}


func fibonacciRecursive(n: Int) -> Int {
	if n < 2 { return n	}
	return fibonacciRecursive(n: n-2) + fibonacciRecursive(n: n-1)
}

print(fibonacciIterative(n: 12))
print(fibonacciRecursive(n: 12))
