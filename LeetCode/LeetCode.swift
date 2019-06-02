//
//  LeetCode.swift
//  LeetCode
//
//  Created by 董伍 on 2019/4/20.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

class LeedCode{
    static var shared = LeedCode.init()
}


//MARK: 简单
extension LeedCode{
    /// 两数之和
    func _1(_ nums: [Int], _ target: Int) -> [Int] {
        let s = Set(nums)
        
        for (i, value) in nums.enumerated(){
            let m = target - value
            if s.contains(m),
                let idx = nums.lastIndex(of: m){
                if idx != i{
                    return [i, idx]
                }
            }
        }
        
        return []
    }
    
    /// 回文数
    func _9(_ x: Int) -> Bool {
        if x < 0{
            return false
        }
        
        var rn = 0
        var n = x
        
        while n >= 10{
            let v = n % 10
            rn = rn * 10 + v
            n = Int(n / 10)
        }
        rn = rn * 10 + n
        
        return rn == x
    }
    
    /// 罗马数字转整数
    func _13(_ s: String) -> Int {
        var rv = 0
        
        var lv: Int = 0
        for item in s{
            var v = 0
            
            switch item{
            case "I":
                v = 1
            case "V":
                v = 5
            case "X":
                v = 10
            case "L":
                v = 50
            case "C":
                v = 100
            case "D":
                v = 500
            case "M":
                v = 1000
            default:
                break
            }
            
            rv += v
            
            if v > lv{
                rv -= lv + lv
            }
            
            lv = v
        }
        
        return rv
    }
    
    public class ListNode_21 {
        public var val: Int
        public var next: ListNode_21?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    /// 合并两个有序链表
    func _21(_ l1: ListNode_21?, _ l2: ListNode_21?) -> ListNode_21? {
        
        var rv: ListNode_21?
        var ln: ListNode_21?
        
        var n1 = l1
        var n2 = l2
        
        var v1 = Int.max
        var v2 = Int.max
        
        while n1 != nil || n2 != nil{
            v1 = n1?.val ?? Int.max
            v2 = n2?.val ?? Int.max
            
            var cn: ListNode_21?
            if v2 < v1 {
                cn = n2
                n2 = n2?.next
            }
            else{
                cn = n1
                n1 = n1?.next
            }
            if rv == nil{
                rv = cn
                ln = rv
            }
            else{
                ln?.next = cn
                ln = cn
            }
        }
        
        return rv
    }
    
    /// 验证回文串
    func _125(_ s: String) -> Bool{
        guard let cs = s.cString(using: .ascii)?.filter({ (item) -> Bool in
            switch item {
            case 48...57:
                return true
                
            case 65...90: // A ~ Z
                return true
                
            case 97...122: // a ~ z
                return true
                
            default:
                return false
            }
        }) else{
            return true
        }
        
        let c = cs.count - 1
        
        if c <= 1{
            return true
        }
        
        var li = 0
        var ri = c
        
        var lv = self._125_is数字或字母(cs.first)
        var rv = self._125_is数字或字母(cs.last)
        
        while li <= ri{
            
            if let _lv = lv, let _rv = rv{
                if _lv != _rv{
                    return false
                }
                else{
                    li += 1
                    if li <= c{
                        lv = self._125_is数字或字母(cs[li])
                    }
                    else{
                        lv = nil
                    }
                    
                    ri -= 1
                    if ri >= 0{
                        rv = self._125_is数字或字母(cs[ri])
                    }
                    else{
                        rv = nil
                    }
                }
            }
            
            if lv == nil{
                li += 1
                if li <= c{
                    lv = self._125_is数字或字母(cs[li])
                }
                else{
                    lv = nil
                }
            }
            
            if rv == nil{
                ri -= 1
                if ri >= 0{
                    rv = self._125_is数字或字母(cs[ri])
                }
                else{
                    rv = nil
                }
            }
        }

        return true
    }
    
