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
        
//        let n1: ListNode = ListNode.init(1)
//        let n2: TreeNode = TreeNode.init(-1)
//        let n3: TreeNode = TreeNode.init(-9)
//        let n4: TreeNode = TreeNode.init(-8)
//        let n5: TreeNode = TreeNode.init(3)
//        let n6: TreeNode = TreeNode.init(-2)
        
        let rootNode: ListNode = ListNode.init(1)
        
//        var lastNode: ListNode = rootNode
//        for i in 2...5{
//            let n: ListNode = ListNode.init(i)
//            lastNode.next = n
//            lastNode = n
//        }
        
        var nn: ListNode? = rootNode
        while nn != nil{
            print(nn?.val ?? -1)
            nn = nn?.next
        }
        
        let v = LeetCode.shared._19(rootNode, 1)
        
        print(" ")
        var n: ListNode? = v
        while n != nil{
            print(n?.val ?? -1)
            n = n?.next
        }
        
    }
}
