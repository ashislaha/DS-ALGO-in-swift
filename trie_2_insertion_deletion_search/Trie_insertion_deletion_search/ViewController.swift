//
//  ViewController.swift
//  Trie_insertion_deletion_search
//
//  Created by Ashis Laha on 15/11/17.
//  Copyright © 2017 Ashis Laha. All rights reserved.
//

import UIKit

class TrieNode {
	var dict : [String : TrieNode] = [:]
}

class Trie {
	var root : TrieNode?
	
	// Do insertion
	func insertion(input : String, root : TrieNode?) -> TrieNode? {
		
		guard let root = root else { return nil }
		
		var traversal = root
		
		for i in 0..<input.count {
			
			let index = input.index(input.startIndex, offsetBy: i)
			let each = String(input[index]) // char to String conversion
			
			// 1. check whethe the "char" is present in the dictionary or not
			if let nextNode = traversal.dict[each] {
				traversal = nextNode
			} else {
				// not present in the dictionary - add it
				let trieNode = TrieNode()
				traversal.dict[each] = trieNode
				traversal = trieNode
			}
		}
		
		return root
	}
	
	// print the trie
	func printTrie(root : TrieNode?) {
		guard let root = root else {
			return
		}
		
		root.dict.forEach({ (key,value) in
			print("\(key) --> ", terminator: "")
			printTrie(root: value)
		})
		print("\n")
	}
	
	// Do Search
	func search(input : String, root : TrieNode?) -> Bool {
		
		guard let root = root, !input.isEmpty else { return false }
		
		var match = true
		var traversal: TrieNode? = root
		
		for char in input {
			let each = String(char)
			
			if let nextNode = traversal?.dict[each] {
				traversal = nextNode
			} else {
				match = false
				break
			}
		}
		return match
	}
	
	func searchRecursive(_ word: String, root: TrieNode) -> Bool {
		
		guard !word.isEmpty && !root.dict.isEmpty else { return false }
		var match = true
		
		let index = word.index(word.startIndex, offsetBy: 0)
		let input = String(word[index])
		
		var nextInput = ""
		if word.count != 1 {
			let nextIndex = word.index(word.startIndex, offsetBy: 1)
			let endIndex = word.index(word.startIndex, offsetBy: word.count-1)
			nextInput = String(word[nextIndex...endIndex])
		}
		
		
		if let nextNode = root.dict[input] {
			
			let result = nextInput.isEmpty ? true: searchRecursive(nextInput, root: nextNode)
			match = match && result
			
		} else {
			
			if input == "." {
				
				if !nextInput.isEmpty {
					// go through all the keys
					var dotResult = false
					for (_, value) in root.dict {
						dotResult = dotResult || searchRecursive(nextInput, root: value)
					}
					match = dotResult
				}
				
			} else { // different input
				match = false
			}
		}
		
		return match
	}

}

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let trie = Trie()
		trie.root = TrieNode()
		
		let array = ["ashis", "kamal", "nihar", "tiger", "lion", "bird", "ass", "kunal"]
		array.forEach { (each) in
			trie.root =  trie.insertion(input: each, root: trie.root)
		}
		trie.printTrie(root: trie.root)
		let searchItem = "tiger"
		print("find \(searchItem) : \(trie.search(input: searchItem, root: trie.root))")
		
		/*
		let str = "ashis"
		let index = str.index(str.startIndex, offsetBy: 1)
		let endIndex = str.index(str.startIndex, offsetBy: str.count - 1)
		let substr = str[index...endIndex]
		print(substr)
		*/
		
		
		/*
		trie.root = TrieNode()
		let recursiveInput = ["bad", "dad", "mad"]
		for each in recursiveInput {
			trie.root = trie.insertion(input: each, root: trie.root)
		}
		
		
		let a = trie.searchRecursive("pad", root: trie.root!)
		print(a)
		let b = trie.searchRecursive("d..", root: trie.root!)
		print(b)
		
		let b2 = trie.searchRecursive("d.d", root: trie.root!)
		print(b2)
		
		let c = trie.searchRecursive("bad", root: trie.root!)
		print(c)
		*/
		
		trie.root = TrieNode()
		let recursiveInput = ["a"]
		for each in recursiveInput {
			trie.root = trie.insertion(input: each, root: trie.root)
		}
		
		
		let a = trie.searchRecursive("a", root: trie.root!)
		print(a)
		let b = trie.searchRecursive("aa", root: trie.root!)
		print(b)

		let b2 = trie.searchRecursive("a.", root: trie.root!)
		print(b2)
		
		let c = trie.searchRecursive(".a", root: trie.root!)
		print(c)
		
	}
}

