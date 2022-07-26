---
title: VuePressで簡単にブログを作成する
publish_date: 2022-03-26
---

## モチベーション

SaaSではなく自分でホスティングしてドキュメントを管理したかった

## 候補となったツール

- [Docusaurus](https://docusaurus.io/)
- [VitePress](https://vitepress.vuejs.org/)
- [VuePress](https://v2.vuepress.vuejs.org/)

## なぜVuePressを採用したか

DocusaurusはReactで実装されているので利用したかったのだが、ビルドツールにWebpackを使用しているためビルドが耐え難い遅さだったので不採用。VitePressは機能が少なすぎて簡単に作成できないと感じたので不採用。VuePressはビルドツールに[Vite](https://vitejs.dev/)を使用していて機能も豊富だったので採用した。

## VuePressでシンプルなブログサイトを作成するためにやったこと

1. [インストールのドキュメント](https://v2.vuepress.vuejs.org/guide/getting-started.html)を読んでVuePressをインストールする
2. [設定のドキュメント](https://v2.vuepress.vuejs.org/reference/config.html)を参考に`config.ts`を作成してNavbarやSidebarを削除してシンプルなデザインにする

   ```ts
   import { defineUserConfig } from "vuepress";
   import type { DefaultThemeOptions } from "vuepress";

   export default defineUserConfig<DefaultThemeOptions>({
     lang: "ja-JP",
     title: "やったこと",
     description: "やったことをまとめたブログ",

     theme: "@vuepress/theme-default",
     themeConfig: {
       sidebar: false,
       navbar: false,
     },
   });
   ```

## ブログ記事をMarkdownで作成する

`README.md`と同じディレクトリに好きな記事を作成して`README.md`にリンクを追加します

## ブログをデプロイする

[GitHub Pages](https://v2.vuepress.vuejs.org/guide/deployment.html#github-pages)にデプロイする。
リンク先に書かれているように、設定の`base`にリポジトリ名を設定する。 また、GitHub
Pagesの設定にあるSourceのBranchに`gh-pages`を、folderに`root`を選択してSaveする。
ここまで設定すれば、`main`ブランチの更新でGitHub Actionsにより自動でデプロイされる。

## コードをコピーするボタンを追加する

[Quick Code Copy](https://vuepress-theme-hope.github.io/v2/copy-code/)を使用する。`config.ts`にコピーする時のラベルやポップアップの文章を追加する。

```ts
export default defineUserConfig<DefaultThemeOptions>({
  // この部分を追加する
  plugins: [
    copyCode({
      locales: {
        "/": {
          copy: "コードをコピーしました！",
          hint: "コピー",
        },
      },
    }),
  ],
});
```
