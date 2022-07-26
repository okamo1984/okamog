---
title: LeetCodeのProgramming Skills 2をKotlinでやる - Day 1
publish_date: 2022-04-14
---

## 896. Monotonic Array

- 調べたもの
  - [convert binary string to int](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/to-int.html)

- コード

  ```kotlin
  class Solution {
      fun isMonotonic(nums: IntArray): Boolean {
          val size = nums.size
          if (size == 1) {
              return true
          }
          var flag = 0
          for (i in 0 until size - 1){
              val diff = nums[i + 1] - nums[i]
              if (diff == 0) {
                  continue
              }
              if ((flag > 0 && diff < 0) || (flag < 0 && diff > 0)) {
                  return false
              }
              if (flag == 0) {
                  flag = diff
              }
          }
          return true
      }
  }
  ```

## 28. Implement strStr()

- 調べたもの
  - [slice](https://www.codevscolor.com/kotlin-string-slice)
- コード

  ```kotlin
  class Solution {
      fun strStr(haystack: String, needle: String): Int {
          if (needle == "") {
              return 0
          }
          val slide = needle.length
          for (i in 0 .. haystack.length - slide) {
              val sub = haystack.slice(i until i + slide)
              if (sub == needle) {
                  return i
              }
          }
          return -1
      }
  }
  ```
