---
title: Kotlin In Action Chapter 4のまとめ
publish_date: 2022-04-11
description: Kotlin In Action Chapter 4を読んで気になったこと
---

- 継承による破壊を防ぐために継承できるclassには`open` modifierをつける、デフォルトは継承不可
- openのものを継承した後に、更なる継承を防ぐためには`final`をつける
- `abstract` classの`abstract` methodには`open`は必要ない、`abstract` method以外には`open`が必要
- `interface` memberは常に`open`
- `internal`はmodule(一緒にコンパイルされるファイルのみ)内のみでしか参照できない、他のライブラリなどからは参照できない、Goのinternalと同じ
- class自体の可視性を超えるものをmethodに設定できない
  - e.g. internal classがpublic methodを持つ
- external functionは`protected`と`private`にはアクセスできない
- `internal`はbytecodeでは`public`に変換される
- javaではnested classはouter classから参照される
  - kotlinではclassに`inner`をつけると同じようになる
- `sealed`つけるとsubclassを限定できる
  - `when`で該当しないclassの確認が必要なくなる
- `private constructor`をつけると外部からインスタンスを作成できない(Javaのprivate constructorと同じ)
  - Factoryでインスタンスを作成する感じかな
  - `object`でsingletonが保証されているのでこれを使う場面はいつ？
    - `object`はパラメータを設定できないので、パラメータを外部から設定する場合に使う(主にFactory)
- secondary constructorは`constructor`をclass内部で宣言する
  - 元クラスの継承する場合は`: super`、自クラスを継承する場合は`: this`
- propertyのsetでは`field`から現在の値を取得することができる
- `data class`は`toString`, `hashCode`, `equals`をコンパイラが生成してくれる
- `by <some class>`で実装すべきinterfaceのmemberにsome classのものを利用できる
  - 個別で実装したいものは`override`で実装する
- `object class`は状態をconstructorを定義できない
  - 状態を保つことは推奨されない
- Kotlinの`object class`はJavaでは`INSTANCE`で利用する
- `companion object`で外部からclassのmemberに直接アクセスできる
  - Javaの`static`
- `companion object`からはclassのすべてのmemberにアクセスできる
- `companion object`はsubclassから継承されない
- `companion object`でinterfaceを実装した場合、引数がinterfaceのところにclassを指定する
  - `class.<companion object member>`なので当たり前といえばそう
- `companion object`にextension
  functionを実装する場合は、`companion object`の実装がからでも定義だけはしなければならない
- `object`で無名objectを作成できる、この場合はsingletonではない
