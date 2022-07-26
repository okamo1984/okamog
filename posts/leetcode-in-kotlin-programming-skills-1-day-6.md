---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 6
publish_date: 2022-04-08
---

## 1588. Sum of All Odd Length Subarrays

- 調べたもの
  - [sliceArray](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/slice-array.html)
  - [break from outer](https://www.programiz.com/kotlin-programming/break)

- コード

  ```kotlin
  class Solution {
      fun sumOddLengthSubarrays(arr: IntArray): Int {
          var sumOfAllOddLengthSubarrays = 0
          outer@ for (slide in 1 .. arr.size step 2) {
              for (i in 0 .. arr.size - slide) {
                  val slicedArray = arr.sliceArray(i until i + slide)
                  if (slicedArray.size != slide)  {
                      break@outer
                  }
                  sumOfAllOddLengthSubarrays += slicedArray.sum()
              }
          }
          return sumOfAllOddLengthSubarrays
      }
  }
  ```

## 283. Move Zeroes

- コード

  ```kotlin
  class Solution {
      fun moveZeroes(nums: IntArray): Unit {
          var cursor = 0
          while (cursor != nums.size) {
              val v = nums[cursor]
              if (v == 0) {
                  cursor += 1
                  continue
              }
              var pos = cursor
              for (i in cursor - 1 downTo 0) {
                  if (nums[i] == 0) {
                      pos -= 1
                      continue
                  }
              }
              if (pos != cursor) {
                  nums[pos] = v
                  nums[cursor] = 0
              }            
              cursor += 1
          }        
      }
  }
  ```

## 1672. Richest Customer Wealth

- 調べたもの
  - [max](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/max.html)
  - [Sequence](https://kotlinlang.org/docs/sequences.html#construct)
- コード

  ```kotlin
  class Solution {
      fun maximumWealth(accounts: Array<IntArray>): Int {
          return accounts.map { it.sum() }.max() ?: 0
      }
  }
  ```
- 気になったこと
  - KotlinでFP使うと遅くなる、Streamで処理されていない？
    - `asSequence()`でも速度変わらないのでこういうもののようだ
  - Sequenceで必ず速くなるというわけでもないので普通に使って耐えられない遅さだったら使う、くらいで良いかもしれない
