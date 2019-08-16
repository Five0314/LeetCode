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
//
//        let n1: TreeNode = TreeNode.init(1)
//        let n2: TreeNode = TreeNode.init(2)
//        let n3: TreeNode = TreeNode.init(3)
//        let n4: TreeNode = TreeNode.init(0)
//        let n5: TreeNode = TreeNode.init(-6)
        
        let n1: TreeNode = TreeNode.init(-2)
        let n2: TreeNode = TreeNode.init(-1)
        let n3: TreeNode = TreeNode.init(-9)
        let n4: TreeNode = TreeNode.init(-8)
        let n5: TreeNode = TreeNode.init(3)
        let n6: TreeNode = TreeNode.init(-2)
        
        n1.right = n2
        
//        n2.left = n3
//        n2.right = n4
//
//        n4.right = n5
//
//        n5.right = n6
        
        let v = LeetCode.shared._124(n1)
        
        print(v)
    }
}
