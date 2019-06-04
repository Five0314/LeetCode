//
//  排序.swift
//  LeetCode
//
//  Created by 董伍 on 2019/4/13.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

class CNSSort{
    static let shared: CNSSort = CNSSort()
    
    /// 重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
    func 冒泡排序(_ arr: inout [Int]){
        
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
    func 选择排序(_ arr: inout [Int]){
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
    func 插入排序(_ arr: inout [Int]){
        self.插入排序(&arr, startIndex: 0, count: arr.count, d: 1)
    }
    
    fileprivate func 插入排序(_ arr: inout [Int], startIndex: Int, count: Int, d: Int){
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
    func 希尔排序(_ arr: inout [Int]){
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
    func 快速排序(_ arr: inout [Int]){
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
    
    fileprivate func 快速排序_分割(_ arr: inout [Int], l: Int, r: Int, mv: inout Int) -> [(Int, Int)] {
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
    
    /// 采用分治法 - 将已有序的子序列合并，得到完全有序的序列
    func 归并排序(_ arr: inout [Int]){
        var temp: [Int] = [Int].init(repeating: 0, count: arr.count)
        
        let c = arr.count - 1
        self.归并排序_递归(&arr, left: 0, right: c, temp: &temp)
    }
    
    fileprivate func 归并排序_递归(_ arr: inout [Int], left: Int, right: Int, temp: inout [Int]){
        if right > left{
            let mi = (right + left) / 2
            self.归并排序_递归(&arr, left: left, right: mi, temp: &temp)
            self.归并排序_递归(&arr, left: mi + 1, right: right, temp: &temp)
            
            self.归并排序_子排序(&arr, r1: (left, mi), r2: (mi + 1, right), temp: &temp)
        }
    }
    
    fileprivate func 归并排序_子排序(_ arr: inout [Int], r1 : (Int, Int), r2: (Int, Int), temp: inout [Int]){
        
        var m: Int = r1.0
        var i1: Int = r1.0
        var i2: Int = r2.0
        
        while i1 <= r1.1 && i2 <= r2.1{
            if arr[i2] < arr[i1]{
                temp[m] = arr[i2]
                i2 += 1
            }
            else{
                temp[m] = arr[i1]
                i1 += 1
            }

            m += 1
        }

        if i1 <= r1.1{
            for i in i1...r1.1{
                temp[m] = arr[i]
                m += 1
            }
        }
        
        // 排序好的值还原至原数组中
        for i in r1.0...r2.1{
            arr[i] = temp[i]
        }
    }
    
    /// 二叉树
    func 堆排序(_ arr: inout [Int]){
        var temp: Int = 0
        var ei = arr.count - 1
        
        for i in stride(from: ei, to: 0, by: -1){
            self.堆排序_大数上浮(&arr, index: i, temp: &temp)
        }
        
        
        while ei > 0{
            self.堆排序_数据交换(&arr, index1: 0, index2: ei, temp: &temp)
            
            ei -= 1
            
            self.堆排序_小数下沉(&arr, index: 0, maxIndex: ei, temp: &temp)
        }
    }
    
    func 堆排序_大数上浮(_ arr: inout [Int], index: Int, temp: inout Int) {
        guard index > 0 else {
            return
        }
        
        let parentIndex = (index - 1) / 2
        if arr[parentIndex] < arr[index]{
            temp = arr[parentIndex]
            arr[parentIndex] = arr[index]
            arr[index] = temp
            
            self.堆排序_大数上浮(&arr, index: parentIndex, temp: &temp)
        }
    }
    
    func 堆排序_小数下沉(_ arr: inout [Int], index: Int, maxIndex: Int, temp: inout Int) {
        let lidx: Int = index * 2 + 1
        let ridx: Int = lidx + 1
        
        if lidx <= maxIndex && ridx <= maxIndex{
            if arr[ridx] > arr[lidx]{
                if arr[index] < arr[ridx]{
                    self.堆排序_数据交换(&arr, index1: index, index2: ridx, temp: &temp)
                    
                    self.堆排序_小数下沉(&arr, index: ridx, maxIndex: maxIndex, temp: &temp)
                }
            }
            else{
                if arr[index] < arr[lidx]{
                    self.堆排序_数据交换(&arr, index1: index, index2: lidx, temp: &temp)
                    
                    self.堆排序_小数下沉(&arr, index: lidx, maxIndex: maxIndex, temp: &temp)
                }
            }
        }
        else if lidx <= maxIndex {
            if arr[index] < arr[lidx]{
                self.堆排序_数据交换(&arr, index1: index, index2: lidx, temp: &temp)
                
                self.堆排序_小数下沉(&arr, index: lidx, maxIndex: maxIndex, temp: &temp)
            }
        }
        else if ridx <= maxIndex{
            if arr[index] < arr[ridx]{
                self.堆排序_数据交换(&arr, index1: index, index2: ridx, temp: &temp)
                
                self.堆排序_小数下沉(&arr, index: ridx, maxIndex: maxIndex, temp: &temp)
            }
        }
    }
    
    func 堆排序_数据交换(_ arr: inout [Int], index1: Int, index2: Int, temp: inout Int){
        temp = arr[index1]
        arr[index1] = arr[index2]
        arr[index2] = temp
    }
    
    func 计数排序(_ arr: inout [Int]){
        
    }
    
    func 桶排序(_ arr: inout [Int]){
        
    }
    
    func 基数排序(_ arr: inout [Int]){
        
    }
}
