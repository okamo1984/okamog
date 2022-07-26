---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 7
publish_date: 2022-04-09
---

## 1572. Matrix Diagonal Sum

- 調べたもの
  - [lastIndex](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/last-index.html)

- コード

  ```kotlin
  class Solution {
      fun diagonalSum(mat: Array<IntArray>): Int {
          val lastIndex = mat.lastIndex
          var sum = 0
          for (i in 0 .. lastIndex) {
              sum += mat[i][i]
              val j = lastIndex - i
              if (i != j) {
                  sum += mat[i][j]
              }
          }
          return sum
      }
  }
  ```

## 566. Reshape the Matrix

- 調べたもの
  - [flatten](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/flatten.html)
  - [create 2d array with size](https://stackoverflow.com/questions/34145495/2d-array-in-kotlin)

- コード

  ```kotlin
  class Solution {
      fun matrixReshape(mat: Array<IntArray>, r: Int, c: Int): Array<IntArray> {
          val totalElements = mat.map { it.size }.sum()
          if (totalElements != r * c) {
              return mat
          }
          val reshapedArray = Array(r) { IntArray(c) }
          var currentRow = 0
          var currentCol = 0
          for (rows in mat) {
              for (col in rows) {
                  reshapedArray[currentRow][currentCol] = col
                  if (currentCol == c - 1) {
                      currentRow += 1
                      currentCol = 0
                  } else {
                      currentCol += 1
                  }
              }
          }
          return reshapedArray
      }
  }
  ```
