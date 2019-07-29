//
//  LeetCode_困难.swift
//  LeetCode
//
//  Created by 董伍 on 2019/7/29.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

//MARK: 困难
extension LeetCode{
    
    /// 寻找两个有序数组的中位数
    func _4(_ nums1: [Int], _ nums2: [Int]) -> Double{
        let c1 = nums1.count
        let c2 = nums2.count
        
        var lv: Int?
        
        var idx1: Int = 0
        var idx2: Int = 0
        var v1: Int?
        var v2: Int?
        
        for _ in 0..<((c1 + c2) >> 1) {
            v1 = self._4_get(nums1, idx: idx1, maxCount: c1)
            v2 = self._4_get(nums2, idx: idx2, maxCount: c2)
            
            if let v1 = v1, let v2 = v2{
                if v1 < v2{
                    lv = v1
                    idx1 += 1
                }
                else{
                    lv = v2
                    idx2 += 1
                }
            }
            else{
                if v1 != nil{
                    lv = v1
                    idx1 += 1
                }
                else if v2 != nil{
                    lv = v2
                    idx2 += 1
                }
            }
        }
        
        ///
        v1 = self._4_get(nums1, idx: idx1, maxCount: c1)
        v2 = self._4_get(nums2, idx: idx2, maxCount: c2)
        
        var rv: Double = 0
        
        if let v1 = v1, let v2 = v2{
            rv = Double(v1 < v2 ? v1 : v2)
        }
        else if let v1 = v1{
            rv = Double(v1)
        }
        else if let v2 = v2{
            rv = Double(v2)
        }
        
        // 奇总数
        if (c1 + c2) & 1 == 1{
            return rv
        }
        else{ // 偶总数
            rv += Double(lv ?? 0)
            return rv * 0.5
        }
    }
    
    fileprivate func _4_get(_ nums: [Int], idx: Int, maxCount: Int) -> Int?{
        guard idx < maxCount else{
            return nil
        }
        
        return nums[idx]
    }
    
    /// 最长回文子串 - Manacher算法
    func _5(_ s: String) -> String {
        let midx: Int = s.count * 2
        
        if midx <= 2{
            return s
        }
        
        var arr: [Character] = [Character].init(repeating: Character.init("#"), count: midx + 1)
        for (i, item) in s.enumerated(){
            arr[i << 1 + 1] = item
        }
        
        var ti: Int = 0
        var tl: Int = -1
        
        var radius: [Int] = [Int].init(repeating: 0, count: midx + 1)
        var mx: Int = 0
        var id: Int = 0
        
        for i in 1...midx{
            if mx > i {
                radius[i] = min(radius[id << 1 - i], mx - i)
            }
            else {
                id = i
            }
            
            while i - radius[i] >= 0 && i + radius[i] <= midx && arr[i - radius[i]] == arr[i + radius[i]]{
                radius[i] += 1
            }
            
            if mx < id + radius[i] - 1{
                mx = id + radius[i] - 1
                id = i
            }
            
            if tl < radius[i]{ // 记录最大值
                tl = radius[i]
                ti = i
            }
        }
        
        return s.substring(location: ti >> 1 - (tl - 1) >> 1, length: (tl - 1) >> 1 * 2 + ti & 1)
        
        
        //        if s.count <= 1 {
        //            return s;
        //        }
        //        var temp: Array<String> = ["#"];
        //        for c in s {
        //            temp.append(String.init(c))
        //            temp.append("#");
        //        }
        //        var maxIndex:Int = 0
        //        var max:Int = 0
        //        var arrIndex:[Int] = [1]
        //        var maxLen: Int = 1
        //        var maxLenIndex:Int = 0
        //        for i in 1..<temp.count {
        //            let j = maxIndex - (i - maxIndex)
        //
        //            if max > i && j >= 0 {
        //                arrIndex.append(min(arrIndex[j], max - i))
        //            } else {
        //                arrIndex.append(1)
        //            }
        //
        //            while i + arrIndex[i] < temp.count && i - arrIndex[i] >= 0 && temp[i+arrIndex[i]] == temp[i-arrIndex[i]] {
        //                arrIndex[i] += 1
        //            }
        //
        //            if i + arrIndex[i] > max {
        //                max = i + arrIndex[i]
        //                maxIndex = i
        //            }
        //            if arrIndex[i] > maxLen {
        //                maxLen = arrIndex[i]
        //                maxLenIndex = i
        //            }
        //        }
        //
        //        let startIndex = s.index(s.startIndex, offsetBy: (maxLenIndex-(maxLen-1))/2)
        //        let endIndex = s.index(startIndex, offsetBy: maxLen-1-1)
        //        let maxStr = String(s[startIndex...endIndex])
        //        return maxStr;
        
        //        if ti & 1 == 1{ // aba
        //            let ns = s.substring(location: ti >> 1 - (tv - 1) >> 1, length: (tv - 1) >> 1 * 2 + 1)
        //            return ns
        //        }
        //        else{ // abba
        //            let ns = s.substring(location: ti >> 1 - (tv - 1) >> 1, length: (tv - 1) >> 1 * 2)
        //            return ns
        //        }
        
    }
    
    /// 合并K个排序链表
    func _23(_ lists: [ListNode?]) -> ListNode? {
        
        var isOdd: Bool = false // 奇总数
        var lists_2 = lists
        var mlen: Int = lists_2.count
        
        while mlen > 1{
            
            isOdd = mlen & 1 == 1
            
            for i in 0..<mlen>>1{
                //                print(" ----- ")
                //                var p = lists_2[i << 1]
                //                while p?.next != nil{
                //                    print(p!.val)
                //                    p = p?.next
                //                }
                //                if let v = p?.val{
                //                    print(v)
                //                }
                //
                //                print(" + ")
                //                p = lists_2[i << 1 + 1]
                //                while p?.next != nil{
                //                    print(p!.val)
                //                    p = p?.next
                //                }
                //                if let v = p?.val{
                //                    print(v)
                //                }
                
                let node = self._21(lists_2[i << 1], lists_2[i << 1 + 1])
                
                //                print(" = ")
                //                p = node
                //                while p?.next != nil{
                //                    print(p!.val)
                //                    p = p?.next
                //                }
                //                if let v = p?.val{
                //                    print(v)
                //                }
                
                lists_2[i] = node
                mlen = i + 1
            }
            
            if isOdd{
                lists_2[mlen] = lists_2[mlen << 1]
                mlen += 1
            }
        }
        
        return lists_2.first ?? nil
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
        
        return String(r[r.startIndex ..< String.Index.init(utf16Offset: r.endIndex.utf16Offset(in: r) - next[pCount], in: r)]) + s
        //        return String(r[r.startIndex ..< String.Index(encodedOffset: r.endIndex.encodedOffset - next[pCount])]) + s
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
    
    /// 计算各个位数不同的数字个数
    func _357(_ n: Int) -> Int {
        
        if n == 0{
            return 1
        }
        
        if n == 1{
            return 10
        }
        
        var rv: Int = 0
        
        var cv: Int = 9
        
        for i in 2...n{
            cv = 9
            
            for j in 2...i{
                cv *= 11 - j
            }
            
            rv += cv
        }
        
        return rv + 10
    }
}
