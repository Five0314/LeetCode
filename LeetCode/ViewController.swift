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
    
    
    //FIXME: 待修复
    //TODO: 待处理
    //MARK: 标记
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let n1: TreeNode = TreeNode.init(3)
        let n2: TreeNode = TreeNode.init(9)
        let n3: TreeNode = TreeNode.init(20)
        let n4: TreeNode = TreeNode.init(15)
        let n5: TreeNode = TreeNode.init(7)
        
        n1.left = n2
        n1.right = n3
        
        n3.left = n4
        n3.right = n5
        
//        let nums: [Int] = [1, 2, 3, 4]
        let v = LeetCode.shared._104(n1)
        print(v)
    }
}
