import Foundation

/*
    we know no one will ask about Merge sort. But it is still worthy to think about divide and conquer problem.
    I think, to revise the concept, we can visit Merge Sort one more time
 
    Time Complexity = O(nLogn)
    Space complexity = O(n)
 */

class QuickSort {
    
    private var array: [Int]
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func sort() -> [Int] {
        print(array)
        guard !self.array.isEmpty else { return [] }
        quickSort(low: 0, high: array.count-1)
        return array
    }
    
    private func quickSort(low: Int, high: Int) {
        guard low < high else { return }
        
        let mid = (low + high) / 2
        quickSort(low: low, high: mid)
        quickSort(low: mid + 1, high: high)
        merge(low: low, mid: mid, high: high)
    }
    private func merge(low: Int, mid: Int, high: Int) {
        // copy the array into 2 sub-array [low to mid] and [mid+1 to high]
        // merge those 2 sub-array
        print(low, mid, high)
        
        let size1 = mid - low
        let size2 = high - mid - 1
        
        var A: [Int] = []
        for i in 0...size1 {
            A.append(array[i])
        }
        
        var B: [Int] = []
        for i in 0...size2 {
            B.append(array[i+mid+1])
        }
        
        // merge it
        var i = 0
        var j = 0
        var k = low // this is important because we are using the same array for result.
        while i <= size1 && j <= size2 {
            if A[i] < B[j] {
                array[k] = A[i]
                i = i + 1
                k = k + 1
            } else {
                array[k] = B[j]
                k = k + 1
                j = j + 1
            }
        }
        // add the remaining
        if i <= size1 {
            for l in i...size1 {
                array[k] = A[l]
                k = k + 1
            }
        }
        
        if j <= size2 {
            for l in i...size2 {
                array[k] = A[i]
                k = k + 1
            }
        }
        
    }
}

let quickSort = QuickSort(array: [5,10,7,2,12,4])
print(quickSort.sort())
