//
//  排序.swift
//  LeetCode
//
//  Created by 董伍 on 2019/4/13.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

class CNSSort{
    /// 重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
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
    
    /// 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。
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
    
    /// 通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
    class func 插入排序(_ arr: inout [Int]){
        self.插入排序(&arr, startIndex: 0, count: arr.count, d: 1)
    }
    
    fileprivate class func 插入排序(_ arr: inout [Int], startIndex: Int, count: Int, d: Int){
        var compareValue = 0
        var compareIndex = 0

        for s in stride(from: startIndex, to: count - d, by: d){
            compareValue = arr[s + d]
            compareIndex = s
            while compareIndex >= startIndex && compareValue < arr[compareIndex]{
                arr[compareIndex + d] = arr[compareIndex]
                compareIndex -= d
            }
            arr[compareIndex + d] = compareValue
        }
    }
    
    /// 先对数据进行分组（分组间隔先大后小，一般采用 / 2），再在每个分组内进行插入排序
    class func 希尔排序(_ arr: inout [Int]){
        let c = arr.count
        var d = c / 3 + 1
        
        repeat {
            for i in 0..<d{
                self.插入排序(&arr, startIndex: i, count: c, d: d)
            }
            
            if d == 1{
                break
            }
            
            // 除了1之外尽量做到它们没有公约数
            d = (5 * d - 1) / 11
        } while(d >= 1)
    }
    
    /// 通过一趟排序将待排记录分隔成独立的两部分，其中一部分记录的关键字均比另一部分的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序。
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
    
    fileprivate class func 快速排序_分割(_ arr: inout [Int], l: Int, r: Int, mv: inout Int) -> [(Int, Int)] {
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
