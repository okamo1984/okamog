---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 4n
publish_date: 2022-04-06
---

## 1822. Sign of the Product of an Array

- 調べたもの
  - [reduce](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/reduce.html)
  - [when](https://kotlinlang.org/docs/control-flow.html#when-expression)

- コード

  ```kotlin
  class Solution {
      fun arraySign(nums: IntArray): Int {
          var product = 1
          for (n in nums) {
              val casted = if (n > 0) {
                  1
              } else if (n < 0) {
                  -1
              } else {
                  return 0
              }
              product *= casted
          }
          return product
      }
  }
  ```

- ポイント
  - 桁溢れが起こるので、正の場合は`1`に変換して負の場合は`-1`に変換する

## 1502. Can Make Arithmetic Progression From Sequence

- コード

  ```kotlin
  class Solution {
      fun canMakeArithmeticProgression(arr: IntArray): Boolean {
          val sorted = arr.sort()
          val diff = arr[1] - arr[0]
          for (i in 1 until arr.size - 1) {
              if (arr[i + 1] - arr[i] != diff) {
                  return false
              }
          }
          return true
      }
  }
  ```

## 202. Happy Number

- コード

  ```kotlin
  class Solution {
      fun isHappy(n: Int): Boolean {
          val appearedNumbers = mutableSetOf<Int>()
          var number = n
          while (true) {
              number = calc(number)
              if (number == 1) {
                  return true
              }
              if (number in appearedNumbers) {
                  break
              }
              appearedNumbers.add(number)
          }
          return false
      }
      
      fun calc(n: Int): Int {
          val numbers = mutableListOf<Int>() 
          var temp = n
          while (temp / 10 != 0) {
              numbers.add(temp % 10)
              temp /= 10
          }
          numbers.add(temp % 10)
          var sum = 0
          for (number in numbers) {
              sum += (number * number)
          }
          return sum
      }
  }
  ```

## 1790. Check if One String Swap Can Make Strings Equal

- 調べたもの
  - [Set](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/-set/)
  - [Length of String](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-string/length.html)
- コード

  ```kotlin
  class Solution {
      fun areAlmostEqual(s1: String, s2: String): Boolean {
          if (s1 == s2) {
              return true
          }
          var notEqualS1String = ""
          var notEqualS2String = ""
          var notEqualCharCount = 0
          for (i in 0 until s1.length) {
              if (s1[i] == s2[i]) {
                  continue
              }
              notEqualCharCount += 1
              if (notEqualCharCount > 2) {
                  return false
              }
              notEqualS1String += s1[i]
              notEqualS2String = s2[i] + notEqualS2String
          }
          return if (notEqualS1String == notEqualS2String) {
              true
          } else {
              false
          }
      }
  }
  ```