    func _125_is数字或字母(_ char: CChar?) -> CChar?{
        guard let v = char else{
            return nil
        }
        
        switch v {
        case 48...57:
            return v
            
        case 65...90: // A ~ Z
            return v + 32
            
        case 97...122: // a ~ z
            return v
            
        default:
            return nil
        }
    }
    
    
    
    /// 罗马数字转整数
    func _58(_ s: String) -> Int {
        let items = s.components(separatedBy: " ")
        
        for i in items.reversed(){
            if !i.isEmpty{
                return i.count
            }
        }
        
        return 0
    }
    
    /// 两数之和 II - 输入有序数组
    func _167(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = numbers.count - 1
        
        while i < j {
            let v = numbers[i] + numbers[j]
            if v == target{
                return [i + 1, j + 1]
            }
            else if v > target{
                j -= 1
            }
            else{
                i += 1
            }
        }
        
        return []
    }
    
    /// 求众数 - 摩尔投票发
    func _169(_ arr: [Int]) -> Int{
        
        var c: Int = 0
        var rv: Int = 0
        
        for item in arr{
            if c == 0{
                c = 1
                rv = item
            }
            else{
                if rv == item{
                    c += 1
                }
                else{
                    c -= 1
                }
            }
        }
        
        return rv
    }
    
    /// 两数之和 II - 输入有序数组
    func _653(_ root: TreeNode?, _ k: Int) -> Bool {
        var s: Set<Int> = []
        return self.exist(root, &s, k)
    }
    
    func exist(_ node: TreeNode?, _ s: inout Set<Int>, _ k: Int) -> Bool{
        guard let node = node else{
            return false
        }
        
        if s.contains(k - node.val){
            return true
        }
        
        s.insert(node.val)
        
        return self.exist(node.left, &s, k) || self.exist(node.right, &s, k)
    }
    
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
    
    
    /// 重复 N 次的元素
    func _961(_ A: [Int]) -> Int {
        
        var ns: Set<Int> = []
        
        for item in A{
            if ns.contains(item){
                return item
            }
            else{
                ns.insert(item)
            }
        }
        
        return 0
    }
}

//MARK: 中等
extension LeedCode{
    /// 两数相加
    func _2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var rootNode: ListNode?
        var lastNode: ListNode?
        
        var mv: Int?
        
        var n1 = l1
        var n2 = l2
        
        while n1 != nil || n2 != nil || mv != nil{
            var nv = (n1?.val ?? 0) + (n2?.val ?? 0)
            if let v = mv{
                nv += v
                mv = nil
            }
            if nv > 9{
                mv = 1
                nv = nv - 10
            }
            
            let node = ListNode.init(nv)
            if rootNode == nil{
                rootNode = node
            }
            else{
                lastNode?.next = node
            }
            lastNode = node
            
            n1 = n1?.next
            n2 = n2?.next
        }
        
        return rootNode
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    /// 无重复字符的最长子
    func _3(_ s: String) -> Int {
        let ss = Array.init(s.utf8)
        let c = s.count
        
        var maxLength = 0
        
        if c <= 1{
            return c
        }
        
        var l = 0
        var r = 1
        
        while r < c{
            let rv = ss[r]
            for i in l..<r{
                if ss[i] == rv{
                    l = i + 1
                    break
                }
            }
            maxLength = max(maxLength, r - l + 1)
            r += 1
        }
        
        return maxLength
    }
    
    /// 整数反转
    func _12(_ num: Int) -> String {
        let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var rv = ""
        
        var cv = num
        for item in values{
            while cv > 0{
                if cv >= item{
                    rv += self.getv_12(item)
                    cv -= item
                }
                else{
                    break
                }
            }
        }
        
        return rv
    }
    
