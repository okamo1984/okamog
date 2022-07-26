---
title: モノリスからマイクロサービスへ 1章
publish_date: 2022-04-23
---

## まとめ

> マイクロサービスとは、カプセル化されたビジネス機能を1つ以上のネットワークエンドポイントを介して公開するもの

マイクロサービスは特定のドメインに特化したサービスと認識している。

> 独立デプロイ可能性

コードレベルの分離ではなくデプロイが分離されていなければならない。

> 変更を容易にしたいのであれば、技術ではなく、ビジネス機能のまとまりに基づいてコードをグループ化する必要がある

DDDで言われていることのような気がする。

> マイクロサービスにおいてはデータベースの共有は最悪

他のサービスが自分達のドメインに直接触ることができるIFを用意してはいけない。納得。

> マイクロサービスにおいてはサービスはそれを管理するチームのものであり、技術や品質は他のサービスに合わせる必要はない

ここが認識ずれてた。プロダクトを複数のサービスの集合と考えるのではなく、サービスを一つのプロダクトとみなす。なるほど。

> マイクロサービスにはUIも含まれる

ここのイメージがつかない。今後の章に期待。ページとサービスが紐づくという感じなのだろうか。

> モノリスでは厳密に疎結合は存在しない

コードが共有されているので、デプロイ単位で見れば密結合になる。

> あるサービスが管理しているデータベースに他のサービスがアクセスするとき

利用される側がAPIを公開するか、データベースのビューを公開すると良い。

> マイクロサービスは継続的デリバリーを容易にするアーキテクチャ

なるほど。その視点はなかった。CI/CDによるデプロイが継続的デリバリーと勘違いしていた。

> 集約はシステム内のあるドメイン概念に焦点を当てた自己完結型の状態マシン

状態を持つということは特定の関連があるドメインの集合ということかな。ドメインの状態繊維は集約内で閉じていて外部に公開されない。

> マイクロサービスと集約、境界づけられたコンテキストのマッピング

最初は境界づけられたコンテキストとマッピングして、より小さな単位に分割するのであれば集約とマッピングする