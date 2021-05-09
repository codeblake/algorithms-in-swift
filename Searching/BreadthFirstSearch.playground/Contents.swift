/* Breadth First Search (BFS)

       9
     /   \
   4      20
  / \    /  \
 1   6  15  179

 BFS: [9,4,20,1,6,15,179]
*/

/// Breadth First Search
func bfs(_ root: Node) -> [Int] {
	var currentNode = root
	var list: [Int] = []
	var queue: [Node] = []
	queue.append(currentNode)
	while !queue.isEmpty {
		currentNode = queue.removeFirst()
		list.append(currentNode.value)
		if let left = currentNode.left {
			queue.append(left)
		}
		if let right = currentNode.right {
			queue.append(right)
		}

	}
	return list
}

func bfsR(_ queue: inout [Node], _ list: inout [Int]) -> [Int] {
	if queue.isEmpty { return list }
	let currentNode = queue.removeFirst()
	list.append(currentNode.value)
	if let left = currentNode.left {
		queue.append(left)
	}
	if let right = currentNode.right {
		queue.append(right)
	}
	return bfsR(&queue, &list)
}

// TESTING --------------------------------------------------------------------------------

// Create binary tree with root value
let bt = BinarySearchTree()

// INSERT
bt.insert(9)
bt.insert(4)
bt.insert(6)
bt.insert(20)
bt.insert(170)
bt.insert(15)
bt.insert(1)

// BFS
bfs(bt.root!)

var q: [Node] = []
q.append(bt.root!)
var l: [Int] = []
bfsR(&q,&l)

// Data Structure --------------------------------------------------------------------------
class Node {
	var left: Node?
	var right: Node?
	var value: Int
	var isLeaf: Bool { left == nil && right == nil }
	var parent: Node?

	init(_ value: Int) {
		self.value = value
	}
}

class BinarySearchTree {
	var root: Node?

	init() { }

	init(root: Int) {
		self.root = Node(root)
	}

	/// Insert a value
	func insert(_ value: Int) {
		// when the tree is empty, insert the root node
		guard var node = root else {
			root = Node(value)
			return
		}

		// Loop through the tree to find where to insert the new value
		while true {
			// if less than or equal go left
			if value <= node.value {
				// if left is nil insert new node
				guard let left = node.left else {
					node.left = Node(value)
					node.left!.parent = node
					return
				}
				node = left
			}

			// if greater than go right
			if value > node.value {
				// if right is nil insert new node
				guard let right = node.right else {
					node.right = Node(value)
					node.right!.parent = node
					return
				}
				node = right
			}
		}
	}

	/// Lookup - search for a value
	func lookup(_ value: Int) -> Node? {
		guard var node = root else {
			return nil
		}
		while true {
			// if found, return found node
			if value == node.value{
				return node
			}

			// go left if value less than current node
			if value < node.value && node.left != nil {
				node = node.left!
				continue
			}

			// go right if value is greater-than current node
			if value > node.value && node.right != nil {
				node = node.right!
				continue
			}

			// if nothing found return nil
			return nil
		}
	}

	@discardableResult
	func remove(_ root: inout Node?, _ value: Int) -> Node? {
		// Return if nil
		guard var node = root else { return root }

		// Search for value
		if value < node.value {
			node.left = remove(&node.left, value)
		} else if value > node.value {
			node.right = remove(&node.right, value)
		}
		// When value found
		else {
			// case 1: no child
			if node.isLeaf {
				// have to use 'root' instead of 'node' to assign nil
				root = nil
			}
			// case 2: has one child
			else if node.left == nil {
				node = node.right!
			}
			else if node.right == nil {
				node = node.left!
			}
			// case 3: has two children
			else {
				let temp = findMin(from: node.right!)
				node.value = temp.value
				node.right = remove(&node.right, temp.value)
			}
		}
		return root
	}


	func findMin(from root: Node) -> Node {
		var temp = root
		while temp.left != nil {
			temp = temp.left!
		}
		return temp
	}
}

/// Traverse in order and print value
func traverseInOrder(_ node: Node?) {
	if node == nil { return }
	traverseInOrder(node?.left)
	print(node!.value, terminator: " ")
	traverseInOrder(node?.right)
}
