//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*
 input - 5,4 
 size of the array, 4 - number of left rotations 
 [1 2 3 4 5 ]
 
 output : 5 1 2 3 4
 because : [1 2 3 4 5 ] -> [23451] -> [34512] -> [45123] -> [51234]
 
 */


public func rotateLeft(inputArr : [Int], rotation : Int) {

    let size = inputArr.count
    if size == 0 { return }
    if rotation <= size {
        for i in rotation..<size {
            print(inputArr[i], terminator: " ")
        }
        for i in 0..<rotation {
            print(inputArr[i], terminator : " ")
        }
    }
}

rotateLeft(inputArr: [1,2,3,4,5], rotation: 4)



// Do using Command line by readLine()
public func rotateLeftCommandLine() {
    let stdin = FileHandle.standardInput
    /*
    let arraySize = readLine()
    let rotationCount = readLine()
    let arr = readLine()
    */
    let arraySize = String(data: stdin.availableData, encoding: .utf8)
    let rotationCount = String(data: stdin.availableData, encoding: .utf8)
    let arr = String(data: stdin.availableData, encoding: .utf8)
    
    if let arraySize = arraySize, let size = Int(arraySize) {
        if let rotationCount = rotationCount, let rotation = Int(rotationCount) {
            
            if let arr = arr, size > 0 && rotation <= size {
                
                for i in rotation..<size {
                    let index = arr.index(arr.startIndex, offsetBy: i)
                    print(String(arr[index]))
                }
                
                for i in 0..<rotation {
                    let index = arr.index(arr.startIndex, offsetBy: i)
                    print(String(arr[index]))
                }
            }
        }
    }
}
rotateLeftCommandLine()


