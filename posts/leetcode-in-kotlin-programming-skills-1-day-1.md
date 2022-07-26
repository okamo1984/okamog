---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 1
publish_date: 2022-04-03
---

## 1523. Count Odd Numbers in an Interval Range

- 調べたもの
  - [Range](https://kotlinlang.org/docs/ranges.html#progression)
  - [Count iterables](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/count.html)
  - [asSequence](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/as-sequence.html)
  - [LongStream](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.streams/java.util.stream.-long-stream/)
  - [Slow range in Kotlin with FP](https://stackoverflow.com/questions/48317709/why-is-kotlins-map-filter-reduce-slower-than-javas-stream-operations-on-large)
  - [Int to Long](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-int/to-long.html)

- コード

  ```kotlin
  class Solution {
      fun countOdds(low: Int, high: Int): Int {
          var count = 0
          for (v in low..high) {
              if (v % 2 == 1) {
                  count++
              }
          }
          return count
      }
  }
  ```

- わかったこと
  - FilterとCountで実装すると処理時間が遅かった。`LongStream.range`であればlazy
    evaluationらしいのでこちらを使う。なお、Java1.8以降でないと使えないというエラーが出た。

## 1491. Average Salary Excluding the Minimum and Maximum Salary

- 調べたもの
  - [IntArray](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-int-array/)
  - [Basic types](https://kotlinlang.org/docs/basic-types.html#floating-point-types)

- コード

  ```kotlin
  class Solution {
      fun average(salary: IntArray): Double {
          var maximum = -1
          var minimum = -1
          var total = 0
          for (s in salary) {
              total += s
              if (maximum == -1 || maximum < s) {
                  maximum = s
              }
              if (minimum == -1 || s < minimum) {
                  minimum = s
              }
          }
          return (total - maximum - minimum).toDouble() / (salary.size -2)
      }
  }
  ```

- わかったこと
  - `Int / Int`だと除算の結果がIntになるので、分子を先にキャストしてから除算する
