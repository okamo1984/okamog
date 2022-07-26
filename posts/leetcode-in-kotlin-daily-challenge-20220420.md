---
title: LeetCodeのDaily ChallengeをKotlinでやる - 2022/04/20
publish_date: 2022-04-20
---

## 173. Binary Search Tree Iterator

- コード

  ```kotlin
  class BSTIterator(root: TreeNode?) {
      
      private val treeStack = mutableListOf<TreeNode>(root!!)
      private var node = root!!
      private var isPop = false
      
      fun next(): Int {
          if (isPop) {
              isPop = false
              val valueNode = pop()
              if (valueNode.right != null) {
                  treeStack.add(valueNode.right)
                  node = valueNode.right
              } else {
                  isPop = true
              }
              return valueNode.`val`
          }        
          if (node.left == null && node.right == null) {
              val valueNode = pop()
              isPop = true
              return valueNode.`val`
          }
          
          findLeft(node)
          val valueNode = pop()
          if (valueNode.right == null) {
              isPop = true
          } else {
              treeStack.add(valueNode.right)
              node = valueNode.right
          }
          return valueNode.`val`
      }
      
      fun findLeft(node: TreeNode): TreeNode {
          var n = node
          while (n.left != null) {
              n = n.left
              treeStack.add(n)
          }
          return n
      }
      
      fun pop(): TreeNode = treeStack.removeAt(treeStack.size - 1)
      
      fun hasNext(): Boolean = treeStack.size > 0

  }
  ```

- 感想
  - rootがnullableなのやめてほしい
  - 時間がかかってしまい、こういう問題に弱いことがわかる
    - Mediumを集中的にやろうかな
