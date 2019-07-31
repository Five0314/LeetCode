//
//  LeetCode.swift
//  LeetCode
//
//  Created by 董伍 on 2019/7/29.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class LeetCode{
    static var shared = LeetCode.init()
}

extension String{
    func substring(location: Int, length: Int) -> String{
        let si = self.index(self.startIndex, offsetBy: location)
        let ei = self.index(si, offsetBy: length)
        return String(self[si..<ei])
    }
}
