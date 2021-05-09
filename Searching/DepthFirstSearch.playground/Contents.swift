/* Depth First Search (DFS)
   ========================
         9
       /   \
     4      20
    / \    /  \
   1   6  15  170

   Inorder:   [1, 4, 6, 9, 15, 20, 170]
   Preorder:  [9, 4, 1, 6, 20, 15, 170]
   PostOrder: [1, 6, 4, 15, 170, 20, 9]
*/

//
//func traverseInOrder(_ node: Node, _ list: [Int]) -> list {
//	print(node.value)
//	if let left = node.left {
//		traverseInOrder(left, list)
//	}
//	list.push(node.value)
//	if let right = node.right {
//		traverseInOrder(right, list)
//	}
//	list.push(node.value)
//	return list
//}


/// Traverse in order and print value
func inOrder(_ node: Node?, _ list: inout [Int]) -> [Int] {
	if node == nil { return list}
	inOrder(node?.left,&list)
	list.append(node!.value)
	inOrder(node?.right,&list)
	return list
}

func preOrder(_ node: Node?, _ list: inout [Int]) -> [Int] {
	if node == nil { return list }
	list.append(node!.value)
	preOrder(node?.left,&list)
	preOrder(node?.right,&list)
	return list
}

func postOrder(_ node: Node?, _ list: inout [Int]) -> [Int] {
	if node == nil { return list }
	postOrder(node?.left,&list)
	postOrder(node?.right,&list)
	list.append(node!.value)
	return list
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

// In Order Traversal
var a: [Int] = []
inOrder(bt.root!,&a)

// Pre Order Traversal
var b: [Int] = []
preOrder(bt.root!,&b)

// Pre Order Traversal
var c: [Int] = []
postOrder(bt.root!,&c)






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

