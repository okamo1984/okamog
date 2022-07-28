---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 5
publish_date: 2022-04-07
tags: [Kotlin, LeetCode]
---

## 589. N-ary Tree Preorder Traversal

- 調べたもの
  - [Append list](https://www.codevscolor.com/kotlin-add-items-to-list)

- コード

  ```kotlin
  class Solution {
      fun preorder(root: Node?): List<Int> {
          var values = mutableListOf<Int>()
          if (root == null) {
              return listOf<Int>()
          }
          values.add(root.`val`)
          values.addAll(traversal(root))
          return values
      }
      
      fun traversal(node: Node): List<Int> {
          var values = mutableListOf<Int>()
          for (child in node.children) {
              if (child == null) {
                  return values
              }
              values.add(child.`val`)
              values.addAll(traversal(child))
          }
          return values
      }
  }
  ```

## 496. Next Greater Element I

- 調べたもの
  - [IntArray](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-int-array/)
- コード

  ```kotlin
  class Solution {
      fun nextGreaterElement(nums1: IntArray, nums2: IntArray): IntArray {
          val greaters = IntArray(nums1.size)
          for (i in 0 until nums1.size) {
              val v1 = nums1[i]
              var found = false
              var greaterIsExist = false
              for (j in 0 until nums2.size) {
                  val v2 = nums2[j]
                  if (v1 == v2) {
                      found = true
                      continue
                  }
                  if (found && v1 < v2) {
                      greaterIsExist = true
                      greaters.set(i, v2)
                      break
                  }
              }
              if (!greaterIsExist) {
                  greaters.set(i, -1)
              }
          }
          return greaters
      }
  }
  ```

## 1232. Check If It Is a Straight Line

- 調べたもの
  - [sortedBy](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/sorted-by.html)
- コード

  ```kotlin
  class Solution {
      fun checkStraightLine(coordinates: Array<IntArray>): Boolean {
          val sortedCoordinates = coordinates.sortedBy { it[0] }
          var prevSlope: Int? = null
          for (i in 0 until sortedCoordinates.size - 1) {
              val (x, y) = sortedCoordinates[i]
              val (nextX, nextY) = sortedCoordinates[i+1]
              val dx = nextX - x
              val dy = nextY - y
              val slope = if (dx == 0) {
                  -1
              } else {
                  dy / dx
              }
              if (prevSlope != null && prevSlope != slope) {
                  return false
              }
              prevSlope = slope
          }
          return true
      }
  }
  ```
