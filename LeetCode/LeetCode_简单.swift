//
//  LeetCode.swift
//  LeetCode
//
//  Created by 董伍 on 2019/4/20.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

//MARK: 简单
extension LeetCode{
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
    
    /// 最长公共前缀
    func _14(_ arr: [String]) -> String{
        if arr.isEmpty{
            return ""
        }
        
        let ss = arr[0]
        
        for i in 0..<ss.count{
            let cs = ss.substring(location: i, length: 1)
            
            for item in arr{
                if item.count > i{
                    let c = item.substring(location: i, length: 1)
                    if c != cs{
                        return String(ss.prefix(i))
                    }
                }
                else{
                    return String(ss.prefix(i))
                }
            }
        }
        
        return ss
    }
    
    func _14_2(_ arr: [String], commonPrefix: String) -> Bool{
        for item in arr{
            if !item.hasPrefix(commonPrefix){
                return false
            }
        }
        
        return true
    }

    /// 合并两个有序链表
    func _21(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var rv: ListNode?
        var ln: ListNode?
        
        var n1 = l1
        var n2 = l2
        
        while true{
            if let v1 = n1?.val, let v2 = n2?.val{
                if v1 <= v2{
                    ln?.next = n1
                    ln = n1
                    n1 = n1?.next
                }
                else{
                    ln?.next = n2
                    ln = n2
                    n2 = n2?.next
                }
            }
            else if n1 != nil{
                ln?.next = n1
                ln = n1
                n1 = n1?.next
            }
            else if n2 != nil{
                ln?.next = n2
                ln = n2
                n2 = n2?.next
            }
            else{
                break
            }
            
            if rv == nil{
                rv = ln
            }
        }
        
        return rv
    }
    
    /// 搜索插入位置 - 二分查找
    func _35(_ nums: [Int], _ target: Int) -> Int {
//        return self._35_递归(nums, target, left: 0, right: nums.count - 1)
        
        var l: Int = 0
        var r: Int = nums.count - 1
        var m: Int = 0

        while l < r{
            m = (l + r) / 2

            if nums[m] < target{ // 后半段
                l = m + 1
            }
            else if nums[m] > target{ // 前半段
                r = m
            }
            else{
                return m
            }
        }

        if nums[r] == target{
            return r
        }
        else if nums[r] > target{
            return r
        }
        else{
            return r + 1
        }
    }
    
//    func _35_递归(_ nums: [Int], _ target: Int, left: Int, right: Int) -> Int {
//        if right - 1 < left{
//            if nums[right] <= target{
//                return right + 1
//            }
//
//            if nums[left] >= target{
//                return left
//            }
//
//            return right
//        }
//
//        let mi: Int = (left + right) / 2
//
//        if nums[mi] < target{ // 后半段
//            return self._35_递归(nums, target, left: mi, right: right)
//        }
//        else if nums[mi] > target{ // 前半段
//            return self._35_递归(nums, target, left: left, right: mi)
//        }
//        else{
//            return mi
//        }
//    }
    
    /// 最大子序和 - 计算每个节点为结尾时的最大值 - 动态规划
    func _53(_ nums: [Int]) -> Int{
        
        var maxSUM: Int = nums[0]
        var currentSUM: Int = nums[0]
        
        for i in 1..<nums.count{
            currentSUM = max(nums[i], currentSUM + nums[i])
            
            if maxSUM < currentSUM{
                maxSUM = currentSUM
            }
        }
        return maxSUM
    }
    
//    /// 最大子序和 - 分治法
//    func _53_分治法(_ nums: [Int]) -> Int{
//
//        let maxSUM: Int = nums[0]
//
//        return maxSUM
//    }
    
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
    
    /// 加一
    func _66(_ digits: [Int]) -> [Int] {
        var rv: [Int] = digits

        var i: Int = digits.count - 1
        var pv: Int = 1
        
        while true {
            if i < 0{ // 说明最大的那位需要进位了
                rv.insert(pv, at: 0)
                break
            }
            
            if pv <= 0{
                break
            }
            
            rv[i] += pv
            if rv[i] < 10{
                break
            }
            else{
                rv[i] -= 10
                pv = 1
                i -= 1
            }
        }

        return rv
    }
    
