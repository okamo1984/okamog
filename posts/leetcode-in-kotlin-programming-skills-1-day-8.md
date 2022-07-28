---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 8
publish_date: 2022-04-10
tags: [Kotlin, LeetCode]
---

## 1768. Merge Strings Alternately

- 調べたもの
  - [StringBuilder](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/-string-builder/)

- コード

  ```kotlin
  class Solution {
      fun mergeAlternately(word1: String, word2: String): String {
          val sb = StringBuilder()
          val word1Len = word1.length
          val word2Len = word2.length
          val minLen = if (word1Len < word2Len) {
              word1Len
          } else {
              word2Len
          }
          for (i in 0 until minLen) {
              sb.append(word1[i])
              sb.append(word2[i])
          }
          if (word1Len < word2Len) {
              sb.append(word2.substring(minLen until word2Len))
          } else {
              sb.append(word1.substring(minLen until word1Len))
          }
          return sb.toString()
      }
  }
  ```

## 1678. Goal Parser Interpretation

- 調べたもの
  - [replace](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/replace.html

- コード

  ```kotlin
  class Solution {
  class Solution {
      fun interpret(command: String): String {
          return command.replace("""()""", "o").replace("""(al)""", "al")
      }
  }
  ```

- 感想
  - ちゃんとパーサ書いた方が良い

    ```kotlin
    class Solution {
        fun interpret(command: String): String {
            val commandLen = command.length
            val sb = StringBuilder()
            var cursor = 0
            while (cursor < commandLen) {
                val c = command[cursor]
                if (c == 'G') {
                    sb.append(c)
                    cursor += 1
                } else if (c == 'a') {
                    sb.append("al")
                    cursor += 3
                } else if (c == ')') {
                    sb.append("o")
                    cursor += 1
                } else {
                    cursor += 1
                }
            }
            return sb.toString()
        }
    }
    ```

## 389. Find the Difference

- 調べたもの
  - [last](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/last.html)

- コード

  ```kotlin
  class Solution {
      fun findTheDifference(s: String, t: String): Char {
          val sortedS = s.toCharArray().sorted()
          val sortedT = t.toCharArray().sorted()
          for (i in 0 until s.length) {
              if (sortedS[i] != sortedT[i]) {
                  return sortedT[i]
              }
          }
          return sortedT.last()
      }
  }
  ```

- 問題の条件に特化した方法（文字をASCIIに変換）

  ```kotlin
  class Solution {
      fun findTheDifference(s: String, t: String): Char {
          return (t.map { it.toInt() }.sum() - s.map { it.toInt() }.sum()).toChar()
      }
  }
  ```
