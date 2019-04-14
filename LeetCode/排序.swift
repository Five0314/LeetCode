//
//  排序.swift
//  LeetCode
//
//  Created by 董伍 on 2019/4/13.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

class CNSSort{
    class func 冒泡排序(_ arr: inout [Int]){
        
        var m = 0
        
        let c = arr.count - 1
        for e in stride(from: c, to: 0, by: -1){
            for s in 0..<e - 1{
                if arr[s] > arr[s + 1]{
                    m = arr[s + 1]
                    arr[s + 1] = arr[s]
                    arr[s] = m
                }
            }
        }
        
        //        while c > 0{
        //            for s in 0..<c{
        //                print("\(c)   \(s)")
        //
        //                if arr[s] > arr[s + 1]{
        //                    m = arr[s + 1]
        //                    arr[s + 1] = arr[s]
        //                    arr[s] = m
        //                }
        //            }
        //
        //            c -= 1
        //        }
    }
    
    /// 找到最小的数上浮
    class func 选择排序(_ arr: inout [Int]){
        var dv = Int.min
        var di = 0
        
        let c = arr.count
        for s in 0..<c{
            
            dv = arr[s]
            di = s
            for i in s..<c{
                if dv > arr[i]{
                    dv = arr[i]
                    di = i
                }
            }
            arr[di] = arr[s]
            arr[s] = dv
        }
    }
    
    class func 插入排序(_ arr: inout [Int]){
        let c = arr.count
        var compareValue = 0
        var compareIndex = 0
        for s in 1..<c{
            compareValue = arr[s]
            compareIndex = s - 1
            while compareIndex >= 0 && compareValue < arr[compareIndex]{
                arr[compareIndex + 1] = arr[compareIndex]
                compareIndex -= 1
            }
            arr[compareIndex + 1] = compareValue
        }
    }
    
    class func 希尔排序(_ arr: inout [Int]){
        
    }
    
    class func 快速排序(_ arr: inout [Int]){
        var ranges = [(0, arr.count - 1)]
        
        var mv = 0
        
        while !ranges.isEmpty{
            let v = ranges.removeFirst()
            
            let newRanges = self.快速排序_分割(&arr, l: v.0, r: v.1, mv: &mv)
            if !newRanges.isEmpty{
                ranges.insert(contentsOf: newRanges, at: 0)
            }
        }
    }
    
    class func 快速排序_分割(_ arr: inout [Int], l: Int, r: Int, mv: inout Int) -> [(Int, Int)] {
        if r <= l{
            return []
        }
        
        if r == l + 1{
            if arr[l] > arr[r]{
                mv = arr[r]
                arr[r] = arr[l]
                arr[l] = mv
            }
            
            return []
        }
        
        let compareValue = arr[l]
        
        var startIndexOfBiggerValue = l + 1
        
        for i in startIndexOfBiggerValue...r{
            if arr[i] < compareValue{
                
                mv = arr[startIndexOfBiggerValue]
                arr[startIndexOfBiggerValue] = arr[i]
                arr[i] = mv
                
                startIndexOfBiggerValue += 1
            }
        }
        
        arr[l] = arr[startIndexOfBiggerValue - 1]
        arr[startIndexOfBiggerValue - 1] = compareValue
        
        return [(l, startIndexOfBiggerValue - 2), (startIndexOfBiggerValue, r)]
    }
    
    class func 归并排序(_ arr: inout [Int]){
        
    }
    
    class func 堆排序(_ arr: inout [Int]){
        
    }
    
    class func 计数排序(_ arr: inout [Int]){
        
    }
    
    class func 桶排序(_ arr: inout [Int]){
        
    }
    
    class func 基数排序(_ arr: inout [Int]){
        
    }
}


//extension CNSSort{
//    class func swap(_ arr: inout [Int], in idx1: Int, and idx2: Int) {
//
//    }
//}
