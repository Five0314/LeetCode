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
        

        let nums: [Int] = [1, 2, 3, 4]
        let v = LeetCode.shared._238(nums)
        print(v)
    }
}
