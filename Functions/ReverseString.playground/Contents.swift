func reverseStringIterativly(_ string: String) -> String {
	var newString = ""
	for c in string {
		newString = String(c) + newString
	}
	return newString
}

func reverseStringRecursively(_ string: String) -> String {
	if string.count == 1 { return string }
	let substring = String(string.suffix(string.count-1))
	return reverseStringRecursively(substring) + "\(string.first!)"
}

reverseStringIterativly("hello")
reverseStringRecursively("hello")
