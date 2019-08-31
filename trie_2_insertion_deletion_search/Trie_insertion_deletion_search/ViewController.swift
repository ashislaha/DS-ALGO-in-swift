//
//  ViewController.swift
//  Trie_insertion_deletion_search
//
//  Created by Ashis Laha on 15/11/17.
//  Copyright © 2017 Ashis Laha. All rights reserved.
//

import UIKit

class TrieNode {
    
    var childDictionary : [String : TrieNode]? // if there is no child then it's leaf node
    
    init(childKey : String?, childValue : TrieNode?) {
        if let childKey = childKey {
            var dict = [String : TrieNode]()
            dict[childKey] = childValue
            self.childDictionary = dict
        }
    }
}

class Trie {
    var root : TrieNode?
    
    // Do insertion
    func insertion(input : String, root : TrieNode?) -> TrieNode? {
        
        guard let root = root else { return nil }
        var traversal : TrieNode? = root
        
        // for each char, if child present then traverse else add a new node and proceed, at the last string mark it as a leaf node (if childDict is nil)
        for i in 0..<input.count {
            let each = String(input[input.index(input.startIndex, offsetBy: i)])
            print("\(each)")
            
            if traversal?.childDictionary == nil {
                print("Insert a new node")
                var dict = [String : TrieNode]()
                dict[each] = TrieNode(childKey: nil, childValue: nil)
                traversal?.childDictionary = dict
                // do traversal
                traversal = traversal?.childDictionary?[each]
                
            } else if let isPresent = traversal?.childDictionary?.keys.contains(each), isPresent {
                print("Key present, only traversal")
                traversal = traversal?.childDictionary?[each]
                
            } else { 
                print("child present, but key is not present, add a new key)")
                traversal?.childDictionary?[each] = TrieNode(childKey: nil, childValue: nil)
                traversal = traversal?.childDictionary?[each]
            }
        }
        
        return root
    }
    
    // print the trie
    func printTrie(root : TrieNode?) {
        guard let root = root, let childDict = root.childDictionary else { return }
        childDict.forEach({ (key,value) in
            print("key : \(key)")
            printTrie(root: value)
        })
    }
    
    // Do Search
    func search(input : String, root : TrieNode?) -> Bool {
        guard let root = root, let _ = root.childDictionary , !input.isEmpty else { return false }
        var match = true
        var traversal : TrieNode? = root
        for char in input {
            let each = String(char)
            if let isPresent = traversal?.childDictionary?.keys.contains(each), !isPresent {
                match = false
                break
            } else if traversal?.childDictionary == nil {
                match = false
                break
            } else {
                traversal = traversal?.childDictionary?[each]
            }
        }
        return match
    }
    
    // Do delete
    func delete(input : String, root : TrieNode?) {
       
        // delete those element that are leaf in nature, must not be a prefix of any other input, it happens in bottom-up fashion.
        if root?.childDictionary == nil {
            // this is a leaf node, remove this node
           
        } else {
            
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trie = Trie()
        trie.root = TrieNode(childKey: nil, childValue: nil)
        
        let array = ["ashis", "kamal", "nihar", "tiger", "lion", "bird", "ass", "kunal"]
        array.forEach { (each) in
            trie.root =  trie.insertion(input: each, root: trie.root)
        }
        trie.printTrie(root: trie.root)
        let searchItem = "tiger"
        print("find \(searchItem) : \(trie.search(input: searchItem, root: trie.root))")
    }
}