    /// 二进制求和
    func _67(_ a: String, _ b: String) -> String {
        
        let maxC: Int = max(a.count, b.count)
        let aOffset: Int = maxC - a.count
        let bOffset: Int = maxC - b.count
        
        var rv: [Character] = [Character].init(repeating: Character.init("0"), count: maxC)
        
        var pv: Int = 0
        
        var av: Int = 0
        var bv: Int = 0
        
        for i in (0..<maxC).reversed(){
            av = self._67_get(valueAt: i - aOffset, a)
            bv = self._67_get(valueAt: i - bOffset, b)
            
            pv += av + bv
            if pv >= 2{
                rv[i] = Character.init("\(pv - 2)")
                pv = 1
            }
            else{
                rv[i] = Character.init("\(pv)")
                pv = 0
            }
        }
        
        if pv != 0{
            rv.insert(Character.init("\(pv)"), at: 0)
        }
        
        return String.init(rv)
    }
    fileprivate func _67_get(valueAt index: Int, _ str: String) -> Int{
        if index >= 0{
            return Int(str.substring(location: index, length: 1)) ?? 0
        }

        return 0
    }
    
    /// x 的平方根 - 牛顿迭代法
    func _69(_ x: Int) -> Int {
        var res = x
        while res * res > x {
            res = (res + x / res) / 2
        }
        return res
    }
    fileprivate func _69_1(_ x: Int) -> Float {
        let y: Float = Float(x)
        var res: Float = y
        while res * res > y { // 当心死循环哦 x = 12
            print(res)
            res = (res + y / res) / 2
        }
        return res
    }
    /// x 的平方根 - 二分法
    fileprivate func _69_2(_ x: Int) -> Int {
        return x
    }
    
    /// 爬楼梯 f(n) = f(n - 1) + f(n - 2)
    func _70(_ n: Int) -> Int {
        if n <= 1{
            return 1
        }
        
        if n == 2{
            return 2
        }
        
        var vi: Int = 0
        
        var v1: Int = 1
        var v2: Int = 2
        
        for _ in 3...n{
            vi = v1 + v2
            
            v1 = v2
            v2 = vi
        }
        
        return vi
    }
    
    /// 合并两个有序数组
    func _88(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
        var i1 = m - 1
        var i2 = n - 1
        var k = m + n - 1

        while i1 >= 0 && i2 >= 0 {
            if nums1[i1] > nums2[i2] {
                nums1[k] = nums1[i1]
                k -= 1
                i1 -= 1
            } else {
                nums1[k] = nums2[i2]
                k -= 1
                i2 -= 1
            }
        }

        if i2 >= 0 { // 如果 i1 >= 0，说明nums2 的内容已经用完了，说明大的都搞定了，就剩下 nums1 中的小的了，由由于nums1中的数据已经排序好了，就没必要再排序了
            for t in 0...i2 {
                nums1[t] = nums2[t]
            }
        }
    }
    
