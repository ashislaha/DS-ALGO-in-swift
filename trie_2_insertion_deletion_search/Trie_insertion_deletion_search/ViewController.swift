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
		
		var traversal: TrieNode? = root
		
		for i in 0..<input.count {
			
			let index = input.index(input.startIndex, offsetBy: i)
			let each = String(input[index]) // char to String conversion
			
			// 1. check whethe the "char" is present in the dictionary or not
			if let nextNode = traversal?.dict[each] {
				traversal = nextNode
			} else {
				// not present in the dictionary - add it
				let trieNode = TrieNode()
				traversal?.dict[each] = trieNode
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
	}
}

