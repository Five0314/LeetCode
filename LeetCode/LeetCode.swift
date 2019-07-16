//
//  LeetCode.swift
//  LeetCode
//
//  Created by 董伍 on 2019/4/20.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

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
    
    /// 231. 2的幂
    func _231(_ n: Int) -> Bool{
        
        var hasOne: Bool = false
        
        var nn: Int = n
        while nn > 0{
            if nn & 1 == 1{
                if hasOne{
                    return false
                }
                hasOne = true
            }
            
            nn >>= 1
        }
        
        return hasOne
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
extension LeetCode{
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
    
    /// 整数转罗马数字
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
    
    /// 三数之和
    func _15(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        
        var rv: [[Int]] = []
        
        let maxIndex: Int = nums.count - 1
        if maxIndex < 2 {  return [] }
        
        var msv: Int = 0

        var d: Int = 0
        
        // 2. 遍历负数
        for i in 0...maxIndex{
            if sortedNums[i] > 0 { break }
            
            if i != 0{
                if sortedNums[i] == sortedNums[i - 1]{ // 临近的两个相同的数据，就没必要再来一次
                    continue
                }
            }
            
            // 剩下的数中，找和为N的两个数
            var l: Int = i + 1
            var r: Int = maxIndex
            
            while l < r{
                msv = sortedNums[l] + sortedNums[r] + sortedNums[i]
                
                if msv > 0{
                    r -= 1
                }
                else if msv < 0{
                    l += 1
                }
                else{
                    rv.append([sortedNums[i], sortedNums[l], sortedNums[r]])
                    
                    // l
                    d = 1
                    while l + d <= maxIndex && sortedNums[l + d] == sortedNums[l]{
                        d += 1
                    }
                    l += d
                    
                    // r
                    d = 1
                    while r - d >= 0 &&  sortedNums[r - d] == sortedNums[r]{
                        r -= 1
                    }
                    r -= d
                    
                }
            }
        }
        
        return rv
    }
    
    /// 最接近的三数之和
    func _16(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        
        let maxIndex: Int = nums.count - 1
        
        var rv: Int = Int.max
        var d: Int = 0
        
        // 剩下的数中，找和为N的两个数
        var l: Int = 0
        var r: Int = maxIndex
        
        for i in 0...maxIndex-2{
            
            l = i + 1
            r = maxIndex
            
            while l < r{
                d = sortedNums[i] + sortedNums[l] + sortedNums[r] - target
                
                if d == 0{
                    return target
                }
                
                if d < 0{
                    if abs(rv) > abs(d){
                        rv = d
                    }
                    
                    l += 1
                }
                else {
                    if abs(rv) > abs(d){
                        rv = d
                    }
                    
                    r -= 1
                }
            }
        }
        
        return rv + target
    }
    
    /// 不同路径 - 63的算法也可适用于此题
    func _62(_ m: Int, _ n: Int) -> Int {
        var paths = [[Int]].init(repeating: [Int].init(repeating: 1, count: n), count: m) // 记录到当前节点的路径数量
        
        var left: Int?
        var upper: Int?
        
        for column in 1..<n{
            for row in 1..<m{
                // 左
                if row == 0{
                    left = nil
                }
                else{
                    left = paths[row - 1][column]
                }
                
                // 上
                if column == 0{
                    upper = nil
                }
                else{
                    upper = paths[row][column - 1]
                }
                
                if left != nil, upper != nil{
                    paths[row][column] = left! + upper!
                }
                else{
                    if left != nil{
                        paths[row][column] = left!
                    }
                    else if upper != nil{
                        paths[row][column] = upper!
                    }
                }
            }
        }
        
        return paths[m - 1][n - 1]
    }
    
    /// 不同路径 II
    func _63(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty {
            return 0
        }
        
        let n = obstacleGrid.count
        let m = obstacleGrid[0].count
        
        var dp = Array<Int>(repeating: 0, count: m)
        dp[0] = obstacleGrid[0][0] == 1 ? 0 : 1
        
        for i in 0...n-1 {
            
            for j in 0...m-1 {
                
                if obstacleGrid[i][j] == 1 {
                    dp[j] = 0
                } else {
                    if j == 0 {
                        continue
                    } else {
                        dp[j] = dp[j-1] + dp[j]
                    }
                }
            }
        }
        return dp[m-1]
    }
    
    /// 最小路径和
    func _64(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count
        
        var paths = grid // 记录到当前节点的最短路径
        
        var left: Int?
        var upper: Int?
        
        for column in 0..<columns{
            for row in 0..<rows{
                // 左
                if row == 0{
                    left = nil
                }
                else{
                    left = paths[row - 1][column]
                }
                
                // 上
                if column == 0{
                    upper = nil
                }
                else{
                    upper = paths[row][column - 1]
                }
                
                if left != nil, upper != nil{
                    paths[row][column] = min(left!, upper!) + grid[row][column]
                }
                else{
                    if left != nil{
                        paths[row][column] = left! + grid[row][column]
                    }
                    else if upper != nil{
                        paths[row][column] = upper! + grid[row][column]
                    }
                }
            }
        }
        
        return paths[rows - 1][columns - 1]
    }
    
    /// 求众数 II
    func _229(_ nums: [Int]) -> [Int] {
        
        // 第一个众数
        var c1: Int = 0
        var rv1: Int = 0
        
        // 第二个众数
        var c2: Int = 0
        var rv2: Int = 0
        
        for item in nums{
            if c1 == 0{
                if c2 != 0 && item == rv2{
                    c2 += 1
                    continue
                }
                
                c1 = 1
                rv1 = item
            }
            else{
                if item == rv1{
                    c1 += 1
                    continue
                }
                
                if c2 == 0{
                    c2 = 1
                    rv2 = item
                    continue
                }
                
                if item == rv2{
                    c2 += 1
                }
                else{
                    c2 -= 1
                    c1 -= 1
                }
            }
            
//            下列注释的代码合并简化 -> 楼上的代码
//            if c2 > 0 && item == rv2{ // 当第一个众数正好被抵消完，但是第二个众数却还有值z，这个时候如果当前值是第二个众数，是不能赋值给第一个众数的
//                c2 += 1
//                continue
//            }
//
//            // 第一个众数
//            if c1 == 0{
//                c1 = 1
//                rv1 = item
//                continue
//            }
//
//            if item == rv1{
//                c1 += 1
//                continue
//            }
//            else if c2 > 0{
//                if item != rv2{
//                    c1 -= 1
//                }
//            }
//
//            // 第二个众数
//            if c2 == 0{
//                c2 = 1
//                rv2 = item
//                continue
//            }
//
//            if item == rv2{
//                c2 += 1
//                continue
//            }
//            else if item != rv1{
//                c2 -= 1
//            }
        }
        
        // 核验是否是众数，当只有一个众数的时候，上面的算法也会给出两个答案
        var rv: [Int] = []
        
        var cc1: Int = 0 // 核验是否是众数
        var cc2: Int = 0
        for item in nums{
            if item == rv1{
                cc1 += 1
            }
            else if item == rv2{
                cc2 += 1
            }
        }
        if cc1 > nums.count/3{
            rv.append(rv1)
        }
        if cc2 > nums.count/3{
            rv.append(rv2)
        }
        return rv
    }
}

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

//MARK: 回文
extension LeetCode{
    /// _9
}
