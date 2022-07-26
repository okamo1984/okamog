---
title: Cloud RunでKotlin(Ktor)を実行する
publish_date: 2022-03-28
---

## OpenJDKとGradleをインストール（またはアップグレード）する

1. Homebrewを使用してOpenJDKとGradleをインストール

```bash
brew install openjdk gradle
```

2. `.zshrc`にパスを設定する

```
# Javaのみ/usr/bin/javaが使用されていたので設定した
export PATH=/opt/homebrew/Cellar/openjdk/17.0.2/bin:$PATH
```

3. Gradleのoh-my-zshの補完機能を取得する

[GitHubのリポジトリ](https://github.com/gradle/gradle-completion)を見て有効にする

```bash
git clone https://github.com/gradle/gradle-completion ~/.oh-my-zsh/plugins/gradle-completion
```

4. `.zshrc`のoh-my-zshプラグインに追加する

```
plugins+=(gradle-completion)
```

## Kotlinのアプリケーションを作成する

- [Gradleのドキュメント](https://docs.gradle.org/current/samples/sample_building_kotlin_applications.html)の通りに作成する
- Kotlinのバージョンが古いので`app/build.gradle.kts`の`plugins`を以下のように変更する

  ```kotlin{3}
  plugins {
      // Apply the org.jetbrains.kotlin.jvm Plugin to add support for Kotlin.
      id("org.jetbrains.kotlin.jvm") version "1.6.10"

      // Apply the application plugin to add support for building a CLI application in Java.
      application
  }
  ```
- Java1.8でコンパイルするように`app/build.gradle.kts`に以下を追加する

  ```kotlin
  // 参考: https://stackoverflow.com/questions/69079963/how-to-set-compilejava-task-11-and-compilekotlin-task-1-8-jvm-target-com
  java {
      sourceCompatibility = JavaVersion.VERSION_1_8
      targetCompatibility = JavaVersion.VERSION_1_8
  }

  tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
      kotlinOptions {
          jvmTarget = "1.8"
      }
  }
  ```

## KtorでWeb APIを実装する

- [Ktorを依存ライブラリに追加する](https://ktor.io/docs/gradle.html#add-ktor-dependencies)
- [Embedded Serverを利用してWeb APIを実装する](https://ktor.io/docs/gradle.html#create-embedded-server)

## ローカルで動くことを確認する

- `./gradlew run`を実行する
- `curl localhost:8080`で`Hello, world!`が返ってくることを確認する

## Dockerfileを作成する

- Cloud Buildで自動でDockerイメージを作成するように設定する
- Dockerfileを作成する

  ```dockerfile
  FROM gradle:7.4.1-jdk8 as builder

  COPY setting.gradle.kts .
  COPY app ./app

  RUN gradle installDist

  FROM openjdk:8-jre-alpine

  COPY --from=builder /home/gradle/app/build/install/app/ /app/
  WORKDIR /app/bin
  CMD [ "./app" ]
  ```

## Cloud Runにデプロイする

- `gcloud auth login`でGCPにログインする
- `cloudbuild.yml`を作成する

  ```yml
  steps:
  - name: "gcr.io/google.com/cloudsdktool/cloud-sdk"
      id: Deploy Cloud Run
      entrypoint: "gcloud"
      args:
      - "run"
      - "deploy"
      - "cloud-run-kotlin-demo"
      - "--region"
      - "asia-northeast1"
      - "--image"
      - "asia-northeast1-docker.pkg.dev/$PROJECT_ID/cloud-run-kotlin-demo/ktor:$SHORT_SHA"
  ```

- Pub/SubをTriggerとするCloud RunのTriggerを作成する
  - Pub/SubのTopicには`gcr`を指定する
  - Configurationには`cloudbuild.yml`を指定する
- GitHubの`main`ブランチへのPushをTriggerとするCloud RunのTriggerを作成する
  - Configurationには`Dockerfile`を指定する
- GitHubの`main`ブランチにPushする

## 参考文献

- [KtorをGradleのプロジェクトに追加する](https://ktor.io/docs/gradle.html)
- [Cloud RunでKotlinを実行するサンプル](https://github.com/knative/docs/tree/9b91636145c789cbeb389829a9ac734d6bd2bc83/docs/serving/samples/hello-world/helloworld-kotlin)
- [Cloud Runにデプロイする](https://cloud.google.com/run/docs/deploying)
- [KtorのDockerイメージを作成する](https://ktor.io/docs/docker.html#prepare-docker-image)
- [KotlinをコンパイルするJavaのバージョン指定](https://stackoverflow.com/questions/69079963/how-to-set-compilejava-task-11-and-compilekotlin-task-1-8-jvm-target-com)
- [Docker HubのGradle](https://hub.docker.com/_/gradle/)
- [Pub/SubのイベントをTriggerとしてCloud Buildを実行する](https://cloud.google.com/build/docs/automating-builds/create-pubsub-triggers#ar_build_trigger)
- [Artifact RegistryからPub/Subに通知を送信する](https://cloud.google.com/artifact-registry/docs/configure-notifications)
- [Cloud BuildからCloud Runにデプロイする](https://cloud.google.com/build/docs/deploying-builds/deploy-cloud-run)
