---
title: Kotlin in Actionを読んで気になった箇所まとめ - Chapter 5
publish_date: 2022-04-19
description: Kotlin In Action Chapter 5を読んで気になったこと
---

- `it.age`よりも`Person::age`のようにmemberを明示的に指定すると可読性が上がる
  - memberを使う場合は`{}`は使わない
  - extension functionでも使える
  - instanceに使用することもできる
    ```kotlin
    data class Person(val name: String, val age: Int)
    val p = Person("hoge", 37)
    val getAge = p::age
    ```
- `run`で即時関数を実行できる
- 引数に関数がある場合、lambdaを外だしできる
- top levelで定義されているものはclass nameを省略できる
  - `::salute`など
  - `::Person`とclass constructorを参照することもできる
- `collections.count`の引数にpredicateを渡すと合致する個数だけを計算できる
  - `collections.filter {}.size`よりも計算コストが低い
- `collections.find`は`firstOrNull`と同じ
- `groupBy`は指定したフィールドの値をキーとしてMapを作成する
- `flatMap`はmapしてからflatten
- lazyy collectionはSequence
- `filter`は最初に実行すると良い
- JavaのSAM(Single Abstract Methid) interfaceにはKotlinのlambdaを直接渡せる
- `with`は引数のObjectをreceiverとするlambda関数を引数に取れる
- `apply`は呼び出し元のObjectをreceiverとするlambda関数を引数に取れる
-