    func getv_12(_ v: Int) -> String{
        switch v {
        case 1:
            return "I"
            
        case 4:
            return "IV"
            
        case 5:
            return "V"
            
        case 9:
            return "IX"
            
        case 10:
            return "X"
            
        case 40:
            return "XL"
            
        case 50:
            return "L"
            
        case 90:
            return "XC"
            
        case 100:
            return "C"
            
        case 400:
            return "CD"
            
        case 500:
            return "D"
            
        case 900:
            return "CM"
            
        case 1000:
            return "M"
            
        default:
            return ""
        }
    }
    
    
}

//MARK: 困难
extension LeedCode{
    
    /// 寻找两个有序数组的中位数
    func _4(_ arr1: [Int], _ arr2: [Int]) -> Double{
        let c1 = arr1.count
        let c2 = arr2.count
        
        let mi = c1 + c2
        let isDoubleCount = mi % 2 == 0
        
        let mi2 = mi / 2
        let mi1 = isDoubleCount ? mi2 - 1 : mi2
        
        // h奇数
        var i1 = 0
        var i2 = 0
        
        var v1 = arr1[0]
        var v2 = arr2[0]
        
        while true{
            if isDoubleCount{
                if v1 == mi1 && v2 == mi2{
                    return Double(arr1[v1] + arr2[v2]) / 2
                }
            }
            else{
                if v1 == mi1{
                    return Double(arr1[v1])
                }
                
                if v2 == mi2{
                    return Double(arr2[v2])
                }
            }
            
            if v1 < v2{
                i1 += 1
                
                if i1 < c1{
                    v1 = arr1[i1]
                }
            }
            else{
                i2 += 1
                
                if i2 < c2{
                    v2 = arr2[i2]
                }
            }
        }
    }
    
// KMP算法的核心，是一个被称为部分匹配表(Partial Match Table)的数组。
    
    /// 最短回文串 - PMT中的值是字符串的前缀集合与后缀集合的交集中最长元素的长度
    func _214(_ s: String) -> String {
        
//        let p: [Character] = s.filter { (item) -> Bool in
//            return true
//        }
//        let v = self._214_递归(p)
//        return String(v)
        return self._214_KMP(s)
    }
    
    func _214_递归(_ s: [Character]) -> [Character]{
        var i = 0
        for j in stride(from: s.count - 1, through: 0, by: -1){
            if s[i] == s[j]{
                i += 1
            }
        }
        
        if i == s.count{
            return s
        }
        
        let a = Array(s.suffix(s.count - i))
        let b = Array(s.prefix(i))
        
        return a.reversed() + _214_递归(b) + a
    }
    
    func _214_KMP(_ s: String) -> String{
        guard s.count > 1 else {
            return s
        }
        let r = String(s.reversed())
        let t = s + "#" + r
        let p = Array(t)
        let pCount = p.count
        var next = Array(repeating: -1, count: pCount + 1)
        var k = -1, j = 0
        while j < pCount {
            if k == -1 || p[j] == p[k] {
                j += 1
                k += 1
                next[j] = k
            } else {
                k = next[k]
            }
        }
        return String(r[r.startIndex ..< String.Index(encodedOffset: r.endIndex.encodedOffset - next[pCount])]) + s
    }
    
    func _214_对称轴寻找回文串(_ s: String) -> String {
        var ss = Array.init(s.utf8)
        let tl = ss.count
        
        var find = false
        
        var j = tl - 1
        while j > 0{
            if ss[0] != ss[j]{
                j -= 1
            }
            else{
                find = true
                var si = 0
                var sj = j
                while si < sj{
                    if ss[si] == ss[sj]{
                        si += 1
                        sj -= 1
                    }
                    else{
                        find = false
                        break
                    }
                }
                
                if find{
                    break
                }
                
                j -= 1
            }
        }
        
        if j == tl - 1{
            return s
        }
        
        return String(s.suffix(from: s.index(s.startIndex, offsetBy: j + 1)).reversed()) + s
    }
}

//MARK: 回文
extension LeedCode{
    /// _9
}
