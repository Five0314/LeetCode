//
//  ViewController.swift
//  LeetCode
//
//  Created by 董伍 on 2019/2/21.
//  Copyright © 2019 董伍. All rights reserved.
//
// https://www.cnblogs.com/strengthen/p/9895524.html

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let a = ["aaaaaa"]
//        let b = ["aaaaaa"]
//        let a = ["aa"]
//        let b = ["aa"]
//        let a = ["ba"]
//        let b = ["aba"]
        
//                let a = ["", "a", "aa", "ba", "aaa", "aaaa", "aaaaa", "adcba", "ababbbabbaba", "babbbabbaba", "aaaabbaa"]
//                let b = ["", "a", "aa", "aba", "aaa", "aaaa", "aaaaa", "abcdadcba", "ababbabbbababbbabbaba", "ababbabbbabbaba", "aabbaaaabbaa"]
        
//        DispatchQueue.global().async {
//            let a = ["aacecaaa"]
//            let b = ["aaacecaaa"]
////            let a = ["babbbabbaba", "aaaabbaa"]
////            let b = ["ababbabbbabbaba", "aabbaaaabbaa"]
//
//            var t1 = Date().timeIntervalSince1970
//            for (i, item) in a.enumerated(){
//                let v = self._214(item)
//                print("\(v == b[i]) : \(v)   \(b[i])")
//            }
//
////            t1 = Date().timeIntervalSince1970
////            for (i, item) in a.enumerated(){
////                let v = self._214_(item)
////                print("\(v == b[i]) : \(v)   \(b[i])")
////            }
//
//            print(" ----- \(Date().timeIntervalSince1970 - t1) ")
//        }
        
        
        
        
//        DispatchQueue.global().async {
//            let a = ["", "a", "aa", "ba", "aaa", "aaaa", "aaaaa", "adcba", "ababbbabbaba", "babbbabbaba", "aaaabbaa"]
//            let b = ["", "a", "aa", "aba", "aaa", "aaaa", "aaaaa", "abcdadcba", "ababbabbbababbbabbaba", "ababbabbbabbaba", "aabbaaaabbaa"]
//
//            let t2 = Date().timeIntervalSince1970
//            for (i, item) in a.enumerated(){
//                let v = self._214(item)
////                print("KMP \(v == b[i]) : \(v)   \(b[i])")
//            }
//
//            print(" ----- KMP \(Date().timeIntervalSince1970 - t2) ")
//        }
        
        
        var a2 = [23,12,34,2,67]
        self.选择排序(&a2)
        print(a2)
    }
    
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
    
    /// 找到最小的数上浮
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
}

//MARK: 简单
extension ViewController{
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
extension ViewController{
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
extension ViewController{
    
    func _214(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let r = String(s.reversed())
        let t = s + "#" + r
        let p = Array(t)
        let pCount = p.count
        var next = Array(repeating: -1, count: pCount + 1)
        var k = -1, j = s.count
        while j < pCount {
            print("\(t)  \(k)   \(next)")
            if k == -1 || p[j] == p[k] {
                j += 1
                k += 1
                next[j] = k
            } else {
                k = next[k]
            }
        }
        print("\(t)  \(k)   \(next)")
        
        return String(r[r.startIndex ..< String.Index(encodedOffset: r.endIndex.encodedOffset - next[pCount])]) + s
    }
    
    /// 最短回文串
    func _214_(_ s: String) -> String {
        let ps = Array(s)
        if Set(ps).count == 1{
            return s
        }
        let tl = s.count
        var positions = [Int].init(repeating: -1, count: s.count + 1)
        
        var i = 0
        var si = tl
        
        
        
        while i < tl{
            if si == tl || ps[i] == ps[si]{
                i += 1
                si -= 1
                positions[i] = si
            }
            else{
                
            }
        }
        
        while i <= tl{
            print("\(s)  \(si)   \(positions)")
            if si == -1 || ps[si] == ps[i]{
                si += 1
                i += 1
                positions[i] = si
            }
            else{
                si = positions[si]
            }
        }
        print("\(s)  \(si)   \(positions)")
        
        if let v = positions.max(){
            if v > 0{
                return String(ps.suffix(v).reversed()) + s
            }
            else if v == 0{
                return String(ps.suffix(1).reversed()) + s
            }
        }
        return s
    }
}

//MARK: 回文
extension ViewController{
    /// _9
}
