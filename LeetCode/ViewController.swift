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

//        let n11 = ListNode.init(1)
//        let n12 = ListNode.init(4)
//        let n13 = ListNode.init(5)
//        n11.next = n12
//        n12.next = n13
//
//
//        let n21 = ListNode.init(1)
//        let n22 = ListNode.init(3)
//        let n23 = ListNode.init(4)
//        n21.next = n22
//        n22.next = n23
//
//
//        let n31 = ListNode.init(2)
//        let n32 = ListNode.init(6)
//        n31.next = n32
        
//        let n11 = ListNode.init(-1)
//        let n12 = ListNode.init(5)
//        let n13 = ListNode.init(1)
//        let n14 = ListNode.init(1)
//        n11.next = n12
//        n12.next = n13
//        n13.next = n14
//
//        let n21 = ListNode.init(6)
//        let n22 = ListNode.init(1)
//        let n23 = ListNode.init(0)
//        n21.next = n22
//        n22.next = n23
        
        let nums: [Int] = [1, 2, 3]
            
        let v = LeetCode.shared._47(nums)
        print(v)
    }
    
    func 排序(){
        var a = [23, 12, 34, 2, 67, 5, 43, 123, 432, 32, 44, 1, 31, 24, 21, 26, 13, 15, 16, 7, 8]
        print(Date().timeIntervalSince1970)
        CNSSort.shared.希尔排序(&a)
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
