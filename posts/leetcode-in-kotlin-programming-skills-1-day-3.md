---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 3
publish_date: 2022-04-05
tags: [Kotlin, LeetCode]
---

## 976. Largest Perimeter Triangle

- 調べたもの
  - [Ordering](https://kotlinlang.org/docs/collection-ordering.html#natural-order)
  - [For loop start from a given index](https://stackoverflow.com/questions/59346997/kotlin-for-loop-start-from-a-given-index)

- コード

  ```kotlin
  class Solution {
      fun largestPerimeter(nums: IntArray): Int {
          val sortedDescending = nums.sortedDescending()
          for (i in 0 .. nums.size - 2) {
              val first = sortedDescending[i]
              val second = sortedDescending[i+1]
              val diff = first - second
              for (j in i+2 until sortedDescending.size) {
                  val v = sortedDescending[j]
                  if (v > diff) {
                      return first + second + v
                  }
              }
          }
          return 0
      }
  }
  ```

- 良くないコードなのでアルゴリズムを再考する

## 1779. Find Nearest Point That Has the Same X or Y Coordinate

- 調べたもの
  - [If expression](https://kotlinlang.org/docs/control-flow.html#if-expression)

- コード

  ```kotlin
  class Solution {
      fun nearestValidPoint(x: Int, y: Int, points: Array<IntArray>): Int {
          var i = -1
          var d = -1
          for ((index, point) in points.withIndex()) {
              val a = point[0]
              val b = point[1]
              if (a == x || b == y) {
                  val dx = if (a - x < 0) {
                      x - a
                  } else { 
                      a - x
                  }
                  val dy = if (b - y < 0) {
                      y - b
                  } else {
                      b - y
                  }
                  if (d == -1 || dx + dy < d) {
                      d = dx + dy
                      i = index
                  }
              }
          }
          return i
      }
  }
  ```
