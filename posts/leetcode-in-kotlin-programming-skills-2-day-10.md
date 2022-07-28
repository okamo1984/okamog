---
title: LeetCodeのProgramming Skills 2をKotlinでやる - Day 10
publish_date: 2022-04-18
tags: [Kotlin, LeetCode]
---

## 503. Next Greater Element II

- コード

  ```kotlin
  class Solution {
      fun nextGreaterElements(nums: IntArray): IntArray {
          val results = mutableListOf<Int>()
          val size = nums.size
          for (i in 0 until size) {
              val elem = nums[i]
              var nextElem = elem
              for (j in 1 .. size) {
                  val index = if (i + j == size) {
                      0
                  } else {
                      (i + j) % size
                  }
                  val otherElem = nums[index]
                  if (nextElem < otherElem) {
                      nextElem = otherElem
                      break
                  }
              }
              if (nextElem == elem) {
                  nextElem = -1
              }
              results.add(nextElem)
          }
          return results.toIntArray()
      }
  }
  ```

- 感想
  - なんか他に良い実装あるのかな

## 

- コード

  ```kotlin
  class Solution {
      fun nextGreaterElement(n: Int): Int {
          var digits = mutableListOf<Int>()
          var nn = n
          while (nn / 10 != 0) {
              digits.add(nn % 10)
              nn = nn / 10
          }
          digits.add(nn % 10)
          if (digits.size == 2) {
              return if (digits[0] == 0 || digits[1] >= digits[0]) {
                  return -1
              } else {
                  return digits[0] * 10 + digits[1]
              }
          }
          val found = findNextGreaterElement(digits)
          if (found.isEmpty()) {
              return -1
          }
          val sum = calculateDigits(found)
          return if (sum < n) {
              -1
          } else {
              sum
          }
      }
      
      fun findNextGreaterElement(digits: MutableList<Int>): List<Int> {
          val size = digits.size
          var x = 0
          var y = size
          for (i in 0 until size - 1) {
              for (j in i + 1 until size) {
                  if (j < y && digits[i] > digits[j]) {
                      x = i
                      y = j
                  }
              }
          }
          if (y == size) {
              return emptyList()
          }
          val temp = digits[x]
          digits[x] = digits[y]
          digits[y] = temp
          val beforeSwap = digits.slice(0 until y)
          val afterSwap = digits.slice(y until size)
          val result = mutableListOf<Int>()
          result.addAll(beforeSwap.toIntArray().sortedDescending())
          result.addAll(afterSwap)
          return result
      }
      
      fun calculateDigits(digits: List<Int>): Int {
          var sum = 0
          val size = digits.size
          for (i in 0 until size) {
              var v = digits[i]
              for (i in 0 until i) {
              v *= 10 
              }
              sum += v
          }
          return sum
      }
  }
  ```

- 感想
  - 問題解くためだけのクソコードになった、やる意味がなかった
