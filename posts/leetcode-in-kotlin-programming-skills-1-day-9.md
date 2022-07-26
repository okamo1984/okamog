---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 9
publish_date: 2022-04-11
---

# LeetCodeのProgramming Skills 1をKotlinでやる - Day 9

## 709. To Lower Case

- 調べたもの
  - [convert char array to string](https://www.techiedelight.com/convert-character-array-to-string-kotlin/)

- コード

  ```kotlin
  class Solution {
      fun toLowerCase(s: String): String {
          return s.map {
              var n = it.toInt()
              if (64 < n && n < 91) {
                  n += 32 
                  n.toChar()
              } else {
                  it
              }
          }.joinToString("")
      }
  }
  ```

## 1309. Decrypt String from Alphabet to Integer Mapping

- コード

  ```kotlin
  class Solution {
      fun freqAlphabets(s: String): String {
          val characters = ('a'..'z').toList()
          var first = ""
          var second = ""
          val sb = StringBuilder()
          for (c in s) {
              if (first == "") {
                  first = c.toString()
              } else if (second == "") {
                  second = c.toString()
              } else if (c != '#') {
                  sb.append(characters[first.toInt() - 1])
                  first = second
                  second = c.toString()
              } else {
                  sb.append(characters[(first + second).toInt() - 1])
                  first = ""
                  second = ""
              }
          }
          if (first != "") {
              sb.append(characters[first.toInt() - 1])
          }
          if (second != "") {
              sb.append(characters[second.toInt() - 1])
          }
          return sb.toString()
      }
  }
  ```

- 感想
  - もっとエレガントなコードを考えたい

## 953. Verifying an Alien Dictionary

- コード

  ```kotlin
  class Solution {
      fun isAlienSorted(words: Array<String>, order: String): Boolean {
          for (i in 0 until words.size - 1) {
              val word = words[i]
              val nextWord = words[i+1]
              if (!isSortedByOrder(word, nextWord, order)) {
                  return false
              }
          }
          return true
      }
      
      fun isSortedByOrder(word: String, nextWord: String, order: String): Boolean {
          if (word == nextWord) {
              return true
          }
          val minLen = if (word.length < nextWord.length) {
              word.length
          } else {
              nextWord.length
          }
          for (i in 0 until minLen) {
              val c = word[i]
              val nc = nextWord[i]
              if (c == nc) {
                  continue
              }
              val ci = order.indexOf(c)
              val nci = order.indexOf(nc)
              if (ci < nci) {
                  return true
              } else {
                  return false
              }
          }
          return word.length < nextWord.length
      }
  }
  ```
