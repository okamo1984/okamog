---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 2
publish_date: 2022-04-04
---

## 191. Number of 1 Bits

- 調べたもの
  - [Int to binary string](https://stackoverflow.com/questions/50173028/how-to-get-binary-representation-of-int-in-kotlin)

- コード

  ```kotlin
  class Solution {
      // you need treat n as an unsigned value
      fun hammingWeight(n:Int):Int {
          return n.toUInt().toString(radix = 2).filter { it == '1' }.count()
      }
  }
  ```

## 1281. Subtract the Product and Sum of Digits of an Integer

- コード

  ```kotlin
  class Solution {
      fun subtractProductAndSum(n: Int): Int {
          var sum = 0
          var product = 1
          var nn = n
          while (nn / 10 != 0) {
              val v = nn % 10
              sum += v
              product *= v
              nn /= 10
          }
          val m = nn % 10
          sum += m
          product *= m
          return product - sum
      }
  }
  ```
