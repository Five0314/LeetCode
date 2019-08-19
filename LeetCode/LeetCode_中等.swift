//
//  LeetCode_中等.swift
//  LeetCode
//
//  Created by 董伍 on 2019/7/29.
//  Copyright © 2019 董伍. All rights reserved.
//

import UIKit

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
    
    /// 搜索旋转排序数组
    func _33(_ nums: [Int], _ target: Int) -> Int {
        
        let maxIdx: Int = nums.count - 1
        
        var l: Int = 0
        var r: Int = maxIdx
        
        var m: Int = 0
        
        while l <= r{
            m = (l + r) >> 1
            
            if nums[m] == target{
                return m
            }
            
            if target < nums[m]{ // 找小的那部分
                if target <= nums[r] && nums[m] > nums[r]{
                    l = m + 1
                }
                else{
                    r = m - 1
                }
            }
            else{ // 找大的那部分
                if target >= nums[l] && nums[m] < nums[l]{
                    r = m - 1
                }
                else {
                    l = m + 1
                }
            }
        }
        
        return -1
    }
    
    /// 全排列 - 动态规划
    func _46(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [] }
        
        var rv: [[Int]] = [[nums[0]]]
        
        for j in 1..<nums.count{
            let num = nums[j]
            
            var v1: [[Int]] = []
            
            for item in rv{
                var v2: [[Int]] = []
                
                for i in 0..<item.count{
                    var v3: [Int] = item
                    v3.insert(num, at: i)
                    v2.append(v3)
                }
                var v3: [Int] = item
                v3.append(num)
                v2.append(v3)
                
                v1.append(contentsOf: v2)
            }
            
            rv = v1
        }
        
        return rv
    }
    
    /// 全排列 II
    func _47(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var nums = nums
        
        _47_permuteUnique(&nums, 0, &ans)
        
        return ans
    }
    
    func _47_permuteUnique(_ nums: inout [Int], _ startIndex: Int, _ ans: inout [[Int]]) {
        if startIndex >= nums.count {
            ans.append(nums)
            return
        }
        
        var set = Set<Int>()
        for index in startIndex ..< nums.count {
            if set.insert(nums[index]).inserted {
                nums.swapAt(index, startIndex)
                _47_permuteUnique(&nums, startIndex + 1, &ans)
                nums.swapAt(index, startIndex)
            }
        }
    }
    
    fileprivate func _47_作废() {
        //    /// 耗时96
        //    func _47(_ nums: [Int]) -> [[Int]] {
        //        if nums.isEmpty { return [] }
        //        if nums.count == 1 { return [nums]}
        //
        //        let numSet: Set<Int> = Set(nums)
        //
        //        var rv: [[Int]] = []
        //
        //        for num in numSet{
        //
        //            var otherNums: [Int] = nums
        //            for (i, v) in otherNums.enumerated(){
        //                if v == num{
        //                    otherNums.remove(at: i)
        //                    break
        //                }
        //            }
        //            let others: [[Int]] = self._47_2(otherNums)
        //
        //            for var item in others{
        //                item.insert(num, at: 0)
        //                rv.append(item)
        //            }
        //        }
        //
        //        return rv
        //    }
        //    func _47_Exist(_ nums: inout [Int], l: Int, r: Int, target: Int) -> Bool{
        //        for i in l...r{
        //            if nums[i] == target{
        //                return true
        //            }
        //        }
        //        return false
        //    }
        //    func _47(_ nums1: [Int]) -> [[Int]] {
        //        if nums1.isEmpty { return [] }
        //
        //        let maxi = nums1.count - 1
        //
        //        var newNums: [Int] = nums1
        //        // 双指针法 保证前面的都是不一样的
        //        var l: Int = 1
        //        var r: Int = maxi
        //
        //        while l < r{
        //            if self._47_Exist(&newNums, l: 0, r: l - 1, target: newNums[l]){ // 存在，说明此值乃重复的值，后移
        //                (newNums[l], newNums[r]) = (newNums[r], newNums[l])
        //
        //                r -= 1
        //            }
        //            else{
        //                l += 1
        //            }
        //        }
        //
        //
        //        // 前面肯定没有重复的部分
        //        var rv: [[Int]] = [[newNums[0]]]
        //
        //        for j in 1...l{
        //            let num = newNums[j]
        //
        //            var v1: [[Int]] = []
        //
        //            for item in rv{
        //                var v2: [[Int]] = []
        //
        //                let c = item.count
        //
        //                var v3: [Int] = item // 首
        //                v3.insert(num, at: 0)
        //                v2.append(v3)
        //
        //                if c > 1{ // 中
        //                    for i in 1..<c{
        //                        if i == 0 || item[i] != item[i - 1] {
        //                            var v3: [Int] = item
        //                            v3.insert(num, at: i)
        //                            v2.append(v3)
        //                        }
        //                    }
        //                }
        //
        //                if num != item[c - 1]{ // 尾
        //                    v3 = item
        //                    v3.append(num)
        //                    v2.append(v3)
        //                }
        //
        //                v1.append(contentsOf: v2)
        //            }
        //
        //            rv = v1
        //        }
        //
        //        if l >= maxi{
        //            return rv
        //        }
        //
        //        // 再把后面铁定有重复的部分 - 插入
        //        for j in (l + 1)...maxi{
        //            let num = newNums[j]
        //
        //            var v1: [[Int]] = []
        //
        //            for item in rv{
        //                var v2: [[Int]] = []
        //
        //                let c = item.count
        //
        //                for i in 0..<c{
        //                    if item[i] != num{
        //                        var v3: [Int] = item
        //                        v3.insert(num, at: i)
        //                        v2.append(v3)
        //                    }
        //                }
        //
        //                // 尾
        //                var v3: [Int] = item
        //                v3.append(num)
        //                v2.append(v3)
        //
        //                v1.append(contentsOf: v2)
        //            }
        //
        //            rv = v1
        //        }
        //
        //        return rv
        //    }
    }
    
    /// 螺旋矩阵
    func _54(_ matrix: [[Int]]) -> [Int] {
        
        if matrix.isEmpty { return [] }
        
        var left: Int = 0
        var top: Int = 0
        var right: Int = matrix[0].count - 1
        var bottom: Int = matrix.count - 1
        
        var rv: [Int] = []
        
        //        var direction: Int = 4 // 上 下 左 右 1、2、3、4
        
        while left <= right && top <= bottom {
            
            // Top - 从左到右
            if left > right{
                break
            }
            for i in left...right{
                rv.append(matrix[top][i])
            }
            top += 1
            
            // Right - 从上到下
            if top < bottom{
                for i in top..<bottom{
                    rv.append(matrix[i][right])
                }
            }
            
            // Bottom - 从右到左
            if top <= bottom{
                for i in stride(from: right, through: left, by: -1){
                    rv.append(matrix[bottom][i])
                }
            }
            else{
                break
            }
            right -= 1
            bottom -= 1
            
            // Left - 从下到上
            if top <= bottom && left <= right{
                for i in stride(from: bottom, through: top, by: -1){
                    rv.append(matrix[i][left])
                }
            }
            left += 1
        }
        
        return rv
    }
    
    /// 螺旋矩阵 II
    func _59(_ n: Int) -> [[Int]] {
        var rv: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: n)
        
        let tc: Int = n * n
        var cc: Int = 1
        
        var l: Int = 0
        var r: Int = n - 1
        var t: Int = 0
        var b: Int = n - 1
        
        while cc < tc{
            // Top - 从左到右
            for i in l...r{
                rv[t][i] = cc
                cc += 1
            }
            t += 1
            
            // Right - 从上到下
            if b > t{
                for i in t..<b{
                    rv[i][r] = cc
                    cc += 1
                }
            }
            
            // Bottom - 从右到左
            for i in (l...r).reversed(){
                rv[b][i] = cc
                cc += 1
            }
            r -= 1
            b -= 1
            
            // Left - 从下到上
            if b >= t{
                for i in (t...b).reversed(){
                    rv[i][l] = cc
                    cc += 1
                }
            }
            l += 1
        }
        
        if cc == tc{
            rv[l][t] = cc
        }
        
        return rv
    }
    
    /// 旋转链表
    func _61(_ head: ListNode?, _ k: Int) -> ListNode? {
        var preNode: ListNode? = nil
        var i: Int = 0
        
        var cn: ListNode? = head
        
        while i < k || cn != nil{
            if i == k{
                if preNode == nil{
                    preNode = head
                }
                else{
                    preNode = preNode?.next
                }
                
                cn = cn?.next
            }
            else{
                i += 1
                
                if cn?.next == nil{
                    return _61(head, k % i)
                }
                else{
                    cn = cn?.next ?? head
                }
            }
        }
        
        let rv: ListNode? = preNode?.next ?? head
        
        cn = rv
        while cn?.next != nil{
            cn = cn?.next
        }
        cn?.next = head
        preNode?.next = nil
        
        return rv
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
    
    /// 子集 - 位运算解法
    func _78(_ nums: [Int]) -> [[Int]] {
        
        let n = Int(pow(2.0, Double(nums.count)))
        
        // 1. 二进制
        var rv: [[Int]] = [[Int]].init(repeating: [], count: n)
        var ci: Int = 0
        var j: Int = 0
        
        for i in 0..<n{
            
            ci = i
            j = 0
            
            while ci != 0{
                if ci & 1 == 1{
                    rv[i].append(nums[j])
                }
                
                j += 1
                ci >>= 1
            }
        }
        
        return rv
    }
    
    /// 搜索旋转排序数组 II - 基于33题，加了首尾数字一样数字类型的判断
    func _81(_ nums: [Int], _ target: Int) -> Bool {
        
        let maxIdx: Int = nums.count - 1
        
        var l: Int = 0
        var r: Int = maxIdx
        
        var m: Int = 0
        
        while l <= r{
            m = (l + r) >> 1
            
            if nums[m] == target{
                return true
            }
            
            if target < nums[m]{ // 找小的那部分
                if target <= nums[r]{
                    if nums[m] > nums[r]{
                        l = m + 1
                    }
                    else if nums[m] == nums[l] && m > 0{ // 11111011111
                        for i in m...maxIdx{
                            if nums[i] < nums[m]{
                                l = m + 1
                                break
                            }
                        }
                        
                        if l != m + 1{
                            r = m - 1
                        }
                    }
                    else{
                        r = m - 1
                    }
                }
                else{
                    r = m - 1
                }
            }
            else{ // 找大的那部分
                if target >= nums[l]{
                    if nums[m] < nums[l]{
                        r = m - 1
                    }
                    else if nums[m] == nums[l] && m < maxIdx{ // 11111311111
                        // 11 1 11311111
                        for i in m + 1...maxIdx{
                            if nums[i] > nums[m]{ // 说明大数区间在右边
                                l = m + 1
                                break
                            }
                        }
                        
                        if l != m + 1{
                            r = m - 1
                        }
                    }
                    else{
                        l = m + 1
                    }
                    
                }
                else {
                    l = m + 1
                }
            }
        }
        
        return false
    }
    
    /// 只出现一次的数字 II
    func _137(_ nums: [Int]) -> Int {
        //        var one: Int = 0, two: Int = 0, three: Int = 0
        //
        //        for item in nums{
        //            two |= one & item
        //            one ^= item
        //            three = one & two
        //
        //            one &= ~three
        //            two &= ~three
        //        }
        //
        //        return one
        
        var a = 0,b = 0
        nums.forEach { (x) in
            b = (b ^ x) & ~a;
            a = (a ^ x) & ~b;
        }
        
        return b
    }
    
    /// 寻找旋转排序数组中的最小值
    func _153(_ nums: [Int]) -> Int {
        var l: Int = 0
        var r: Int = nums.count - 1
        var m: Int = 0
        
        while l < r {
            m = (r + l) >> 1
            
            if nums[m] < nums[r]{
                r = m
            }
            else{
                l = m + 1
            }
        }
        
        return nums[l]
    }
    
    /// 数字范围按位与
    /// 如果 n 比 m 长 例如，（m = 11, n = 111），此时他们之间的数必然有数存在之间所有的二进制位上存在0
    /// 只有没有进位，所有数的&值，才有可能存在都有1的情况，所以，如果有进位结果肯定是0
    func _201(_ m: Int, _ n: Int) -> Int {
        
        var l: Int = m
        var r: Int = n
        
        var count = 0
        while l != r {
            l >>= 1
            r >>= 1
            count += 1
        }
        return l << count
    }
    
    /// 数组中的第K个最大元素 - 升序的第 nums.count-K 个元素 、 降序的第 K-1 个元素 - 本方法采用升序
    func _215(_ nums: [Int], _ k: Int) -> Int {
        
        let tagIndex: Int = nums.count - k

        var newNums = nums
        var ranges: [(Int, Int)] = [(0, newNums.count - 1)]
        var left: Int = 0

        while !ranges.isEmpty {
            let range = ranges.removeLast()

            let ii = Int.random(in: range.0...range.1) // 为毛来这两行代码呢，其实就是赌，万一随机到的数字正好是目标数字呢，测试结果就是这个概率还是比较高的。没有这两行，时间在168ms，有这两行是72ms
            newNums.swapAt(range.0, ii)
            let mid = newNums[range.0]
            left = range.0

            for i in range.0...range.1{
                if newNums[i] < mid{
                    left += 1
                    newNums.swapAt(i, left)
                }
            }

            if left == tagIndex{
                return mid
            }

            newNums.swapAt(range.0, left)
            if left > tagIndex{
                ranges.append((range.0, left - 1))
            }

            if left < tagIndex{
                ranges.append((left + 1, range.1))
            }
        }

        return newNums[tagIndex]
//        var nums = nums
//        return quick(nums: &nums, from: 0, to: nums.count - 1, k: k - 1)
    }
    
//    func quick(nums: inout [Int], from: Int, to: Int, k: Int) -> Int {
//        if from == to {
//            return nums[from]
//        }
//        let index = split(nums: &nums, from: from, to: to)
//        if index == k {
//            return nums[k]
//        } else if index < k  {
//            return quick(nums: &nums, from: index + 1, to: to, k: k)
//        } else if index > k {
//            return quick(nums: &nums, from: from, to: index - 1, k: k)
//        }
//
//        return 0
//    }
//
//    func randomPivot(_ a: inout [Int], _ low : Int , _ high : Int) -> Int {
//        let pivot = Int.random(in: low..<high)
//        a.swapAt(pivot, high)
//        return a[high]
//    }
//
//    func split(nums: inout [Int], from: Int, to: Int) -> Int {
//        let pivot = randomPivot(&nums, from, to)
//        var i = from
//        for j in from...to {
//            if nums[j] > pivot {
//                nums.swapAt(i, j)
//                i += 1
//            }
//        }
//        nums.swapAt(to, i)
//        return i
//    }
    
    
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
    
    /// 除自身以外数组的乘积
    func _238(_ nums: [Int]) -> [Int] {
        
        var rv: [Int] = [Int].init(repeating: 0, count: nums.count)
        
        var s: Int = 1
        
        for i in 0..<rv.count{
            rv[i] = s // s = i 左边所有元素的积
            s *= nums[i]
        }
        
        s = 1
        for i in (0..<rv.count).reversed(){
            rv[i] *= s // s = i 右边所有元素的积，上面的遍历已经算出了左边所有原的积，则两者相乘 = 除了自身外所有元素的积
            s *= nums[i]
        }

        
        return rv
    }
    
    /// 只出现一次的数字 III
    func _260(_ nums: [Int]) -> [Int] {
        
        var a: Int = 0, b: Int = 0
        var s: Int = 0
        
        for item in nums{
            s ^= item
        }
        
        let m: Int = s & -s;
        
        for item in nums{
            if item & m == 0{
                a ^= item
            }
            else{
                b ^= item
            }
        }
        
        return [a, b]
    }
    
    /// 分隔链表
    func _725(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        if k == 1{ return [root] }
        
        var tc: Int = 0
        var cn: ListNode? = root
        while cn != nil{ // 遍历出总数
            tc += 1
            cn = cn?.next
        }
        
        let c: Int = tc / k
        let remainder: Int = tc % k
        let c1: Int = c + 1
        
        var rv: [ListNode?] = [ListNode?].init(repeating: nil, count: k)
        if root == nil { return rv }
        rv[0] = root
        
        cn = root
        
        var c2: Int = 0
        
        var i: Int = 0
        while cn != nil{
            
            c2 += 1
            
            if i < remainder{ // c1
                if c2 >= c1{
                    i += 1
                    c2 = 0
                    
                    rv[i] = cn?.next
                    cn?.next = nil
                    cn = rv[i]
                }
                else{
                    cn = cn?.next
                }
            }
            else{ // c
                if c2 >= c{
                    i += 1
                    c2 = 0
                    
                    if i < k{
                        rv[i] = cn?.next
                        cn?.next = nil
                        cn = rv[i]
                    }
                    else{
                        break
                    }
                }
                else{
                    cn = cn?.next
                }
            }
        }
        
        return rv
    }
    
}
