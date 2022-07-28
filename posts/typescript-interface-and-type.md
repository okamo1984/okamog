---
title: TypeScriptのInterfaceとTypeを考える
publish_date: 2022-07-28
tags: [TypeScript]
---

TypeScriptで独自の型を使用する方法に`type aliases`と`interface`がある。どちらも開発上は同じ体験を得られるものであると思うが、どのような違いがあり、どのような時にどちらを使用するのが良いか気になっていたので調べた。

## 参考にしたもの

- https://blog.logrocket.com/types-vs-interfaces-in-typescript/

### type aliases

- Union, intersection, tuple, など複雑な型を定義する場合に有効
- functionsを実装するときに使うのが良い
  - FPのように実装しているとき？

### interface

- 元の型を拡張できる
  - classをinterfaceで拡張できる、逆も然り
- object, methodを定義するときに使うのが良い
  - OOPのように実装しているとき？

## Interfaces vs. Intersections

https://www.typescriptlang.org/docs/handbook/2/objects.html#interfaces-vs-intersections

what's conflict?

## 自分の中の結論

- FPのように実装したいときは`type aliases`を採用する
- OOPのように実装したいときは`interface`を採用する
