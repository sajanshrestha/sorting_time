//
//  AlgorithmBank.swift
//  Sorting Time
//
//  Created by Sajan Shrestha on 11/2/19.
//  Copyright © 2019 Sajan Shrestha. All rights reserved.
//

import Foundation

struct AlgorithmBank {
    
    
    static func BubbleSortOne(array: [Int]) -> Double {
        
        var arrayToSort = array
        let startTime = DispatchTime.now()
        
        for _ in 0 ..< arrayToSort.count - 1 {
            for index in 0 ..< arrayToSort.count - 1 {
                if arrayToSort[index] > arrayToSort[index + 1] {
                    let temp = array[index]
                    arrayToSort[index] = arrayToSort[index + 1]
                    arrayToSort[index + 1] = temp
                }
            }
        }
        
        let endTime = DispatchTime.now()
        
        
        return Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        
        
    }
    
    static func BubbleSortTwo(array: [Int]) -> Double {
        
        
        var arrayToSort = array
        let startTime = DispatchTime.now()
        
        for index in 0 ..< arrayToSort.count - 1 {
            for value in 0 ..< arrayToSort.count - 1 - index {
                if arrayToSort[value] > arrayToSort[value + 1] {
                    let temp = array[value]
                    arrayToSort[value] = arrayToSort[value + 1]
                    arrayToSort[value + 1] = temp
                }
            }
        }
        
        let endTime = DispatchTime.now()
        
        return Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        
        
        
    }
    
    static func BubbleSortThree(array: [Int]) -> Double {
        
        var arrayToSort = array
        let startTime = DispatchTime.now()
        
        var index = 0
        var flag = true
        
        while flag && index < arrayToSort.count - 1 {
            flag = false
            for value in 0 ..< arrayToSort.count - 1 - index {
                if arrayToSort[value] > arrayToSort[value + 1] {
                    let temp = arrayToSort[value]
                    arrayToSort[value] = arrayToSort[value + 1]
                    arrayToSort[value + 1] = temp
                    flag = true
                }
            }
            index += 1
        }
        
        let endTime = DispatchTime.now()
        
        return Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        
    }
    
    static func SwiftBuiltInSort(array: [Int]) -> Double {
        
        var arrayToSort = array
        let startTime = DispatchTime.now()
        
        arrayToSort.sort()
        
        let endTime = DispatchTime.now()
        
        return Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        
    }
   
    
    static func MergeSort(array: [Int]) -> Double {
        0.1
    }
    
    static func QuickSort(array: [Int]) -> Double {
        0.1
    }
    
    
}
