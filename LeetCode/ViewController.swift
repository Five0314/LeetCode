//
//  ViewController.swift
//  LeetCode
//
//  Created by 董伍 on 2019/2/21.
//  Copyright © 2019 奇异的炸酱面. All rights reserved.
//
// https://www.cnblogs.com/strengthen/p/9895524.html

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.回文()
//        self._4()
        
//        self.findNum([1])
        
        
        
        
        print(LeedCode.shared._169([1, 2, 2, 3, 2]))
    }
    
    func _4(){
        let arr1 = [1, 2]
        let arr2 = [3, 4]
        
        print(LeedCode.shared._4(arr1, arr2))
    }
    
    func 回文(){

//        DispatchQueue.global().async {
//            let a = ["", "a", "aa", "ba", "aaa", "aaaa", "aaaaa", "adcba", "ababbbabbaba", "babbbabbaba", "aaaabbaa"]
//            let b = ["", "a", "aa", "aba", "aaa", "aaaa", "aaaaa", "abcdadcba", "ababbabbbababbbabbaba", "ababbabbbabbaba", "aabbaaaabbaa"]
//
//            let t2 = Date().timeIntervalSince1970
//            for (i, item) in a.enumerated(){
//                let v = LeedCode.shared._214(item)
//                //                print("KMP \(v == b[i]) : \(v)   \(b[i])")
//            }
//
//            print(" ----- KMP \(Date().timeIntervalSince1970 - t2) ")
//        }
    }
    
    func 排序(){
        var a = [23, 12, 34, 2, 67, 5, 43, 123, 432, 32, 44, 1, 31, 24, 21, 26, 13, 15, 16, 7, 8]
        print(Date().timeIntervalSince1970)
        CNSSort.希尔排序(&a)
        //        CNSSort.插入排序(&a)
        print(Date().timeIntervalSince1970)
        print(a)
    }
    
    /// 寻找大小为n的数组中出现次数超过n/2的那个数
    func findNum(_ array: [Int]){
        let arr = [1, 3, 2, 3, 4]
        
        var ntime = 0 //表示其中某一个数出现的次数
        var result = arr[0]
        for item in arr{
            if ntime == 0{
                result = item
                ntime = 1
            }
            else{
                if result == item{
                    ntime += 1
                }
                else{
                    ntime -= 1
                }
            }
        }
    }
}
