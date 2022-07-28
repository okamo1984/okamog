---
title: LeetCodeのProgramming Skills 2をKotlinでやる - Day 3
publish_date: 2022-04-16
tags: [Kotlin, LeetCode]
---

## 150. Evaluate Reverse Polish Notation

- コード

  ```kotlin
  class Solution {
      fun evalRPN(tokens: Array<String>): Int {
          val nums = mutableListOf<Int>()
          for (t in tokens) {
              val size = nums.size
              when {
                  t == "+" -> {
                      nums.add(nums.removeAt(nums.size - 2) + nums.removeAt(nums.size - 1))
                  }
                  t == "-" -> {
                      nums.add(nums.removeAt(nums.size - 2) - nums.removeAt(nums.size - 1))
                  }
                  t == "*" -> {
                      nums.add(nums.removeAt(nums.size - 2) * nums.removeAt(nums.size - 1))
                  }
                  t == "/" -> {
                      nums.add(nums.removeAt(nums.size - 2) / nums.removeAt(nums.size - 1))
                  }
                  else -> {
                      nums.add(t.toInt())
                  }
              }
          }
          return nums[0]
      }
      
  }
  ```

## 66. Plus One

- コード

  ```kotlin
  class Solution {
      fun plusOne(digits: IntArray): IntArray {
          val size = digits.size
          val lastDigit = digits[size - 1]
          if (lastDigit != 9) {
              digits.set(size - 1, lastDigit + 1)
              return digits
          }
          digits.set(size - 1, 0)
          val indexesOfNineValues = mutableListOf<Int>()
          for (i in size - 2 downTo 0) {
              if (digits[i] != 9) {
                  digits.set(i, digits[i] + 1)
                  break
              }
              indexesOfNineValues.add(i)
          }
          if (indexesOfNineValues.size == size - 1) {
              return IntArray(size + 1) { i -> if (i == 0) { 1 } else { 0 }}
          }
          for (i in indexesOfNineValues) {
              digits.set(i, 0)
          }
          return digits
      }
  }
  ```
