---
title: LeetCodeのProgramming Skills 2をKotlinでやる - Day 9
publish_date: 2022-04-17
tags: [Kotlin, LeetCode]
---

## 1630. Arithmetic Subarrays

- コード

  ```kotlin
  class Solution {
      fun checkArithmeticSubarrays(nums: IntArray, l: IntArray, r: IntArray): List<Boolean> {
          var isArithmetic = mutableListOf<Boolean>()
          for ((start, end) in l.zip(r)) {
              isArithmetic.add(checkArrayIsArithmetic(nums.slice(start .. end)))
          }
          return isArithmetic
      }
      
      fun checkArrayIsArithmetic(array: List<Int>): Boolean {
          val sortedArray = array.sorted()
          val diff = sortedArray[1] - sortedArray[0]
          for (i in 2 until sortedArray.size) {
              if ((sortedArray[i] - sortedArray[0]) != diff * i) {
                  return false
              }   
          }
          return true
      }
  }
  ```

- 感想
  - とても筋が悪い実装のようだ・・
  - `if ((sortedArray[i] - sortedArray[0]) != diff * i)`を`if ((sortedArray[i] - sortedArray[i - 1]) != diff)`に変えたらかなりの改善となった、なぜだろう、ただの乗算でも数が大きくなるとコストが高くなるのか
    - 何度か実行するとやはり良くない結果、うーむ

## 429. N-ary Tree Level Order Traversal

- コード

  ```kotlin
  class Solution {
      fun levelOrder(root: Node?): List<List<Int>> {
          if (root == null) {
              return emptyList()
          }
          var levelList = mutableListOf<MutableList<Int>>(mutableListOf(root.`val`))
          addNodeValuesToLevelList(root, levelList, 0)
          return levelList
      }
      
      fun addNodeValuesToLevelList(node: Node, levelList: MutableList<MutableList<Int>>, level: Int) {
          if (node == null) {
              return
          }
          if (node.children.isEmpty()) {
              return
          }
          val nextLevel = level + 1
          if (levelList.size < nextLevel + 1) {
              levelList.add(mutableListOf<Int>())
          }
          for (child in node.children) {
              if (child == null) {
                  continue
              }
              levelList[nextLevel].add(child.`val`)
              addNodeValuesToLevelList(child, levelList, nextLevel)
          }
      }
  }
  ```

- 感想
  - 副作用まみれ、仕事でこのコードは書かないな、リファクタする
