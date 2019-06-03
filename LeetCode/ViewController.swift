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
        
        self.回文()
        
        print(LeedCode.shared._14(["aa", "b"]))
        
        print(LeedCode.shared._3("abcabcdbb"))
    }
    
    func 回文(){
//        DispatchQueue.global().async {
//            let a = ["", "a", "aa", "ba", "aaa", "aaaa", "aaaaa", "adcba", "ababbbabbaba", "babbbabbaba", "aaaabbaa"]
//            let b = ["", "a", "aa", "aba", "aaa", "aaaa", "aaaaa", "abcdadcba", "ababbabbbababbbabbaba", "ababbabbbabbaba", "aabbaaaabbaa"]
            
            let a = ["aaaabbaa"]
            let b = ["aabbaaaabbaa"]

            for (i, item) in a.enumerated(){
                let v = LeedCode.shared._214(item)
                print("KMP \(v == b[i]) : \(v)   \(b[i])")
            }

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
}
