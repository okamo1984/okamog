---
title: LeetCodeのProgramming Skills 1をKotlinでやる - Day 10
publish_date: 2022-04-12
---

## 1290. Convert Binary Number in a Linked List to Integer

- 調べたもの
  - [convert binary string to int](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/to-int.html)

- コード

  ```kotlin
  class Solution {
      fun getDecimalValue(head: ListNode?): Int {
          var node = head
          val sb = StringBuilder()
          while (node != null) {
              sb.append(node.`val`)
              node = node.next
          }
          return sb.toString().toInt(2)
      }
  }
  ```

## 876. Middle of the Linked List

- コード

  ```kotlin
  class Solution {
      fun middleNode(head: ListNode?): ListNode? {
          var node = head
          val values = mutableListOf<ListNode?>()
          while (node != null) {
              values.add(node)
              node = node.next
          }
          return values.get(values.size / 2)
      }
  }
  ```

## 104. Maximum Depth of Binary Tree

- コード

  ```kotlin
  class Solution {
      fun maxDepth(root: TreeNode?): Int {
          if (root == null) {
              return 0
          }
          return getDepth(root, 1)
      }
      
      fun getDepth(node: TreeNode?, depth: Int): Int {
          if (node == null) {
              return depth
          }
          var leftDepth = depth
          if (node.left != null) {
              leftDepth = getDepth(node.left, leftDepth + 1)
          }
          var rightDepth = depth
          if (node.right != null) {
              rightDepth = getDepth(node.right, rightDepth + 1)
          }
          return if (leftDepth < rightDepth) {
              rightDepth
          } else {
              leftDepth
          }
      }
  }
  ```

## 404. Sum of Left Leaves

- コード

  ```kotlin
  class Solution {
      fun sumOfLeftLeaves(root: TreeNode?): Int {
          if (root == null) {
              return 0
          }
          return getLeftLeafValue(root, false)
      }
      
      fun getLeftLeafValue(node: TreeNode?, isLeft: Boolean): Int {
          if (node == null) {
              return 0
          }
          if (node.left == null && node.right == null && isLeft) {
              return node.`val`
          }
          var sum = 0
          sum += getLeftLeafValue(node.left, true)
          sum += getLeftLeafValue(node.right, false)
          return sum
      }
  }
  ```