    /// 合并两个有序数组 - 相比较上面的一个，部分情况下会多遍历几次，没有有效的利用nums1中的数据已经是有序的这一条件
    func _88_2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int){
        var k = m + n - 1
        
        var i2 = n - 1
        for i in stride(from: m - 1, through: 0, by: -1){
            while i2 >= 0{
                if nums2[i2] > nums1[i]{
                    nums1[k] = nums2[i2]
                    i2 -= 1
                    k -= 1
                }
                else{
                    break
                }
            }
            
            nums1[k] = nums1[i]
            k -= 1
        }
        
        if i2 >= 0{
            for i in 0...i2{
                nums1[i] = nums2[i]
            }
        }
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
    
    /// 买卖股票的最佳时机
    func _121(_ prices: [Int]) -> Int{
        
        var min: Int = Int.max
        var maxProfit: Int = 0
        
        var profit: Int = 0
        
        for item in prices{
            profit = item - min
            
            if profit > 0{
                if maxProfit < profit{
                    maxProfit = profit
                }
            }
            
            if min > item{
                min = item
            }
        }
        
        return maxProfit
    }
    
    /// 买卖股票的最佳时机II
    func _122(_ prices: [Int]) -> Int{
        
        let c = prices.count - 1
        if c < 1{
            return 0
        }

        var profit: Int = 0
        
        var buy: Int = -1
        
        var next: Int = 0
        
        for i in 0..<c{
            
            next = prices[i + 1]
            
            if buy == -1{ // 还没买过，只要明天的比今天的高，说明今天买了就会有收益
                if prices[i] < next{
                    buy = prices[i]
                }
            }
            else{ // 既然买过了，就开始研究啥时候卖了 - 只要明天的比今天的低，就可以卖，明天比今天的高就等到明天再卖吗
                if prices[i] > next{
                    profit += prices[i] - buy
                    buy = -1
                }
            }
        }
        
        if buy != -1{ // 还有没卖掉了，和最后一天的价格进行比较
            if buy < prices[c]{
                profit += prices[c] - buy
            }
        }
        
        return profit
    }
    
    /// 只出现一次的数字
    func _136(_ nums: [Int]) -> Int {
        
        var rv: Int = 0
        
        for item in nums{
            rv ^= item
        }
        
        return rv
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
    
    /// 旋转数组
    func _189(_ nums: inout [Int], _ k: Int) {
        let tc: Int = nums.count
        
        if k > tc{
            return _189(&nums, k % tc)
        }
        
        let midx: Int = tc - k
        var temporary: [Int] = [Int].init(repeating: 0, count: k)
        
        for i in 0..<k{
            temporary[i] = nums[i + midx]
        }
        
        for i in (k..<tc).reversed(){
            nums.swapAt(i, i - k)
        }
        
        for i in 0..<k{
            nums[i] = temporary[i]
        }
    }
    
    /// 231. 2的幂
    func _231(_ n: Int) -> Bool{
        return n > 0 && n & (n - 1) == 0
    }
    
    /// 缺失数字
    func _268(_ nums: [Int]) -> Int {
        var rv: Int = nums.count
        for i in 0..<nums.count{
            rv ^= i ^ nums[i]
        }
        
        return rv
    }
    
    /// 第一个错误的版本
    func _278(_ n: Int) -> Int {
        var l: Int = 1
        var r: Int = n
        var m: Int = 0
        
        while l < r{
            m = (l + r) / 2
            
            if self.isBadVersion(m){
                r = m
            }
            else{
                l = m + 1
            }
        }
        
        return l
    }
    
    fileprivate func isBadVersion(_ i: Int) -> Bool{
        return i >= 3
    }
    
    
    /// 4的幂
    func _342(_ num: Int) -> Bool {
        return num > 0 && num & (num - 1) == 0 && num & 0b1010101010101010101010101010101 == num
    }
    
    /// 反转字符串
    func _344(_ s: inout [Character]) {
//        let c = s.count - 1
//
//        var mc: Character = Character.init("0")
//
//        for i in 0..<(c + 1)>>1{
//            mc = s[c - i]
//            s[c - i] = s[i]
//            s[i] = mc
//        }
        
        self._反转字符串(&s, left: 0, right: s.count - 1)
    }
    
    fileprivate func _反转字符串(_ s: inout [Character], left: Int, right: Int){
        var i = left
        var j = right
        while i < j {
            (s[i],s[j]) = (s[j],s[i])
            i += 1
            j -= 1
        }
    }
    
    /// 有效的完全平方数 - 利用 1+3+5+7+9+…+(2n-1)=n^2，即完全平方数肯定是前n个连续奇数的和
    func _367(_ num: Int) -> Bool {
        var v: Int = num
        var cv: Int = 1
        
        while v > 0{
            v -= cv
            cv += 2
        }

        return v == 0
    }
    
    /// 有效的完全平方数 - 二分法
    func _367_2(_ num: Int) -> Bool {
        var l: Int = 1
        var r: Int = num
        var m: Int = 0
        var sv: Int = 0
        
        while l < r{
            m = (l + r) / 2
            sv = m * m
            
            if sv == num{
                return true
            }
            
            if sv < num{
                l = m + 1
            }
            else{
                r = m
            }
        }
        
        
        return false
    }
    
    /// 找不同
    func _389(_ s: String, _ t: String) -> Character {
        var rv: UInt8 = 0
        
        for item in t{
            if let v = item.asciiValue{
                rv ^= v
            }
        }
        
        for item in s{
            if let v = item.asciiValue{
                rv ^= v
            }
        }
        
        return Character.init(Unicode.Scalar.init(rv))
    }
    
    /// 字符串相加
    func _415(_ num1: String, _ num2: String) -> String {
        
        let i1: Int = num1.count - 1
        if i1 < 0 { return num2 }
        
        let i2: Int = num2.count - 1
        if i2 < 0 { return num1 }
        
        let n1: [Character] = Array(num1)
        let n2: [Character] = Array(num2)
        
        var rv: [UInt8] = [UInt8].init(repeating: 0, count: max(i1, i2) + 1)
        var mv: UInt8 = 0
        var nv: UInt8 = 0
        
        
        let d = abs(i1 - i2)
        if d == 0{
            for i in stride(from: i1, through: 0, by: -1){
                mv = n1[i].asciiValue! + n2[i].asciiValue! + nv - 96
                if mv > 9{
                    rv[i] = mv - 10
                    nv = 1
                }
                else{
                    rv[i] = mv
                    nv = 0
                }
            }
        }
        else if i1 > i2{
            for i in stride(from: i1, through: d, by: -1){
                mv = n1[i].asciiValue! + n2[i - d].asciiValue! + nv - 96
                if mv > 9{
                    rv[i] = mv - 10
                    nv = 1
                }
                else{
                    rv[i] = mv
                    nv = 0
                }
            }
            
            for i in stride(from: d - 1, through: 0, by: -1){
                mv = n1[i].asciiValue! + nv - 48
                if mv > 9{
                    rv[i] = mv - 10
                    nv = 1
                }
                else{
                    rv[i] = mv
                    nv = 0
                }
            }
        }
        else if i2 > i1{
            for i in stride(from: i2, through: d, by: -1){
                mv = n1[i - d].asciiValue! + n2[i].asciiValue! + nv - 96
                if mv > 9{
                    rv[i] = mv - 10
                    nv = 1
                }
                else{
                    rv[i] = mv
                    nv = 0
                }
            }
            
            for i in stride(from: d - 1, through: 0, by: -1){
                mv = n2[i].asciiValue! + nv - 48
                if mv > 9{
                    rv[i] = mv - 10
                    nv = 1
                }
                else{
                    rv[i] = mv
                    nv = 0
                }
            }
        }

        if nv > 0{
            rv.insert(nv, at: 0)
        }
        
        return rv.map(String.init).joined()
    }
    
    /// 斐波那契数
    func _509(_ N: Int) -> Int {
        if N <= 0{
            return 0
        }
        
        if N == 1{
            return 1
        }
        
        var vi: Int = 0
        
        var v1: Int = 0
        var v2: Int = 1
        
        for _ in 2...N{
            vi = v1 + v2
            
            v1 = v2
            v2 = vi
        }
        
        return vi
    }
    
    /// 反转字符串 II
    func _541(_ s: String, _ k: Int) -> String {
        var sarr: [Character] = [Character](s)
        
        let c = sarr.count
        
        var li: Int = 0
        for i in 0...c / k << 1{
            li = i * k << 1
            self._反转字符串(&sarr, left: li, right: min(li + k, c) - 1)
        }
        
        return String(sarr)
    }
    
    /// 反转字符串中的单词 III
    func _557(_ s: String) -> String {
        var sarr: [Character] = [Character](s)
        
        let echar: Character = Character.init(" ")
        let c = sarr.count
        
        var l: Int = 0
        
        for i in 0..<c{
            if sarr[i] == echar{
                if i - l > 1{
                    self._反转字符串(&sarr, left: l, right: i - 1)
                }
                l = i + 1
            }
        }
        
        if c - l > 1{
            self._反转字符串(&sarr, left: l, right: c - 1)
        }
        
        return String(sarr)
    }
    
    /// 平方数之和
    func _633(_ c: Int) -> Bool {
        var l: Int = 0
        var r: Int = _69(c) // 开方
//        var r: Int = Int(sqrt(Double(c)))
        
        var tv: Int = 0
        
        while l <= r{
            tv = l * l + r * r
            
            if tv == c{
                return true
            }
            
            if tv < c{
                l += 1
            }
            else{
                r -= 1
            }
        }
        
        return false
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
    
    /// 使用最小花费爬楼梯
    func _746(_ cost: [Int]) -> Int {
        // 无论是从0开始，还是从1开始，你都得花费体力跨上0或者1，妈的，脑子宕机了，居然被这个卡住了，一直以为可以直接从0、1开始不花费体力，甚至一度以为题目错了😭
        switch cost.count {
        case 0, 1:
            return 0
        case 2:
            return cost[1]
            
        default:
            break
        }
        
        var rv: Int = 0
        var v1: Int = cost[0]
        var v2: Int = cost[1]
        
        for i in 2..<cost.count{
            rv = min(v1, v2) + cost[i]
            
            v1 = v2
            v2 = rv
        }
        
        return min(v1, v2)
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
