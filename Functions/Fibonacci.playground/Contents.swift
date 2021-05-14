// 0,1,1,2,3,5,8,13,21,34,55,89,144...
var calculations = 0

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
	calculations += 1
	if n < 2 { return n	}
	return fibonacciRecursive(n: n-2) + fibonacciRecursive(n: n-1)
}

print("Recusive: fib(10) = \(fibonacciRecursive(n: 10)) and took \(calculations) calculations.")

calculations = 0
// Dynamic
func dynamicFib() -> ((Int) -> (Int)) {
	struct cache {
		static var calls: [Int:Int] = [:]
	}
	func fib(_ n: Int) -> Int {
		calculations += 1
		if cache.calls[n] != nil {
			return cache.calls[n]!
		} else {
			if n < 2 {
				return n
			} else {
				cache.calls[n] = fib(n-1) + fib(n-2)
				return cache.calls[n]!
			}
		}


	}
	return fib
}

var fasterFib = dynamicFib()
print("Dynamic: fib(10) = \(fasterFib(10)) and took \(calculations) calculations")
