---
title: LeetCodeのProgramming Skills 2をKotlinでやる - Day 2
publish_date: 2022-04-15
tags: [Kotlin, LeetCode]
---

## 110. Balanced Binary Tree

- コード

  ```kotlin
  class Solution {
      fun isBalanced(root: TreeNode?): Boolean {
          return isBalancedSubTree(root)
      }
      
      fun getDepth(node: TreeNode?, depth: Int): Int {
          if (node == null) {
              return depth
          }
          val newDepth = depth + 1
          if (node.left == null && node.right == null) {
              return newDepth
          }
          val leftDepth = getDepth(node.left, newDepth)
          val rightDepth = getDepth(node.right, newDepth)
          return if (leftDepth < rightDepth){
              rightDepth
          } else {
              leftDepth
          }
      }
      
      fun isBalancedSubTree(node: TreeNode?): Boolean {
          if (node == null) {
              return true
          }
          val left = getDepth(node.left, 0) 
          val right = getDepth(node.right, 0) 
          val diff = getDepth(node.left, 0) - getDepth(node.right, 0)
          if (diff > 1 || diff < -1) {
              return false
          }
          return isBalancedSubTree(node.left) && isBalancedSubTree(node.right)
      }
  }
  ```

- 感想
  - なんか再帰ばかりでいけてない気がする

## 459. Repeated Substring Pattern

- コード

  ```kotlin
  class Solution {
      fun repeatedSubstringPattern(s: String): Boolean {
          var slide = 0
          val length = s.length
          if (length == 1) {
              return false
          }
          for (slide in 1 .. length / 2) {
              if (length % slide != 0) {
                  continue
              }
              val pattern = s.slice(0 until slide)
              if (s == pattern.repeat(length / slide)) {
                  return true
              }
          }
          return false
      }
  }
  ```

- 感想
  - 悪くないコードだと思うが速度とメモリ使用量が悪い、sliceかrepeatが重いのだろうか
